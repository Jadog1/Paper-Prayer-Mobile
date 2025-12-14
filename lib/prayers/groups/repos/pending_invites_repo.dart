import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/account_permissions_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_paging_utils/riverpod_paging_utils.dart';

part 'generated/pending_invites_repo.g.dart';

@riverpod
Future<PaginatedPendingInvites> fetchPendingInvitesAt(
    Ref ref, CursorPagination pagination) async {
  var config = Config();
  var api = config.accountApiClient;
  return await api.fetchPendingInvites(
    cursor: pagination.cursor,
    limit: pagination.limit,
  );
}

@riverpod
class PaginatedPendingInvitesNotifier extends _$PaginatedPendingInvitesNotifier
    with CursorPagingNotifierMixin<PendingInvite> {
  @override
  late int limit;

  @override
  Future<CursorPagingData<PendingInvite>> build(int limit) {
    this.limit = limit;
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

/// Simple provider to check if there are any pending invites.
/// Returns true if there's at least one pending invite.
/// Useful for showing notification badges in the UI.
@riverpod
Future<bool> hasPendingInvites(Ref ref) async {
  var config = Config();
  var api = config.accountApiClient;
  final result = await api.fetchPendingInvites(
    cursor: null,
    limit: 1, // Only fetch 1 to check if any exist
  );
  return result.invites.isNotEmpty;
}

/// Accepts a pending invite and invalidates related providers.
@riverpod
Future<void> acceptInvite(Ref ref, int groupId) async {
  final api = Config().accountApiClient;
  await api.acceptInvite(groupId: groupId);

  // Invalidate pending invites data to refresh the UI
  ref.invalidate(hasPendingInvitesProvider);
  ref.invalidate(paginatedPendingInvitesNotifierProvider);
}

/// Rejects a pending invite and invalidates related providers.
@riverpod
Future<void> rejectInvite(Ref ref, int groupId) async {
  final api = Config().accountApiClient;
  await api.rejectInvite(groupId: groupId);

  // Invalidate pending invites data to refresh the UI
  ref.invalidate(hasPendingInvitesProvider);
  ref.invalidate(paginatedPendingInvitesNotifierProvider);
}
