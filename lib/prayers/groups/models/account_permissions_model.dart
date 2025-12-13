class AccountSearchResult {
  const AccountSearchResult({required this.name, required this.userCode});

  final String name;
  final String userCode;

  factory AccountSearchResult.fromJson(Map<String, dynamic> json) {
    return AccountSearchResult(
      name: (json['name'] as String?) ?? '',
      userCode: (json['user_code'] as String?) ?? '',
    );
  }
}

class AssignableRole {
  const AssignableRole({
    required this.role,
    required this.label,
    required this.description,
  });

  final int role;
  final String label;
  final String description;

  factory AssignableRole.fromJson(Map<String, dynamic> json) {
    return AssignableRole(
      role: (json['role'] as num).toInt(),
      label: (json['label'] as String?) ?? '',
      description: (json['description'] as String?) ?? '',
    );
  }
}

class GroupRoleMember {
  const GroupRoleMember({
    required this.role,
    required this.accountName,
    required this.userCode,
    required this.status,
    this.expiresAt,
    this.respondedAt,
  });

  final int role;
  final String accountName;
  final String userCode;
  final String status; // 'active', 'pending', 'rejected'
  final String? expiresAt;
  final String? respondedAt;

  factory GroupRoleMember.fromJson(Map<String, dynamic> json) {
    return GroupRoleMember(
      role: (json['role'] as num).toInt(),
      accountName: (json['account_name'] as String?) ?? '',
      userCode: (json['user_code'] as String?) ?? '',
      status: (json['status'] as String?) ?? 'active',
      expiresAt: json['expires_at'] as String?,
      respondedAt: json['responded_at'] as String?,
    );
  }
}

class RoleAssignmentResult {
  const RoleAssignmentResult({
    required this.message,
  });

  final String message;

  factory RoleAssignmentResult.fromJson(Map<String, dynamic> json) {
    return RoleAssignmentResult(
      message: (json['message'] as String?) ?? '',
    );
  }
}

class RoleRemovalResult {
  const RoleRemovalResult({
    required this.removed,
    required this.targetAccountId,
    required this.targetAccountEmail,
    required this.groupId,
  });

  final bool removed;
  final int targetAccountId;
  final String targetAccountEmail;
  final int groupId;

  factory RoleRemovalResult.fromJson(Map<String, dynamic> json) {
    return RoleRemovalResult(
      removed: (json['removed'] as bool?) ?? false,
      targetAccountId: (json['target_account_id'] as num).toInt(),
      targetAccountEmail: (json['target_account_email'] as String?) ?? '',
      groupId: (json['group_id'] as num).toInt(),
    );
  }
}

class RevokeInviteResult {
  const RevokeInviteResult({
    required this.revoked,
    required this.targetAccountId,
    required this.targetAccountEmail,
    required this.groupId,
  });

  final bool revoked;
  final int targetAccountId;
  final String targetAccountEmail;
  final int groupId;

  factory RevokeInviteResult.fromJson(Map<String, dynamic> json) {
    return RevokeInviteResult(
      revoked: (json['revoked'] as bool?) ?? false,
      targetAccountId: (json['target_account_id'] as num).toInt(),
      targetAccountEmail: (json['target_account_email'] as String?) ?? '',
      groupId: (json['group_id'] as num).toInt(),
    );
  }
}

class PendingInvite {
  const PendingInvite({
    required this.groupId,
    required this.groupName,
    required this.role,
    required this.invitedByName,
    required this.expiresAt,
    required this.createdAt,
  });

  final int groupId;
  final String groupName;
  final int role;
  final String invitedByName;
  final String expiresAt;
  final String createdAt;

  factory PendingInvite.fromJson(Map<String, dynamic> json) {
    return PendingInvite(
      groupId: (json['group_id'] as num).toInt(),
      groupName: (json['group_name'] as String?) ?? '',
      role: (json['role'] as num).toInt(),
      invitedByName: (json['invited_by_name'] as String?) ?? '',
      expiresAt: (json['expires_at'] as String?) ?? '',
      createdAt: (json['created_at'] as String?) ?? '',
    );
  }
}

class PaginatedPendingInvites {
  const PaginatedPendingInvites({
    required this.invites,
    required this.pagination,
    required this.hasNext,
  });

  final List<PendingInvite> invites;
  final CursorPagination pagination;
  final bool hasNext;

  factory PaginatedPendingInvites.fromJson(Map<String, dynamic> json) {
    final invitesList = json['invites'] as List? ?? [];
    final paginationJson = json['pagination'] as Map<String, dynamic>? ?? {};

    return PaginatedPendingInvites(
      invites: invitesList
          .map((e) => PendingInvite.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: CursorPagination(
        cursor: paginationJson['cursor'] as String?,
        limit: (paginationJson['limit'] as num?)?.toInt() ?? 10,
      ),
      hasNext: (json['has_next'] as bool?) ?? false,
    );
  }
}

class CursorPagination {
  const CursorPagination({
    this.cursor,
    required this.limit,
  });

  final String? cursor;
  final int limit;
}

class InviteActionResult {
  const InviteActionResult({
    required this.message,
    this.groupId,
    this.role,
  });

  final String message;
  final int? groupId;
  final int? role;

  factory InviteActionResult.fromJson(Map<String, dynamic> json) {
    return InviteActionResult(
      message: (json['message'] as String?) ?? '',
      groupId: (json['group_id'] as num?)?.toInt(),
      role: (json['role'] as num?)?.toInt(),
    );
  }
}

class NotificationPreferences {
  const NotificationPreferences({
    required this.groupInvites,
  });

  final bool groupInvites;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) {
    return NotificationPreferences(
      groupInvites: (json['group_invites'] as bool?) ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'group_invites': groupInvites,
    };
  }
}
