import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/shared.dart';

part 'generated/recommendations_model.freezed.dart';
part 'generated/recommendations_model.g.dart';

@freezed
class RecommendationGroup with _$RecommendationGroup {
  const factory RecommendationGroup({
    required String title,
    required String description,
    required String icon,
    @JsonKey(name: "group_type") required String groupType,
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "counts") required List<DescriptiveCount> counts,
  }) = _RecommendationGroup;

  factory RecommendationGroup.fromJson(Map<String, dynamic> json) => _$RecommendationGroupFromJson(json);
}

@freezed
class DescriptiveCount with _$DescriptiveCount {
  const factory DescriptiveCount({
    required int count,
    required String description,
  }) = _DescriptiveCount;

  factory DescriptiveCount.fromJson(Map<String, dynamic> json) => _$DescriptiveCountFromJson(json);
}

@freezed
class PaginatedCollectionRecommendation with _$PaginatedCollectionRecommendation {
  const factory PaginatedCollectionRecommendation({
    required List<CollectionRecommendation> collections,
    required CursorPagination pagination,
    @Default(false) bool hasNext,
  }) = _PaginatedCollectionRecommendation;

  factory PaginatedCollectionRecommendation.fromJson(Map<String, dynamic> json) => _$PaginatedCollectionRecommendationFromJson(json);
}

@freezed
class CollectionRecommendation with _$CollectionRecommendation {
  const factory CollectionRecommendation({
    required Collection collection,
    @JsonKey(name: "recommendation_type") required String recommendationType,
  }) = _CollectionRecommendation;

  factory CollectionRecommendation.fromJson(Map<String, dynamic> json) => _$CollectionRecommendationFromJson(json);
}