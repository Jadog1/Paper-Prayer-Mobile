// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollectionImpl _$$CollectionImplFromJson(Map<String, dynamic> json) =>
    _$CollectionImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String? ?? "",
      description: json['summary'] as String? ?? "",
      relatedContactIds: (json['related_contact_ids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CollectionImplToJson(_$CollectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.description,
      'related_contact_ids': instance.relatedContactIds,
      'score': instance.score,
    };
