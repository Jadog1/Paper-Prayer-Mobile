import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/account_permissions_model.dart';
import 'package:prayer_ml/shared/config.dart';

final assignableRolesProvider =
    FutureProvider.autoDispose<List<AssignableRole>>((ref) async {
  final api = Config().accountApiClient;
  return api.fetchAssignableRoles();
});

final accountSearchProvider = FutureProvider.autoDispose
    .family<List<AccountSearchResult>, String>((ref, emailQuery) async {
  final query = emailQuery.trim();
  if (query.length < 2) return [];
  final api = Config().accountApiClient;
  return api.searchAccountsByEmail(query);
});

final groupRoleMembersProvider = FutureProvider.autoDispose
    .family<List<GroupRoleMember>, int>((ref, groupId) async {
  final api = Config().accountApiClient;
  return api.fetchGroupRoles(groupId);
});

class GroupAccessActions {
  GroupAccessActions(this.ref);
  final Ref ref;

  Future<RoleAssignmentResult> assignRole({
    required int groupId,
    required String targetEmail,
    required int role,
  }) async {
    final api = Config().accountApiClient;
    final result = await api.assignRoleToGroup(
      groupId: groupId,
      targetEmail: targetEmail,
      role: role,
    );

    ref.invalidate(groupRoleMembersProvider(groupId));
    return result;
  }

  Future<RoleRemovalResult> removeRole({
    required int groupId,
    required String targetEmail,
  }) async {
    final api = Config().accountApiClient;
    final result = await api.removeRoleFromGroup(
      groupId: groupId,
      targetEmail: targetEmail,
    );

    ref.invalidate(groupRoleMembersProvider(groupId));
    return result;
  }
}

final groupAccessActionsProvider =
    Provider.autoDispose<GroupAccessActions>((ref) {
  return GroupAccessActions(ref);
});
