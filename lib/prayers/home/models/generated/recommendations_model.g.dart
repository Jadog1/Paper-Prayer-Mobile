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
    );

Map<String, dynamic> _$$CollectionRecommendationImplToJson(
        _$CollectionRecommendationImpl instance) =>
    <String, dynamic>{
      'collection': instance.collection,
      'recommendation_type': instance.recommendationType,
    };
