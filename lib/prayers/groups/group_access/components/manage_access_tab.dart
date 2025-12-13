import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/group_access/group_access_repo.dart';
import 'package:prayer_ml/prayers/groups/models/account_permissions_model.dart';
import 'package:prayer_ml/prayers/groups/group_access/components/member_list_item.dart';
import 'package:prayer_ml/shared/widgets.dart';

class ManageAccessTab extends ConsumerWidget {
  const ManageAccessTab({
    super.key,
    required this.groupId,
    required this.rolesAsync,
    required this.onAssignRoleByEmail,
    required this.onRemove,
    this.onRevoke,
  });

  final int groupId;
  final AsyncValue<List<AssignableRole>> rolesAsync;
  final Future<void> Function(String email, int role) onAssignRoleByEmail;
  final Future<void> Function(String userCode) onRemove;
  final Future<void> Function(String userCode)? onRevoke;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final membersAsync = ref.watch(groupRoleMembersProvider(groupId));

    return rolesAsync.when(
      data: (roles) {
        final roleById = <int, AssignableRole>{
          for (final r in roles) r.role: r,
        };

        return membersAsync.when(
          data: (members) {
            if (members.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people_outline,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No members yet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Add members from the Add tab',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: members.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final m = members[index];
                final label = roleById[m.role]?.label ?? 'Role #${m.role}';
                final roleDescription = roleById[m.role]?.description ?? '';

                return MemberListItem(
                  member: m,
                  roleLabel: label,
                  roleDescription: roleDescription,
                  roles: roles,
                  onRemove: onRemove,
                  onRevoke: onRevoke,
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => PrintError(
            caller: 'ManageAccessTab groupRoleMembersProvider',
            error: error,
            stackTrace: stackTrace,
            onRetry: () => ref.invalidate(groupRoleMembersProvider(groupId)),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => PrintError(
        caller: 'ManageAccessTab assignableRolesProvider',
        error: error,
        stackTrace: stackTrace,
        onRetry: () => ref.invalidate(assignableRolesProvider),
      ),
    );
  }
}
