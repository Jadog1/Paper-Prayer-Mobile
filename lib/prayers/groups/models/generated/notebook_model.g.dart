// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../notebook_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CursorPaginationImpl _$$CursorPaginationImplFromJson(
        Map<String, dynamic> json) =>
    _$CursorPaginationImpl(
      limit: (json['limit'] as num).toInt(),
      cursor: (json['cursor'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CursorPaginationImplToJson(
        _$CursorPaginationImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'cursor': instance.cursor,
    };

_$PaginatedPrayerRequestsImpl _$$PaginatedPrayerRequestsImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedPrayerRequestsImpl(
      hasNext: json['has_next'] as bool,
      prayerRequests: (json['prayer_requests'] as List<dynamic>)
          .map((e) => PrayerRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          CursorPagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginatedPrayerRequestsImplToJson(
        _$PaginatedPrayerRequestsImpl instance) =>
    <String, dynamic>{
      'has_next': instance.hasNext,
      'prayer_requests': instance.prayerRequests,
      'pagination': instance.pagination,
    };

_$PaginatedCollectionsImpl _$$PaginatedCollectionsImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedCollectionsImpl(
      hasNext: json['has_next'] as bool,
      collections: (json['collections'] as List<dynamic>)
          .map((e) => Collection.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          CursorPagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaginatedCollectionsImplToJson(
        _$PaginatedCollectionsImpl instance) =>
    <String, dynamic>{
      'has_next': instance.hasNext,
      'collections': instance.collections,
      'pagination': instance.pagination,
    };
