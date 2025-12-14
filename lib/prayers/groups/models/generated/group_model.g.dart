// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupWithPermissionsImpl _$$GroupWithPermissionsImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupWithPermissionsImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String,
      description: json['description'] as String? ?? "",
      permissions: (json['permissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GroupWithPermissionsImplToJson(
        _$GroupWithPermissionsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'permissions': instance.permissions,
    };
