import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/notebook_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';
import 'package:prayer_ml/prayers/groups/models/shared.dart';

part 'generated/notebook_repo.g.dart';

@riverpod
Future<PaginatedPrayerRequests> fetchNotebookRequestsAt(Ref ref, CursorPagination pagination, int groupId) async {
  var config = Config();
  var api = config.notebookApiClient;
  return await api.fetchNotebookRequestsAt(pagination, groupId);
}

@riverpod
Future<PaginatedCollections> fetchNotebookCollectionsAt(Ref ref, CursorPagination pagination, int groupId) async {
  var config = Config();
  var api = config.notebookApiClient;
  return await api.fetchNotebookCollectionsAt(pagination, groupId);
}

@riverpod
class PaginatedPrayerRequestsNotifier extends _$PaginatedPrayerRequestsNotifier
    with CursorPagingNotifierMixin<PrayerRequest> {
  @override
  late int limit;
  @override
  late int groupId;
  /// Builds the initial state of the provider by fetching data with a null cursor.
  @override
  Future<CursorPagingData<PrayerRequest>> build(int limit, int groupId) {
    this.limit = limit;
    this.groupId = groupId;
    return fetch(cursor: null);
  }

  /// Fetches paginated data from the [SampleRepository] based on the provided [cursor].
  /// Returns a [CursorPagingData] object containing the fetched items, a flag indicating whether more data is available,
  /// and the next cursor for fetching the next page.
  @override
  Future<CursorPagingData<PrayerRequest>> fetch({
    required String? cursor
  }) async {
    final pagination = CursorPagination(
      limit: limit,
      cursor: cursor,
    );
    final repository = await ref.read(fetchNotebookRequestsAtProvider(pagination, groupId).future);

    return CursorPagingData(
      items: repository.prayerRequests,
      hasMore: repository.hasNext,
      nextCursor: repository.pagination.cursor,
    );
  }
}