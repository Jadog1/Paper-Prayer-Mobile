import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/account_permissions_model.dart';
import 'package:prayer_ml/prayers/usage/models/usage_history_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

part 'generated/usage_history_repo.g.dart';

@riverpod
Future<PaginatedGenAIUsageHistory> fetchUsageHistoryAt(
  Ref ref,
  CursorPagination pagination,
) async {
  final api = Config().usageApiClient;
  return await api.getUsageHistory(
    cursor: pagination.cursor,
    limit: pagination.limit,
  );
}

@riverpod
class PaginatedUsageHistoryNotifier extends _$PaginatedUsageHistoryNotifier
    with CursorPagingNotifierMixin<GenAIUsageHistoryItem> {
  @override
  late int limit;

  @override
  Future<CursorPagingData<GenAIUsageHistoryItem>> build(int limit) {
    this.limit = limit;
    return fetch(cursor: null);
  }

  @override
  Future<CursorPagingData<GenAIUsageHistoryItem>> fetch({
    required String? cursor,
  }) async {
    final pagination = CursorPagination(
      limit: limit,
      cursor: cursor,
    );

    final repository =
        await ref.read(fetchUsageHistoryAtProvider(pagination).future);

    return CursorPagingData(
      items: repository.items,
      hasMore: repository.hasNext,
      nextCursor: repository.pagination.cursor,
    );
  }
}
