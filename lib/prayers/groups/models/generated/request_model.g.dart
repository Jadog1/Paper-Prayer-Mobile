// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrayerRequestImpl _$$PrayerRequestImplFromJson(Map<String, dynamic> json) =>
    _$PrayerRequestImpl(
      id: (json['id'] as num).toInt(),
      description: json['request'] as String,
      title: json['title'] as String?,
      user: Contact.fromJson(json['contact'] as Map<String, dynamic>),
      group: ContactGroupPairs.fromJson(
          json['contact_group'] as Map<String, dynamic>),
      sentiment: json['sentiment'] as String? ?? "",
      emotion: json['emotion'] as String? ?? "",
      prayerType: json['prayer_type'] as String?,
      createdAt: json['created_at'] as String? ?? "",
      relatedContactIds: (json['related_contact_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$PrayerRequestImplToJson(_$PrayerRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request': instance.description,
      'title': instance.title,
      'contact': instance.user,
      'contact_group': instance.group,
      'sentiment': instance.sentiment,
      'emotion': instance.emotion,
      'prayer_type': instance.prayerType,
      'created_at': instance.createdAt,
      'related_contact_ids': instance.relatedContactIds,
    };

_$PrayerRequestScoreImpl _$$PrayerRequestScoreImplFromJson(
        Map<String, dynamic> json) =>
    _$PrayerRequestScoreImpl(
      id: (json['id'] as num).toInt(),
      request: json['request'] as String,
      title: json['title'] as String?,
      user: Contact.fromJson(json['contact'] as Map<String, dynamic>),
      group: ContactGroupPairs.fromJson(
          json['contact_group'] as Map<String, dynamic>),
      sentiment: json['sentiment'] as String? ?? "",
      score: (json['score'] as num).toDouble(),
      createdAt: json['created_at'] as String? ?? "",
      relatedContactIds: (json['related_contact_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$PrayerRequestScoreImplToJson(
        _$PrayerRequestScoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request': instance.request,
      'title': instance.title,
      'contact': instance.user,
      'contact_group': instance.group,
      'sentiment': instance.sentiment,
      'score': instance.score,
      'created_at': instance.createdAt,
      'related_contact_ids': instance.relatedContactIds,
    };
