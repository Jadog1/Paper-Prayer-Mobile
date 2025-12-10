import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'generated/usage_cost_model.freezed.dart';
part 'generated/usage_cost_model.g.dart';

@freezed
class UsageCostSummary with _$UsageCostSummary {
  const factory UsageCostSummary({
    @JsonKey(name: 'total_cost') required double totalCost,
    @JsonKey(name: 'total_requests') required int totalRequests,
    @JsonKey(name: 'total_tokens') required int totalTokens,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    required List<UsageCostBreakdown> breakdown,
    @JsonKey(name: 'monthly_spend_limit') required int monthlySpendLimit,
  }) = _UsageCostSummary;

  factory UsageCostSummary.fromJson(Map<String, dynamic> json) =>
      _$UsageCostSummaryFromJson(json);
}

@freezed
class UsageCostBreakdown with _$UsageCostBreakdown {
  const factory UsageCostBreakdown({
    required String model,
    required String caller,
    @JsonKey(name: 'total_requests') required int totalRequests,
    @JsonKey(name: 'total_tokens') required int totalTokens,
    @JsonKey(name: 'prompt_tokens') required int promptTokens,
    @JsonKey(name: 'completion_tokens') required int completionTokens,
    @JsonKey(name: 'cached_tokens') required int cachedTokens,
    @JsonKey(name: 'total_cost') required double totalCost,
  }) = _UsageCostBreakdown;

  factory UsageCostBreakdown.fromJson(Map<String, dynamic> json) =>
      _$UsageCostBreakdownFromJson(json);
}
