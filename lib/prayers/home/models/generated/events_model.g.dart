// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../events_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrayerCollectionEventImpl _$$PrayerCollectionEventImplFromJson(
        Map<String, dynamic> json) =>
    _$PrayerCollectionEventImpl(
      id: (json['id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      eventStart: json['event_start'] as String,
      eventEnd: json['event_end'] as String?,
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$$PrayerCollectionEventImplToJson(
        _$PrayerCollectionEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'event_start': instance.eventStart,
      'event_end': instance.eventEnd,
      'summary': instance.summary,
    };

_$PrayerCollectionEventLinkImpl _$$PrayerCollectionEventLinkImplFromJson(
        Map<String, dynamic> json) =>
    _$PrayerCollectionEventLinkImpl(
      id: (json['id'] as num).toInt(),
      prayerRequestId: (json['prayer_request_id'] as num).toInt(),
      prayerCollectionEventId:
          (json['prayer_collection_event_id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$PrayerCollectionEventLinkImplToJson(
        _$PrayerCollectionEventLinkImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prayer_request_id': instance.prayerRequestId,
      'prayer_collection_event_id': instance.prayerCollectionEventId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_$EventWithCollectionImpl _$$EventWithCollectionImplFromJson(
        Map<String, dynamic> json) =>
    _$EventWithCollectionImpl(
      event:
          PrayerCollectionEvent.fromJson(json['event'] as Map<String, dynamic>),
      collection:
          Collection.fromJson(json['collection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventWithCollectionImplToJson(
        _$EventWithCollectionImpl instance) =>
    <String, dynamic>{
      'event': instance.event,
      'collection': instance.collection,
    };

_$PaginatedEventsImpl _$$PaginatedEventsImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedEventsImpl(
      events: (json['events'] as List<dynamic>)
          .map((e) => EventWithCollection.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination:
          CursorPagination.fromJson(json['pagination'] as Map<String, dynamic>),
      hasNext: json['has_next'] as bool? ?? false,
    );

Map<String, dynamic> _$$PaginatedEventsImplToJson(
        _$PaginatedEventsImpl instance) =>
    <String, dynamic>{
      'events': instance.events,
      'pagination': instance.pagination,
      'has_next': instance.hasNext,
    };

_$GetEventsRequestImpl _$$GetEventsRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GetEventsRequestImpl(
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      pagination:
          CursorPagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetEventsRequestImplToJson(
        _$GetEventsRequestImpl instance) =>
    <String, dynamic>{
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'pagination': instance.pagination,
    };

_$GetFutureEventsRequestImpl _$$GetFutureEventsRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$GetFutureEventsRequestImpl(
      limit: (json['limit'] as num?)?.toInt() ?? 10,
      maxDays: (json['max_days'] as num?)?.toInt() ?? 30,
    );

Map<String, dynamic> _$$GetFutureEventsRequestImplToJson(
        _$GetFutureEventsRequestImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'max_days': instance.maxDays,
    };
