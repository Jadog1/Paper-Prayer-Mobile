// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../usage_cost_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UsageCostSummaryImpl _$$UsageCostSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$UsageCostSummaryImpl(
      totalCost: (json['total_cost'] as num).toDouble(),
      totalRequests: (json['total_requests'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      breakdown: (json['breakdown'] as List<dynamic>)
          .map((e) => UsageCostBreakdown.fromJson(e as Map<String, dynamic>))
          .toList(),
      monthlySpendLimit: (json['monthly_spend_limit'] as num).toInt(),
    );

Map<String, dynamic> _$$UsageCostSummaryImplToJson(
        _$UsageCostSummaryImpl instance) =>
    <String, dynamic>{
      'total_cost': instance.totalCost,
      'total_requests': instance.totalRequests,
      'total_tokens': instance.totalTokens,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'breakdown': instance.breakdown,
      'monthly_spend_limit': instance.monthlySpendLimit,
    };

_$UsageCostBreakdownImpl _$$UsageCostBreakdownImplFromJson(
        Map<String, dynamic> json) =>
    _$UsageCostBreakdownImpl(
      model: json['model'] as String,
      caller: json['caller'] as String,
      totalRequests: (json['total_requests'] as num).toInt(),
      totalTokens: (json['total_tokens'] as num).toInt(),
      promptTokens: (json['prompt_tokens'] as num).toInt(),
      completionTokens: (json['completion_tokens'] as num).toInt(),
      cachedTokens: (json['cached_tokens'] as num).toInt(),
      totalCost: (json['total_cost'] as num).toDouble(),
    );

Map<String, dynamic> _$$UsageCostBreakdownImplToJson(
        _$UsageCostBreakdownImpl instance) =>
    <String, dynamic>{
      'model': instance.model,
      'caller': instance.caller,
      'total_requests': instance.totalRequests,
      'total_tokens': instance.totalTokens,
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'cached_tokens': instance.cachedTokens,
      'total_cost': instance.totalCost,
    };
