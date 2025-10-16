import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_content_item.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// Utility class for parsing content between edit and read modes
class ContentParser {
  /// Parse raw text content into structured BatchContentItems
  /// 
  /// Rules:
  /// - Each new line is a separate item
  /// - Empty lines are skipped
  /// - Lines are trimmed of trailing/leading spaces
  /// - Lines starting with bullet points (-, *, •) or numbers (1., 2.) have them removed
  /// - Lines < 150 characters are checked for contact names
  /// - If a name is detected and matches exactly one contact, create a contact item
  /// - If a name matches multiple contacts, create an ambiguous contact item
  /// - If a name is detected but has other text, treat as prayer request
  /// - All other lines are prayer requests
  static List<BatchContentItem> parseToItems(
    String rawContent,
    GroupWithMembers groupContacts,
  ) {
    final lines = rawContent.split('\n');
    final items = <BatchContentItem>[];

    for (final line in lines) {
      // Trim the line
      var trimmedLine = line.trim();

      // Skip empty lines
      if (trimmedLine.isEmpty) continue;

      // Remove any lines that do not contain alphabetic characters
      if (!RegExp(r'[a-zA-Z]').hasMatch(trimmedLine)) continue;

      // Remove bullet points and numbers
      trimmedLine = _removeBulletPoints(trimmedLine);

      // Check if this could be a contact (< 150 characters)
      if (trimmedLine.length < 150) {
        final contactMatch = _findContactMatches(trimmedLine, groupContacts.members);
        
        if (contactMatch.isExactMatch) {
          // Single exact match - create contact item
          items.add(BatchContentItem(
            id: _uuid.v4(),
            type: BatchContentItemType.contact,
            content: trimmedLine,
            contact: contactMatch.contacts.first,
          ));
          continue;
        } else if (contactMatch.isAmbiguous) {
          // Multiple matches - create ambiguous contact item
          items.add(BatchContentItem(
            id: _uuid.v4(),
            type: BatchContentItemType.ambiguousContact,
            content: trimmedLine,
            possibleContacts: contactMatch.contacts,
          ));
          continue;
        }
      }

      // Default to prayer request
      items.add(BatchContentItem(
        id: _uuid.v4(),
        type: BatchContentItemType.prayerRequest,
        content: trimmedLine,
      ));
    }

    return items;
  }

  /// Convert structured items back to raw text
  /// 
  /// Rules:
  /// - Each prayer request becomes its own line
  /// - Each contact becomes its own line with the full name
  static String itemsToRawText(List<BatchContentItem> items) {
    final buffer = StringBuffer();

    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      
      if (item.isContact && item.contact != null) {
        if (i > 0) {
          buffer.writeln(); // Add a blank line before contacts except the first
        }
        buffer.writeln(item.contact!.name);
        buffer.writeln("-"*10);
      } else if (item.isAmbiguousContact) {
        if (i > 0) {
          buffer.writeln(); // Add a blank line before contacts except the first
        }
        // For ambiguous contacts, just use the content
        buffer.writeln(item.content);
        buffer.writeln("-"*10);
      } else {
        // Add a bullet point in the line
        buffer.writeln("- ${item.content}");
      }
    }

    return buffer.toString().trimRight();
  }

  /// Remove bullet points and numbering from the start of a line
  static String _removeBulletPoints(String line) {
    // Remove common bullet points
    final bulletPattern = RegExp(r'^[-*•]\s*');
    var result = line.replaceFirst(bulletPattern, '');

    // Remove numbering like "1.", "2.", etc.
    final numberPattern = RegExp(r'^\d+\.\s*');
    result = result.replaceFirst(numberPattern, '');

    return result.trim();
  }

  /// Find matching contacts for a given line of text
  static ContactMatch _findContactMatches(String line, List<Contact> contacts) {
    final partialMatch = <Contact>[];
    final exactMatches = <Contact>[];
    
    // Check if the line is ONLY a name (no other significant text)
    // We'll consider it "only a name" if it matches a contact and doesn't have
    // additional words that suggest it's a prayer request
    final words = line.toLowerCase().split(RegExp(r'\s+'));
    
    for (final contact in contacts) {
      final contactName = contact.name.toLowerCase();
      final contactNameParts = contactName.split(RegExp(r'\s+'));
      
      // Check for exact match (case insensitive)
      if (line.toLowerCase() == contactName) {
        partialMatch.add(contact);
        exactMatches.add(contact);
        continue;
      }

      // Check if any part of the contact's name appears in the line
      bool hasMatch = false;
      for (final namePart in contactNameParts) {
        if (words.contains(namePart)) {
          hasMatch = true;
          break;
        }
      }

      if (hasMatch) {
        // Only add if the line is short enough to be just a name
        // and doesn't have too many extra words
        if (words.length <= contactNameParts.length + 2) {
          partialMatch.add(contact);
        }
      }
    }

    if (exactMatches.isNotEmpty) {
      return ContactMatch(contacts: exactMatches);
    }
    return ContactMatch(contacts: partialMatch);
  }
}

/// Result of matching a line to contacts
class ContactMatch {
  const ContactMatch({required this.contacts});

  final List<Contact> contacts;

  bool get hasMatch => contacts.isNotEmpty;
  bool get isExactMatch => contacts.length == 1;
  bool get isAmbiguous => contacts.length > 1;
  bool get noMatch => contacts.isEmpty;
}
