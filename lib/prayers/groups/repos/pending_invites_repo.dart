import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/account_permissions_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

final fetchPendingInvitesAtProvider = FutureProvider.autoDispose
    .family<PaginatedPendingInvites, CursorPagination>((ref, pagination) async {
  var config = Config();
  var api = config.accountApiClient;
  return await api.fetchPendingInvites(
    cursor: pagination.cursor,
    limit: pagination.limit,
  );
});

class PaginatedPendingInvitesNotifier
    extends AutoDisposeFamilyAsyncNotifier<CursorPagingData<PendingInvite>, int>
    with CursorPagingNotifierMixin<PendingInvite> {
  late int limit;

  @override
  Future<CursorPagingData<PendingInvite>> build(int arg) {
    limit = arg;
    return fetch(cursor: null);
  }

  @override
  Future<CursorPagingData<PendingInvite>> fetch({
    required String? cursor,
  }) async {
    final pagination = CursorPagination(
      limit: limit,
      cursor: cursor,
    );
    final repository =
        await ref.read(fetchPendingInvitesAtProvider(pagination).future);

    return CursorPagingData(
      items: repository.invites,
      hasMore: repository.hasNext,
      nextCursor: repository.pagination.cursor,
    );
  }
}

final paginatedPendingInvitesNotifierProvider =
    AutoDisposeAsyncNotifierProviderFamily<PaginatedPendingInvitesNotifier,
        CursorPagingData<PendingInvite>, int>(
  PaginatedPendingInvitesNotifier.new,
);
