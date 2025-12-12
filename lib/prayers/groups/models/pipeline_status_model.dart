import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pipeline_status_model.freezed.dart';
part 'generated/pipeline_status_model.g.dart';

/// Status enum for pipeline runs and individual steps
enum PipelineStepStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('in_progress')
  inProgress,
  @JsonValue('completed')
  completed,
  @JsonValue('failed')
  failed,
  @JsonValue('skipped')
  skipped,
}

/// Type enum for pipeline steps
enum PipelineStepType {
  @JsonValue('save')
  save,
  @JsonValue('extract_metadata')
  extractMetadata,
  @JsonValue('save_features')
  saveFeatures,
  @JsonValue('save_embeddings')
  saveEmbeddings,
  @JsonValue('build_collection')
  buildCollection,
  @JsonValue('bible_recommendation')
  bibleRecommendation,
  @JsonValue('scheduling_intelligence')
  schedulingIntelligence,
}

/// Extension to get user-friendly display names for step types
extension PipelineStepTypeExtension on PipelineStepType {
  String get displayName {
    switch (this) {
      case PipelineStepType.save:
        return 'Saving Request';
      case PipelineStepType.extractMetadata:
        return 'Extracting Metadata';
      case PipelineStepType.saveFeatures:
        return 'Generating Features';
      case PipelineStepType.saveEmbeddings:
        return 'Creating Embeddings';
      case PipelineStepType.buildCollection:
        return 'Building Collection';
      case PipelineStepType.bibleRecommendation:
        return 'Finding Scripture';
      case PipelineStepType.schedulingIntelligence:
        return 'Scheduling Intelligence';
    }
  }

  String get shortName {
    switch (this) {
      case PipelineStepType.save:
        return 'Save';
      case PipelineStepType.extractMetadata:
        return 'Metadata';
      case PipelineStepType.saveFeatures:
        return 'Features';
      case PipelineStepType.saveEmbeddings:
        return 'Embeddings';
      case PipelineStepType.buildCollection:
        return 'Collection';
      case PipelineStepType.bibleRecommendation:
        return 'Scripture';
      case PipelineStepType.schedulingIntelligence:
        return 'Scheduling';
    }
  }
}

/// Extension to get user-friendly display info for status
extension PipelineStepStatusExtension on PipelineStepStatus {
  String get displayName {
    switch (this) {
      case PipelineStepStatus.pending:
        return 'Pending';
      case PipelineStepStatus.inProgress:
        return 'In Progress';
      case PipelineStepStatus.completed:
        return 'Completed';
      case PipelineStepStatus.failed:
        return 'Failed';
      case PipelineStepStatus.skipped:
        return 'Skipped';
    }
  }

  bool get isComplete =>
      this == PipelineStepStatus.completed ||
      this == PipelineStepStatus.skipped;
  bool get isFailed => this == PipelineStepStatus.failed;
  bool get isActive => this == PipelineStepStatus.inProgress;
  bool get isPending => this == PipelineStepStatus.pending;
}

/// Individual step in the pipeline
@freezed
class PipelineStepDTO with _$PipelineStepDTO {
  const factory PipelineStepDTO({
    required int id,
    @JsonKey(name: 'step_type') required PipelineStepType stepType,
    required PipelineStepStatus status,
    @JsonKey(name: 'attempt_count') required int attemptCount,
    @JsonKey(name: 'started_at') String? startedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'error_message') String? errorMessage,
    Map<String, dynamic>? metadata,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _PipelineStepDTO;

  factory PipelineStepDTO.fromJson(Map<String, dynamic> json) =>
      _$PipelineStepDTOFromJson(json);
}

/// Complete pipeline run with all steps
@freezed
class PipelineRunDTO with _$PipelineRunDTO {
  const factory PipelineRunDTO({
    required String id,
    @JsonKey(name: 'prayer_request_id') required int prayerRequestId,
    @JsonKey(name: 'account_id') required int accountId,
    @JsonKey(name: 'enforced_collection_id') int? enforcedCollectionId,
    @JsonKey(name: 'started_at') required String startedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    required PipelineStepStatus status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required List<PipelineStepDTO> steps,
  }) = _PipelineRunDTO;

  factory PipelineRunDTO.fromJson(Map<String, dynamic> json) =>
      _$PipelineRunDTOFromJson(json);
}

/// Helper extension to calculate progress and status
extension PipelineRunDTOExtension on PipelineRunDTO {
  /// Calculate overall progress (0.0 to 1.0)
  double get progress {
    if (steps.isEmpty) return 0.0;
    final completedSteps = steps.where((s) => s.status.isComplete).length;
    return completedSteps / steps.length;
  }

  /// Get the currently active step (if any)
  PipelineStepDTO? get activeStep {
    try {
      return steps.firstWhere((s) => s.status.isActive);
    } catch (_) {
      return null;
    }
  }

  /// Get the next pending step (if any)
  PipelineStepDTO? get nextPendingStep {
    try {
      return steps.firstWhere((s) => s.status.isPending);
    } catch (_) {
      return null;
    }
  }

  /// Check if the pipeline has any failed steps
  bool get hasFailed => steps.any((s) => s.status.isFailed);

  /// Check if the pipeline is complete
  bool get isComplete => status.isComplete;

  /// Check if the pipeline is still running
  bool get isRunning =>
      status == PipelineStepStatus.inProgress ||
      status == PipelineStepStatus.pending;

  /// Get a user-friendly status message
  String get statusMessage {
    if (hasFailed) {
      final failedStep = steps.firstWhere((s) => s.status.isFailed);
      return 'Failed at ${failedStep.stepType.shortName}';
    }
    if (isComplete) return 'Processing Complete';
    if (activeStep != null) {
      return activeStep!.stepType.displayName;
    }
    if (nextPendingStep != null) {
      return 'Starting ${nextPendingStep!.stepType.shortName}...';
    }
    return 'Processing...';
  }
}
