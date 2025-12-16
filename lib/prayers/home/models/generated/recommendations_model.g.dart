// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../recommendations_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecommendationGroupImpl _$$RecommendationGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$RecommendationGroupImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      groupType: json['group_type'] as String,
      id: (json['id'] as num?)?.toInt(),
      counts: (json['counts'] as List<dynamic>)
          .map((e) => DescriptiveCount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecommendationGroupImplToJson(
        _$RecommendationGroupImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'icon': instance.icon,
      'group_type': instance.groupType,
      'id': instance.id,
      'counts': instance.counts,
    };

_$DescriptiveCountImpl _$$DescriptiveCountImplFromJson(
        Map<String, dynamic> json) =>
    _$DescriptiveCountImpl(
      count: (json['count'] as num).toInt(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$DescriptiveCountImplToJson(
        _$DescriptiveCountImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'description': instance.description,
    };

_$PaginatedCollectionRecommendationImpl
    _$$PaginatedCollectionRecommendationImplFromJson(
            Map<String, dynamic> json) =>
        _$PaginatedCollectionRecommendationImpl(
          collections: (json['collections'] as List<dynamic>)
              .map((e) =>
                  CollectionRecommendation.fromJson(e as Map<String, dynamic>))
              .toList(),
          pagination: CursorPagination.fromJson(
              json['pagination'] as Map<String, dynamic>),
          hasNext: json['hasNext'] as bool? ?? false,
        );

Map<String, dynamic> _$$PaginatedCollectionRecommendationImplToJson(
        _$PaginatedCollectionRecommendationImpl instance) =>
    <String, dynamic>{
      'collections': instance.collections,
      'pagination': instance.pagination,
      'hasNext': instance.hasNext,
    };

_$CollectionRecommendationImpl _$$CollectionRecommendationImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionRecommendationImpl(
      collection:
          Collection.fromJson(json['collection'] as Map<String, dynamic>),
      recommendationType: json['recommendation_type'] as String,
      lastPrayerCreationDate:
          DateTime.parse(json['last_prayer_creation_date'] as String),
    );

Map<String, dynamic> _$$CollectionRecommendationImplToJson(
        _$CollectionRecommendationImpl instance) =>
    <String, dynamic>{
      'collection': instance.collection,
      'recommendation_type': instance.recommendationType,
      'last_prayer_creation_date':
          instance.lastPrayerCreationDate.toIso8601String(),
    };

_$HistoricalCollectionRecommendationImpl
    _$$HistoricalCollectionRecommendationImplFromJson(
            Map<String, dynamic> json) =>
        _$HistoricalCollectionRecommendationImpl(
          collection:
              Collection.fromJson(json['collection'] as Map<String, dynamic>),
          recommendationType: json['recommendation_type'] as String?,
          forDate: json['for_date'] as String?,
          lastPrayerCreationDate:
              DateTime.parse(json['last_prayer_creation_date'] as String),
        );

Map<String, dynamic> _$$HistoricalCollectionRecommendationImplToJson(
        _$HistoricalCollectionRecommendationImpl instance) =>
    <String, dynamic>{
      'collection': instance.collection,
      'recommendation_type': instance.recommendationType,
      'for_date': instance.forDate,
      'last_prayer_creation_date':
          instance.lastPrayerCreationDate.toIso8601String(),
    };

_$PaginatedHistoricalCollectionRecommendationImpl
    _$$PaginatedHistoricalCollectionRecommendationImplFromJson(
            Map<String, dynamic> json) =>
        _$PaginatedHistoricalCollectionRecommendationImpl(
          collections: (json['collections'] as List<dynamic>)
              .map((e) => HistoricalCollectionRecommendation.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
          pagination: CursorPagination.fromJson(
              json['pagination'] as Map<String, dynamic>),
          hasNext: json['has_next'] as bool? ?? false,
        );

Map<String, dynamic> _$$PaginatedHistoricalCollectionRecommendationImplToJson(
        _$PaginatedHistoricalCollectionRecommendationImpl instance) =>
    <String, dynamic>{
      'collections': instance.collections,
      'pagination': instance.pagination,
      'has_next': instance.hasNext,
    };

_$PaginatedUnresolvedFollowupsImpl _$$PaginatedUnresolvedFollowupsImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedUnresolvedFollowupsImpl(
      collections: (json['collections'] as List<dynamic>)
          .map((e) =>
              CollectionRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          CursorPagination.fromJson(json['pagination'] as Map<String, dynamic>),
      hasNext: json['has_next'] as bool? ?? false,
    );

Map<String, dynamic> _$$PaginatedUnresolvedFollowupsImplToJson(
        _$PaginatedUnresolvedFollowupsImpl instance) =>
    <String, dynamic>{
      'collections': instance.collections,
      'pagination': instance.pagination,
      'has_next': instance.hasNext,
    };
