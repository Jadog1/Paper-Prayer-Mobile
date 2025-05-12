// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../shared.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CursorPaginationImpl _$$CursorPaginationImplFromJson(
        Map<String, dynamic> json) =>
    _$CursorPaginationImpl(
      limit: (json['limit'] as num).toInt(),
      cursor: json['cursor'] as String?,
    );

Map<String, dynamic> _$$CursorPaginationImplToJson(
        _$CursorPaginationImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'cursor': instance.cursor,
    };
