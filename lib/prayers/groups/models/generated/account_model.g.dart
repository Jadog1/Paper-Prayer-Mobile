// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$AccountUpdateRequestImpl _$$AccountUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountUpdateRequestImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$AccountUpdateRequestImplToJson(
        _$AccountUpdateRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
