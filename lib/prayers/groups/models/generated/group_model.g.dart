// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
