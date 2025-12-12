class AccountSearchResult {
  const AccountSearchResult({required this.name, required this.email});

  final String name;
  final String email;

  factory AccountSearchResult.fromJson(Map<String, dynamic> json) {
    return AccountSearchResult(
      name: (json['name'] as String?) ?? '',
      email: (json['email'] as String?) ?? '',
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
    required this.accountEmail,
  });

  final int role;
  final String accountName;
  final String accountEmail;

  factory GroupRoleMember.fromJson(Map<String, dynamic> json) {
    return GroupRoleMember(
      role: (json['role'] as num).toInt(),
      accountName: (json['account_name'] as String?) ?? '',
      accountEmail: (json['account_email'] as String?) ?? '',
    );
  }
}

class RoleAssignmentResult {
  const RoleAssignmentResult({
    required this.targetAccountId,
    required this.targetAccountName,
    required this.targetAccountEmail,
    required this.groupId,
    required this.role,
  });

  final int targetAccountId;
  final String targetAccountName;
  final String targetAccountEmail;
  final int groupId;
  final int role;

  factory RoleAssignmentResult.fromJson(Map<String, dynamic> json) {
    return RoleAssignmentResult(
      targetAccountId: (json['target_account_id'] as num).toInt(),
      targetAccountName: (json['target_account_name'] as String?) ?? '',
      targetAccountEmail: (json['target_account_email'] as String?) ?? '',
      groupId: (json['group_id'] as num).toInt(),
      role: (json['role'] as num).toInt(),
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
