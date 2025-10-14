import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

part 'generated/events_repo.g.dart';

/// Fetch future events within max days
@riverpod
Future<List<PrayerCollectionEvent>> fetchFutureEvents(Ref ref, {int limit = 10, int maxDays = 30, int? contactId, int? collectionId}) async {
  var config = Config();
  var api = config.eventsApiClient;
  return await api.getFutureEvents(limit: limit, maxDays: maxDays, contactId: contactId, collectionId: collectionId);
}

/// Fetch paginated events for a specific date range
@riverpod
Future<PaginatedEvents> fetchEventsInRange(
  Ref ref, {
  required String startDate,
  required String endDate,
  String? cursor,
  int limit = 50,
  int? contactId,
  int? collectionId,
}) async {
  var config = Config();
  var api = config.eventsApiClient;
  return await api.getEventsPaginated(
    startDate: startDate,
    endDate: endDate,
    cursor: cursor,
    limit: limit,
    contactId: contactId,
    collectionId: collectionId,
  );
}

/// Paginated events notifier for calendar views
@riverpod
class PaginatedEventsNotifier extends _$PaginatedEventsNotifier
    with CursorPagingNotifierMixin<PrayerCollectionEvent> {
  @override
  late int limit;
  @override
  late String startDate;
  @override
  late String endDate;
  @override
  late int? contactId;
  @override
  late int? collectionId;

  /// Builds the initial state of the provider by fetching data with a null cursor.
  @override
  Future<CursorPagingData<PrayerCollectionEvent>> build(
    int limit,
    String startDate,
    String endDate,
    {int? contactId, int? collectionId}
  ) {
    this.limit = limit;
    this.startDate = startDate;
    this.endDate = endDate;
    this.contactId = contactId;
    this.collectionId = collectionId;
    return fetch(cursor: null);
  }

  /// Fetches paginated data based on the provided [cursor].
  @override
  Future<CursorPagingData<PrayerCollectionEvent>> fetch({
    required String? cursor,
  }) async {
    final repository = await ref.read(
      fetchEventsInRangeProvider(
        startDate: startDate,
        endDate: endDate,
        cursor: cursor,
        limit: limit,
        contactId: contactId,
        collectionId: collectionId,
      ).future,
    );

    return CursorPagingData(
      items: repository.events,
      hasMore: repository.hasNext,
      nextCursor: repository.pagination.cursor,
    );
  }
}
