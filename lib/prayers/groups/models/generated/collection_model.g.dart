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
      user: Contact.fromJson(json['contact'] as Map<String, dynamic>),
      group: ContactGroupPairs.fromJson(
          json['contact_group'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String? ?? "",
      score: (json['score'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$CollectionImplToJson(_$CollectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'summary': instance.description,
      'related_contact_ids': instance.relatedContactIds,
      'contact': instance.user,
      'contact_group': instance.group,
      'created_at': instance.createdAt,
      'score': instance.score,
    };
