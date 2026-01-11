// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../usage_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedGenAIUsageHistoryImpl _$$PaginatedGenAIUsageHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedGenAIUsageHistoryImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => GenAIUsageHistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: GenAIUsageHistoryPagination.fromJson(
          json['pagination'] as Map<String, dynamic>),
      hasNext: json['has_next'] as bool,
    );

Map<String, dynamic> _$$PaginatedGenAIUsageHistoryImplToJson(
        _$PaginatedGenAIUsageHistoryImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'pagination': instance.pagination,
      'has_next': instance.hasNext,
    };

_$GenAIUsageHistoryPaginationImpl _$$GenAIUsageHistoryPaginationImplFromJson(
        Map<String, dynamic> json) =>
    _$GenAIUsageHistoryPaginationImpl(
      cursor: json['cursor'] as String?,
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$$GenAIUsageHistoryPaginationImplToJson(
        _$GenAIUsageHistoryPaginationImpl instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'limit': instance.limit,
    };

_$GenAIUsageHistoryItemImpl _$$GenAIUsageHistoryItemImplFromJson(
        Map<String, dynamic> json) =>
    _$GenAIUsageHistoryItemImpl(
      usage: GenAIUsage.fromJson(json['usage'] as Map<String, dynamic>),
      prayerRequest: json['prayer_request'] == null
          ? null
          : PrayerRequest.fromJson(
              json['prayer_request'] as Map<String, dynamic>),
      paperStudyTitle: json['paper_study_title'] as String?,
      cost: json['cost'] == null
          ? null
          : UsageCostDetail.fromJson(json['cost'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GenAIUsageHistoryItemImplToJson(
        _$GenAIUsageHistoryItemImpl instance) =>
    <String, dynamic>{
      'usage': instance.usage,
      'prayer_request': instance.prayerRequest,
      'paper_study_title': instance.paperStudyTitle,
      'cost': instance.cost,
    };

_$GenAIUsageImpl _$$GenAIUsageImplFromJson(Map<String, dynamic> json) =>
    _$GenAIUsageImpl(
      id: (json['id'] as num).toInt(),
      model: json['model'] as String,
      tokensUsed: (json['tokens_used'] as num?)?.toInt(),
      promptTokens: (json['prompt_tokens'] as num?)?.toInt(),
      completionTokens: (json['completion_tokens'] as num?)?.toInt(),
      cachedTokens: (json['cached_tokens'] as num?)?.toInt(),
      caller: json['caller'] as String,
      accountId: (json['account_id'] as num).toInt(),
      endpoint: json['endpoint'] as String,
      requestMetadata:
          json['request_metadata'] as Map<String, dynamic>? ?? const {},
      createdAt: json['created_at'] as String,
      prayerRequestPipelineStepId:
          (json['prayer_request_pipeline_step_id'] as num?)?.toInt(),
      paperStudyPipelineStepId:
          (json['paper_study_pipeline_step_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$GenAIUsageImplToJson(_$GenAIUsageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'tokens_used': instance.tokensUsed,
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'cached_tokens': instance.cachedTokens,
      'caller': instance.caller,
      'account_id': instance.accountId,
      'endpoint': instance.endpoint,
      'request_metadata': instance.requestMetadata,
      'created_at': instance.createdAt,
      'prayer_request_pipeline_step_id': instance.prayerRequestPipelineStepId,
      'paper_study_pipeline_step_id': instance.paperStudyPipelineStepId,
    };

_$UsageCostDetailImpl _$$UsageCostDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$UsageCostDetailImpl(
      promptCost: (json['prompt_cost'] as num).toDouble(),
      completionCost: (json['completion_cost'] as num).toDouble(),
      cachedCost: (json['cached_cost'] as num).toDouble(),
      totalCost: (json['total_cost'] as num).toDouble(),
    );

Map<String, dynamic> _$$UsageCostDetailImplToJson(
        _$UsageCostDetailImpl instance) =>
    <String, dynamic>{
      'prompt_cost': instance.promptCost,
      'completion_cost': instance.completionCost,
      'cached_cost': instance.cachedCost,
      'total_cost': instance.totalCost,
    };
