import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_content_item.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';

/// Represents the current wizard step in batch paper mode
enum BatchPaperModeStep {
  groupSelection,
  contentEditing,
}

/// Represents the current mode (edit or read) in the content editing step
enum ContentMode {
  edit,
  read,
}

/// State for the BatchPaperMode widget
class BatchPaperModeState {
  const BatchPaperModeState({
    this.currentStep = BatchPaperModeStep.groupSelection,
    this.contentMode = ContentMode.edit,
    this.selectedGroup,
    this.rawContent = '',
    this.parsedItems = const [],
    this.isSubmitting = false,
    this.errorMessage,
  });

  final BatchPaperModeStep currentStep;
  final ContentMode contentMode;
  final GroupWithMembers? selectedGroup;
  final String rawContent;
  final List<BatchContentItem> parsedItems;
  final bool isSubmitting;
  final String? errorMessage;

  bool get isEditMode => contentMode == ContentMode.edit;
  bool get isReadMode => contentMode == ContentMode.read;
  bool get canSubmit => parsedItems.isNotEmpty && parsedItems.every((item) => item.isResolved);
  bool get hasUnresolvedContacts => parsedItems.any((item) => item.isAmbiguousContact);

  BatchPaperModeState copyWith({
    BatchPaperModeStep? currentStep,
    ContentMode? contentMode,
    GroupWithMembers? selectedGroup,
    String? rawContent,
    List<BatchContentItem>? parsedItems,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return BatchPaperModeState(
      currentStep: currentStep ?? this.currentStep,
      contentMode: contentMode ?? this.contentMode,
      selectedGroup: selectedGroup ?? this.selectedGroup,
      rawContent: rawContent ?? this.rawContent,
      parsedItems: parsedItems ?? this.parsedItems,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
    );
  }

  BatchPaperModeState clearError() {
    return copyWith(errorMessage: null);
  }

  BatchPaperModeState setError(String error) {
    return copyWith(errorMessage: error);
  }

  BatchPaperModeState toggleMode() {
    return copyWith(
      contentMode: isEditMode ? ContentMode.read : ContentMode.edit,
    );
  }

  BatchPaperModeState nextStep() {
    if (currentStep == BatchPaperModeStep.groupSelection) {
      return copyWith(currentStep: BatchPaperModeStep.contentEditing);
    }
    return this;
  }

  BatchPaperModeState previousStep() {
    if (currentStep == BatchPaperModeStep.contentEditing) {
      return copyWith(currentStep: BatchPaperModeStep.groupSelection);
    }
    return this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BatchPaperModeState &&
          runtimeType == other.runtimeType &&
          currentStep == other.currentStep &&
          contentMode == other.contentMode &&
          selectedGroup == other.selectedGroup &&
          rawContent == other.rawContent &&
          parsedItems == other.parsedItems &&
          isSubmitting == other.isSubmitting &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode =>
      currentStep.hashCode ^
      contentMode.hashCode ^
      selectedGroup.hashCode ^
      rawContent.hashCode ^
      parsedItems.hashCode ^
      isSubmitting.hashCode ^
      errorMessage.hashCode;
}
