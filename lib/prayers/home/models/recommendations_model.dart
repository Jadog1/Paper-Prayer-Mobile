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

  factory RecommendationGroup.fromJson(Map<String, dynamic> json) =>
      _$RecommendationGroupFromJson(json);
}

@freezed
class DescriptiveCount with _$DescriptiveCount {
  const factory DescriptiveCount({
    required int count,
    required String description,
  }) = _DescriptiveCount;

  factory DescriptiveCount.fromJson(Map<String, dynamic> json) =>
      _$DescriptiveCountFromJson(json);
}

@freezed
class PaginatedCollectionRecommendation
    with _$PaginatedCollectionRecommendation {
  const factory PaginatedCollectionRecommendation({
    required List<CollectionRecommendation> collections,
    required CursorPagination pagination,
    @Default(false) bool hasNext,
  }) = _PaginatedCollectionRecommendation;

  factory PaginatedCollectionRecommendation.fromJson(
          Map<String, dynamic> json) =>
      _$PaginatedCollectionRecommendationFromJson(json);
}

@freezed
class CollectionRecommendation with _$CollectionRecommendation {
  const factory CollectionRecommendation({
    required Collection collection,
    @JsonKey(name: "recommendation_type") required String recommendationType,
    @JsonKey(name: "last_prayer_creation_date")
    required DateTime lastPrayerCreationDate,
  }) = _CollectionRecommendation;

  factory CollectionRecommendation.fromJson(Map<String, dynamic> json) =>
      _$CollectionRecommendationFromJson(json);
}

@freezed
class HistoricalCollectionRecommendation
    with _$HistoricalCollectionRecommendation {
  const factory HistoricalCollectionRecommendation({
    required Collection collection,
    @JsonKey(name: "recommendation_type") String? recommendationType,
    @JsonKey(name: "for_date") String? forDate,
    @JsonKey(name: "last_prayer_creation_date")
    required DateTime lastPrayerCreationDate,
  }) = _HistoricalCollectionRecommendation;

  factory HistoricalCollectionRecommendation.fromJson(
          Map<String, dynamic> json) =>
      _$HistoricalCollectionRecommendationFromJson(json);
}

@freezed
class PaginatedHistoricalCollectionRecommendation
    with _$PaginatedHistoricalCollectionRecommendation {
  const factory PaginatedHistoricalCollectionRecommendation({
    required List<HistoricalCollectionRecommendation> collections,
    required CursorPagination pagination,
    @JsonKey(name: "has_next") @Default(false) bool hasNext,
  }) = _PaginatedHistoricalCollectionRecommendation;

  factory PaginatedHistoricalCollectionRecommendation.fromJson(
          Map<String, dynamic> json) =>
      _$PaginatedHistoricalCollectionRecommendationFromJson(json);
}

@freezed
class PaginatedUnresolvedFollowups with _$PaginatedUnresolvedFollowups {
  const factory PaginatedUnresolvedFollowups({
    required List<CollectionRecommendation> collections,
    required CursorPagination pagination,
    @JsonKey(name: "has_next") @Default(false) bool hasNext,
  }) = _PaginatedUnresolvedFollowups;

  factory PaginatedUnresolvedFollowups.fromJson(Map<String, dynamic> json) =>
      _$PaginatedUnresolvedFollowupsFromJson(json);
}
