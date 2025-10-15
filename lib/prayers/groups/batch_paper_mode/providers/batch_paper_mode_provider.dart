import 'dart:developer' as developer;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_content_item.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_paper_mode_state.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/utils/content_parser.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/batch_paper_mode_provider.g.dart';

@riverpod
class BatchPaperModeNotifier extends _$BatchPaperModeNotifier {
  @override
  BatchPaperModeState build(BatchPaperModeConfig config) {
    // Initialize state based on config
    final initialStep = config.skipGroupSelection
        ? BatchPaperModeStep.contentEditing
        : BatchPaperModeStep.groupSelection;

    final initialContentMode = config.autoParseOnLoad && config.prefillContent != null
        ? ContentMode.read
        : ContentMode.edit;

    final initialParsedItems = config.autoParseOnLoad && 
        config.prefillContent != null && 
        config.groupContacts != null
        ? ContentParser.parseToItems(config.prefillContent!, config.groupContacts!)
        : <BatchContentItem>[];

    return BatchPaperModeState(
      currentStep: initialStep,
      contentMode: initialContentMode,
      selectedGroup: config.groupContacts,
      rawContent: config.prefillContent ?? '',
      parsedItems: initialParsedItems,
    );
  }

  /// Select a group and move to content editing
  void selectGroup(GroupWithMembers group) {
    state = state.copyWith(
      selectedGroup: group,
      currentStep: BatchPaperModeStep.contentEditing,
    );
  }

  /// Update raw content in edit mode
  void updateRawContent(String content) {
    state = state.copyWith(rawContent: content);
  }

  /// Toggle between edit and read mode
  void toggleMode() {
    if (state.isEditMode) {
      // Switching to read mode - parse content
      _parseContent();
    } else {
      // Switching to edit mode - convert items back to text
      _convertToRawText();
    }
  }

  /// Parse raw content into structured items
  void _parseContent() {
    if (state.selectedGroup == null) {
      state = state.setError('No group selected');
      return;
    }

    try {
      final items = ContentParser.parseToItems(
        state.rawContent,
        state.selectedGroup!,
      );

      state = state.copyWith(
        contentMode: ContentMode.read,
        parsedItems: items,
        errorMessage: null,
      );
    } catch (e) {
      state = state.setError('Error parsing content: $e');
    }
  }

  /// Convert items back to raw text
  void _convertToRawText() {
    try {
      final rawText = ContentParser.itemsToRawText(state.parsedItems);

      state = state.copyWith(
        contentMode: ContentMode.edit,
        rawContent: rawText,
        errorMessage: null,
      );
    } catch (e) {
      state = state.setError('Error converting to text: $e');
      developer.log('Error submitting batch prayer requests: $e');
    }
  }

  /// Detect paste and automatically switch to read mode
  void handlePaste(String pastedContent) {
    state = state.copyWith(rawContent: pastedContent);
    if (state.isEditMode && state.selectedGroup != null) {
      _parseContent();
    }
  }

  /// Update a specific item
  void updateItem(String itemId, BatchContentItem updatedItem) {
    final updatedItems = state.parsedItems.map((item) {
      return item.id == itemId ? updatedItem : item;
    }).toList();

    state = state.copyWith(parsedItems: updatedItems);
  }

  /// Delete an item
  void deleteItem(String itemId) {
    final updatedItems = state.parsedItems.where((item) => item.id != itemId).toList();
    state = state.copyWith(parsedItems: updatedItems);
  }

  /// Reorder items (for drag and drop)
  void reorderItems(int oldIndex, int newIndex) {
    final items = List<BatchContentItem>.from(state.parsedItems);
    
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    
    state = state.copyWith(parsedItems: items);
  }

  /// Resolve an ambiguous contact
  void resolveAmbiguousContact(String itemId, Contact selectedContact) {
    final updatedItems = state.parsedItems.map((item) {
      if (item.id == itemId && item.isAmbiguousContact) {
        return item.resolveContact(selectedContact);
      }
      return item;
    }).toList();

    state = state.copyWith(parsedItems: updatedItems);
  }

  /// Submit all prayer requests
  Future<void> submitAll() async {
    if (!state.canSubmit) {
      state = state.setError('Cannot submit: Please resolve all ambiguous contacts');
      return;
    }

    if (state.selectedGroup == null) {
      state = state.setError('No group selected');
      return;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);

    try {
      // Group prayer requests by contact
      final requestsByContact = <Contact, List<String>>{};
      Contact? currentContact;

      for (final item in state.parsedItems) {
        if (item.isContact) {
          currentContact = item.contact;
        } else if (item.isPrayerRequest) {
          if (currentContact == null) {
            state = state.copyWith(isSubmitting: false);
            state = state.setError('Prayer request found without an associated contact');
            return;
          }
          requestsByContact.putIfAbsent(currentContact, () => []);
          requestsByContact[currentContact]!.add(item.content);
        }
      }

      // Build batch request
      final requests = <PrayerRequest>[];
      for (final entry in requestsByContact.entries) {
        final contact = entry.key;
        final prayerTexts = entry.value;

        for (final text in prayerTexts) {
          var foundContactGroupPair = state.selectedGroup!.memberWithContactGroupPairs.firstWhere(
            (pair) => pair.contact.id == contact.id
          );
          requests.add(PrayerRequest(
            id: 0,
            description: text,
            user: contact,
            group: foundContactGroupPair.groupPair,
            createdAt: DateTime.now().toIso8601String(),
            relatedContactIds: [],
          ));
        }
      }

      // Submit to API
      final prayerApi = Config().prayerRequestApiClient;
      await prayerApi.batchInsertRequests(requests);

      // Invalidate relevant providers to refresh data
      ref.invalidate(prayerRequestRepoProvider);
      ref.invalidate(groupContactsRepoProvider);

      state = state.copyWith(isSubmitting: false);
    } catch (e) {
      state = state.copyWith(isSubmitting: false);
      state = state.setError('Error submitting requests');
      developer.log('Error submitting batch prayer requests: $e');
    }
  }

  /// Clear error message
  void clearError() {
    state = state.clearError();
  }
}
