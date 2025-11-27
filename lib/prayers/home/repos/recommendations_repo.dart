import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/api/recommendations_api.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/models/shared.dart';
import 'package:prayer_ml/prayers/home/models/recommendations_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

export 'package:prayer_ml/api/recommendations_api.dart' show CollectionRecommendationAction;
part 'generated/recommendations_repo.g.dart';

@riverpod
class RecommendationRepo extends _$RecommendationRepo {
  late Config config;

  RecommendationRepo() {
    config = Config();
  }

  @override
  Future<List<RecommendationGroup>> build() async {
    var recommendationsApi = config.recommendationsApiClient;
    return await recommendationsApi.getRecommendationGroups();
  }

  Future<void> updateAction(int collectionId, CollectionRecommendationAction action, {String? snoozeUntil}) async {
    var recommendationsApi = config.recommendationsApiClient;
    await recommendationsApi.updateAction(collectionId, action, snoozeUntil: snoozeUntil);
    // Invalidate all recommendation-related providers to refresh the UI
    ref.invalidateSelf();
    ref.invalidate(paginatedCollectionRecommendationNotifierProvider);
    ref.invalidate(paginatedHistoricalRecommendationNotifierProvider);
    ref.invalidate(paginatedUnresolvedFollowupsNotifierProvider);
  }
}

@riverpod
class PaginatedCollectionRecommendationNotifier extends _$PaginatedCollectionRecommendationNotifier
    with CursorPagingNotifierMixin<CollectionRecommendation> {
  @override
  late int limit;
  @override
  late RecommendationGroup recommendationGroup;
  /// Builds the initial state of the provider by fetching data with a null cursor.
  @override
  Future<CursorPagingData<CollectionRecommendation>> build(int limit, RecommendationGroup recommendationGroup) {
    this.limit = limit;
    this.recommendationGroup = recommendationGroup;
    return fetch(cursor: null);
  }

  /// Fetches paginated data from the [SampleRepository] based on the provided [cursor].
  /// Returns a [CursorPagingData] object containing the fetched items, a flag indicating whether more data is available,
  /// and the next cursor for fetching the next page.
  @override
  Future<CursorPagingData<CollectionRecommendation>> fetch({
    required String? cursor
  }) async {
    final pagination = CursorPagination(
      limit: limit,
      cursor: cursor,
    );
    var recommendationsApi = config.recommendationsApiClient;
    final repository = await recommendationsApi.fetchRecommendationsForGroupType(recommendationGroup, pagination);

    return CursorPagingData(
      items: repository.collections,
      hasMore: repository.hasNext,
      nextCursor: repository.pagination.cursor,
    );
  }
}

@riverpod
class PaginatedHistoricalRecommendationNotifier extends _$PaginatedHistoricalRecommendationNotifier
    with CursorPagingNotifierMixin<HistoricalCollectionRecommendation> {
  @override
  late int limit;
  
  /// Builds the initial state of the provider by fetching data with a null cursor.
  @override
  Future<CursorPagingData<HistoricalCollectionRecommendation>> build(int limit) {
    this.limit = limit;
    return fetch(cursor: null);
  }

  /// Fetches paginated historical recommendations based on the provided [cursor].
  @override
  Future<CursorPagingData<HistoricalCollectionRecommendation>> fetch({
    required String? cursor
  }) async {
    final pagination = CursorPagination(
      limit: limit,
      cursor: cursor,
    );
    var recommendationsApi = config.recommendationsApiClient;
    final repository = await recommendationsApi.getRecommendationHistory(pagination);

    return CursorPagingData(
      items: repository.collections,
      hasMore: repository.hasNext,
      nextCursor: repository.pagination.cursor,
    );
  }
}

@riverpod
class PaginatedUnresolvedFollowupsNotifier extends _$PaginatedUnresolvedFollowupsNotifier
    with CursorPagingNotifierMixin<Collection> {
  @override
  late int limit;
  @override
  late int lookbackDays;
  
  /// Builds the initial state of the provider by fetching data with a null cursor.
  @override
  Future<CursorPagingData<Collection>> build(int limit, {int lookbackDays = 30}) {
    this.limit = limit;
    this.lookbackDays = lookbackDays;
    return fetch(cursor: null);
  }

  /// Fetches paginated unresolved followups based on the provided [cursor].
  @override
  Future<CursorPagingData<Collection>> fetch({
    required String? cursor
  }) async {
    final pagination = CursorPagination(
      limit: limit,
      cursor: cursor,
    );
    var recommendationsApi = config.recommendationsApiClient;
    final repository = await recommendationsApi.getUnresolvedFollowups(pagination, lookbackDays: lookbackDays);
    var collections = repository.collections.map((e) => e.collection).toList();

    return CursorPagingData(
      items: collections,
      hasMore: repository.hasNext,
      nextCursor: repository.pagination.cursor,
    );
  }
}

@riverpod
Future<List<PrayerRequest>> recentPrayerRequests(Ref ref, int collectionId, {int n = 5}) async {
  var config = Config();
  var recommendationsApi = config.recommendationsApiClient;
  return await recommendationsApi.getRecentPrayerRequests(collectionId, n: n);
}