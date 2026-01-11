import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';

part 'generated/usage_history_model.freezed.dart';
part 'generated/usage_history_model.g.dart';

@freezed
class PaginatedGenAIUsageHistory with _$PaginatedGenAIUsageHistory {
  const factory PaginatedGenAIUsageHistory({
    required List<GenAIUsageHistoryItem> items,
    required GenAIUsageHistoryPagination pagination,
    @JsonKey(name: 'has_next') required bool hasNext,
  }) = _PaginatedGenAIUsageHistory;

  factory PaginatedGenAIUsageHistory.fromJson(Map<String, dynamic> json) =>
      _$PaginatedGenAIUsageHistoryFromJson(json);
}

@freezed
class GenAIUsageHistoryPagination with _$GenAIUsageHistoryPagination {
  const factory GenAIUsageHistoryPagination({
    String? cursor,
    required int limit,
  }) = _GenAIUsageHistoryPagination;

  factory GenAIUsageHistoryPagination.fromJson(Map<String, dynamic> json) =>
      _$GenAIUsageHistoryPaginationFromJson(json);
}

@freezed
class GenAIUsageHistoryItem with _$GenAIUsageHistoryItem {
  const factory GenAIUsageHistoryItem({
    required GenAIUsage usage,
    @JsonKey(name: 'prayer_request') PrayerRequest? prayerRequest,
    @JsonKey(name: 'paper_study_title') String? paperStudyTitle,
    UsageCostDetail? cost,
  }) = _GenAIUsageHistoryItem;

  factory GenAIUsageHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$GenAIUsageHistoryItemFromJson(json);
}

@freezed
class GenAIUsage with _$GenAIUsage {
  const factory GenAIUsage({
    required int id,
    required String model,
    @JsonKey(name: 'tokens_used') int? tokensUsed,
    @JsonKey(name: 'prompt_tokens') int? promptTokens,
    @JsonKey(name: 'completion_tokens') int? completionTokens,
    @JsonKey(name: 'cached_tokens') int? cachedTokens,
    required String caller,
    @JsonKey(name: 'account_id') required int accountId,
    required String endpoint,
    @JsonKey(name: 'request_metadata')
    @Default({})
    Map<String, dynamic> requestMetadata,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'prayer_request_pipeline_step_id')
    int? prayerRequestPipelineStepId,
    @JsonKey(name: 'paper_study_pipeline_step_id')
    int? paperStudyPipelineStepId,
  }) = _GenAIUsage;

  factory GenAIUsage.fromJson(Map<String, dynamic> json) =>
      _$GenAIUsageFromJson(json);
}

@freezed
class UsageCostDetail with _$UsageCostDetail {
  const factory UsageCostDetail({
    @JsonKey(name: 'prompt_cost') required double promptCost,
    @JsonKey(name: 'completion_cost') required double completionCost,
    @JsonKey(name: 'cached_cost') required double cachedCost,
    @JsonKey(name: 'total_cost') required double totalCost,
  }) = _UsageCostDetail;

  factory UsageCostDetail.fromJson(Map<String, dynamic> json) =>
      _$UsageCostDetailFromJson(json);
}
