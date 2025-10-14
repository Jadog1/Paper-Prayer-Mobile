import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/shared.dart';

part 'generated/events_model.freezed.dart';
part 'generated/events_model.g.dart';

@freezed
class PrayerCollectionEvent with _$PrayerCollectionEvent {
  const factory PrayerCollectionEvent({
    required int id,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
    @JsonKey(name: "event_start") required String eventStart,
    @JsonKey(name: "event_end") String? eventEnd,
    String? summary,
  }) = _PrayerCollectionEvent;

  factory PrayerCollectionEvent.fromJson(Map<String, dynamic> json) => _$PrayerCollectionEventFromJson(json);
}

@freezed
class PrayerCollectionEventLink with _$PrayerCollectionEventLink {
  const factory PrayerCollectionEventLink({
    required int id,
    @JsonKey(name: "prayer_request_id") required int prayerRequestId,
    @JsonKey(name: "prayer_collection_event_id") required int prayerCollectionEventId,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "updated_at") required String updatedAt,
  }) = _PrayerCollectionEventLink;

  factory PrayerCollectionEventLink.fromJson(Map<String, dynamic> json) => _$PrayerCollectionEventLinkFromJson(json);
}

@freezed
class PaginatedEvents with _$PaginatedEvents {
  const factory PaginatedEvents({
    required List<PrayerCollectionEvent> events,
    required CursorPagination pagination,
    @JsonKey(name: "has_next") @Default(false) bool hasNext,
  }) = _PaginatedEvents;

  factory PaginatedEvents.fromJson(Map<String, dynamic> json) => _$PaginatedEventsFromJson(json);
}

@freezed
class GetEventsRequest with _$GetEventsRequest {
  const factory GetEventsRequest({
    @JsonKey(name: "start_date") required String startDate,
    @JsonKey(name: "end_date") required String endDate,
    required CursorPagination pagination,
  }) = _GetEventsRequest;

  factory GetEventsRequest.fromJson(Map<String, dynamic> json) => _$GetEventsRequestFromJson(json);
}

@freezed
class GetFutureEventsRequest with _$GetFutureEventsRequest {
  const factory GetFutureEventsRequest({
    @Default(10) int limit,
    @JsonKey(name: "max_days") @Default(30) int maxDays,
  }) = _GetFutureEventsRequest;

  factory GetFutureEventsRequest.fromJson(Map<String, dynamic> json) => _$GetFutureEventsRequestFromJson(json);
}
