// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      accountId: (json['account_id'] as num).toInt(),
      description: json['description'] as String? ?? '',
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'account_id': instance.accountId,
      'description': instance.description,
      'created_at': instance.createdAt,
    };

_$ContactGroupPairsImpl _$$ContactGroupPairsImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactGroupPairsImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      contactId: (json['contact_id'] as num).toInt(),
      groupId: (json['group_id'] as num).toInt(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$ContactGroupPairsImplToJson(
        _$ContactGroupPairsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contact_id': instance.contactId,
      'group_id': instance.groupId,
      'created_at': instance.createdAt,
    };

_$RelatedContactImpl _$$RelatedContactImplFromJson(Map<String, dynamic> json) =>
    _$RelatedContactImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      contactId: (json['contact_id'] as num).toInt(),
      relatedContactId: (json['related_contact_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String,
      accountId: (json['accountId'] as num?)?.toInt() ?? 0,
      highLevelRelationship: json['high_level_relationship'] as String?,
      lowLevelRelationship: json['low_level_relationship'] as String?,
      name: json['name'] as String,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$RelatedContactImplToJson(
        _$RelatedContactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contact_id': instance.contactId,
      'related_contact_id': instance.relatedContactId,
      'created_at': instance.createdAt,
      'accountId': instance.accountId,
      'high_level_relationship': instance.highLevelRelationship,
      'low_level_relationship': instance.lowLevelRelationship,
      'name': instance.name,
      'label': instance.label,
    };

_$RelatedContactUpdateImpl _$$RelatedContactUpdateImplFromJson(
        Map<String, dynamic> json) =>
    _$RelatedContactUpdateImpl(
      id: (json['id'] as num).toInt(),
      highLevelRelationship: json['high_level_relationship'] as String?,
      lowLevelRelationship: json['low_level_relationship'] as String?,
      name: json['name'] as String?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$RelatedContactUpdateImplToJson(
        _$RelatedContactUpdateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'high_level_relationship': instance.highLevelRelationship,
      'low_level_relationship': instance.lowLevelRelationship,
      'name': instance.name,
      'label': instance.label,
    };
