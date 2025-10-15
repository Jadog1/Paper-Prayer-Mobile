import 'package:prayer_ml/prayers/groups/models/contact_model.dart';

/// Types of content items in batch mode
enum BatchContentItemType {
  prayerRequest,
  contact,
  ambiguousContact,
}

/// Represents a single line item in batch paper mode
/// Can be either a prayer request or a contact
class BatchContentItem {
  const BatchContentItem({
    required this.id,
    required this.type,
    required this.content,
    this.contact,
    this.possibleContacts,
  }) : assert(
          type != BatchContentItemType.contact || contact != null,
          'Contact must be provided when type is contact',
        ),
        assert(
          type != BatchContentItemType.ambiguousContact || (possibleContacts != null && possibleContacts.length > 1),
          'possibleContacts must be provided with multiple items when type is ambiguousContact',
        );

  final String id;
  final BatchContentItemType type;
  final String content;
  final Contact? contact;
  final List<Contact>? possibleContacts;

  bool get isPrayerRequest => type == BatchContentItemType.prayerRequest;
  bool get isContact => type == BatchContentItemType.contact;
  bool get isAmbiguousContact => type == BatchContentItemType.ambiguousContact;
  bool get isResolved => !isAmbiguousContact;

  BatchContentItem copyWith({
    String? id,
    BatchContentItemType? type,
    String? content,
    Contact? contact,
    List<Contact>? possibleContacts,
  }) {
    return BatchContentItem(
      id: id ?? this.id,
      type: type ?? this.type,
      content: content ?? this.content,
      contact: contact ?? this.contact,
      possibleContacts: possibleContacts ?? this.possibleContacts,
    );
  }

  /// Resolve an ambiguous contact by selecting one of the possible contacts
  BatchContentItem resolveContact(Contact selectedContact) {
    if (!isAmbiguousContact) {
      throw StateError('Cannot resolve a non-ambiguous contact');
    }
    return copyWith(
      type: BatchContentItemType.contact,
      contact: selectedContact,
      possibleContacts: null,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BatchContentItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type &&
          content == other.content &&
          contact == other.contact;

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      content.hashCode ^
      contact.hashCode;
}
