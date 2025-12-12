// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pipeline_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PipelineStepDTOImpl _$$PipelineStepDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$PipelineStepDTOImpl(
      id: (json['id'] as num).toInt(),
      stepType: $enumDecode(_$PipelineStepTypeEnumMap, json['step_type']),
      status: $enumDecode(_$PipelineStepStatusEnumMap, json['status']),
      attemptCount: (json['attempt_count'] as num).toInt(),
      startedAt: json['started_at'] as String?,
      completedAt: json['completed_at'] as String?,
      errorMessage: json['error_message'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$PipelineStepDTOImplToJson(
        _$PipelineStepDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'step_type': _$PipelineStepTypeEnumMap[instance.stepType]!,
      'status': _$PipelineStepStatusEnumMap[instance.status]!,
      'attempt_count': instance.attemptCount,
      'started_at': instance.startedAt,
      'completed_at': instance.completedAt,
      'error_message': instance.errorMessage,
      'metadata': instance.metadata,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

const _$PipelineStepTypeEnumMap = {
  PipelineStepType.save: 'save',
  PipelineStepType.extractMetadata: 'extract_metadata',
  PipelineStepType.saveFeatures: 'save_features',
  PipelineStepType.saveEmbeddings: 'save_embeddings',
  PipelineStepType.buildCollection: 'build_collection',
  PipelineStepType.bibleRecommendation: 'bible_recommendation',
  PipelineStepType.schedulingIntelligence: 'scheduling_intelligence',
};

const _$PipelineStepStatusEnumMap = {
  PipelineStepStatus.pending: 'pending',
  PipelineStepStatus.inProgress: 'in_progress',
  PipelineStepStatus.completed: 'completed',
  PipelineStepStatus.failed: 'failed',
  PipelineStepStatus.skipped: 'skipped',
};

_$PipelineRunDTOImpl _$$PipelineRunDTOImplFromJson(Map<String, dynamic> json) =>
    _$PipelineRunDTOImpl(
      id: json['id'] as String,
      prayerRequestId: (json['prayer_request_id'] as num).toInt(),
      accountId: (json['account_id'] as num).toInt(),
      enforcedCollectionId: (json['enforced_collection_id'] as num?)?.toInt(),
      startedAt: json['started_at'] as String,
      completedAt: json['completed_at'] as String?,
      status: $enumDecode(_$PipelineStepStatusEnumMap, json['status']),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => PipelineStepDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PipelineRunDTOImplToJson(
        _$PipelineRunDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prayer_request_id': instance.prayerRequestId,
      'account_id': instance.accountId,
      'enforced_collection_id': instance.enforcedCollectionId,
      'started_at': instance.startedAt,
      'completed_at': instance.completedAt,
      'status': _$PipelineStepStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'steps': instance.steps,
    };
