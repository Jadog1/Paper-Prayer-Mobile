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
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdAt': instance.createdAt,
    };

_$ContactGroupPairsImpl _$$ContactGroupPairsImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactGroupPairsImpl(
      contactId: (json['contactId'] as num).toInt(),
      groupId: (json['groupId'] as num).toInt(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$ContactGroupPairsImplToJson(
        _$ContactGroupPairsImpl instance) =>
    <String, dynamic>{
      'contactId': instance.contactId,
      'groupId': instance.groupId,
      'createdAt': instance.createdAt,
    };
