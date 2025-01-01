// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.createdAt,
    };

_$ContactGroupPairsImpl _$$ContactGroupPairsImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactGroupPairsImpl(
      contactId: (json['contact_id'] as num).toInt(),
      groupId: (json['group_id'] as num).toInt(),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$ContactGroupPairsImplToJson(
        _$ContactGroupPairsImpl instance) =>
    <String, dynamic>{
      'contact_id': instance.contactId,
      'group_id': instance.groupId,
      'created_at': instance.createdAt,
    };
