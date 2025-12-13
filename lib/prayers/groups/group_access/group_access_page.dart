import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/group_access/group_access_repo.dart';
import 'package:prayer_ml/prayers/groups/models/account_permissions_model.dart';
import 'package:prayer_ml/shared/widgets.dart';

enum GroupAccessPageMode {
  add,
  manage,
}

class GroupAccessPage extends ConsumerStatefulWidget {
  const GroupAccessPage({
    super.key,
    required this.groupId,
    required this.groupName,
    this.mode = GroupAccessPageMode.add,
  });

  final int groupId;
  final String groupName;
  final GroupAccessPageMode mode;

  @override
  ConsumerState<GroupAccessPage> createState() => _GroupAccessPageState();
}

class _GroupAccessPageState extends ConsumerState<GroupAccessPage> {
  final TextEditingController _userCodeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  String _searchText = '';
  String _selectedUserCode = '';
  String _selectedEmail = '';
  int? _selectedRole;
  bool _inviteByEmail = false; // Toggle between user code and email

  @override
  void dispose() {
    _userCodeController.dispose();
    _emailController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialIndex = widget.mode == GroupAccessPageMode.manage ? 1 : 0;

    final rolesAsync = ref.watch(assignableRolesProvider);

    return DefaultTabController(
      length: 2,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notebook Access'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Add'),
              Tab(text: 'Manage'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _AddAccessTab(
              groupId: widget.groupId,
              rolesAsync: rolesAsync,
              searchController: _searchController,
              userCodeController: _userCodeController,
              emailController: _emailController,
              searchText: _searchText,
              selectedUserCode: _selectedUserCode,
              selectedEmail: _selectedEmail,
              selectedRole: _selectedRole,
              inviteByEmail: _inviteByEmail,
              onSearchChanged: (v) => setState(() => _searchText = v),
              onSelectUserCode: (userCode) {
                setState(() {
                  _selectedUserCode = userCode;
                  _userCodeController.text = userCode;
                  _inviteByEmail = false;
                });
              },
              onUserCodeChanged: (v) =>
                  setState(() => _selectedUserCode = v.trim()),
              onEmailChanged: (v) => setState(() => _selectedEmail = v.trim()),
              onSelectRole: (role) => setState(() => _selectedRole = role),
              onToggleInviteByEmail: (v) => setState(() => _inviteByEmail = v),
            ),
            _ManageAccessTab(
              groupId: widget.groupId,
              rolesAsync: rolesAsync,
              onAssignRoleByEmail: (email, role) async {
                await ref.read(groupAccessActionsProvider).assignRoleByEmail(
                      groupId: widget.groupId,
                      targetEmail: email,
                      role: role,
                    );
              },
              onRemove: (userCode) async {
                await ref.read(groupAccessActionsProvider).removeRoleByUserCode(
                      groupId: widget.groupId,
                      targetUserCode: userCode,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AddAccessTab extends ConsumerWidget {
  const _AddAccessTab({
    required this.groupId,
    required this.rolesAsync,
    required this.searchController,
    required this.userCodeController,
    required this.emailController,
    required this.searchText,
    required this.selectedUserCode,
    required this.selectedEmail,
    required this.selectedRole,
    required this.inviteByEmail,
    required this.onSearchChanged,
    required this.onSelectUserCode,
    required this.onUserCodeChanged,
    required this.onEmailChanged,
    required this.onSelectRole,
    required this.onToggleInviteByEmail,
  });

  final int groupId;
  final AsyncValue<List<AssignableRole>> rolesAsync;
  final TextEditingController searchController;
  final TextEditingController userCodeController;
  final TextEditingController emailController;

  final String searchText;
  final String selectedUserCode;
  final String selectedEmail;
  final int? selectedRole;
  final bool inviteByEmail;

  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String> onSelectUserCode;
  final ValueChanged<String> onUserCodeChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<int?> onSelectRole;
  final ValueChanged<bool> onToggleInviteByEmail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchAsync = ref.watch(accountSearchProvider(searchText));

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF8B7355).withOpacity(0.1),
                    const Color(0xFF8B7355).withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFF8B7355).withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B7355).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Color(0xFF8B7355),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Find User by Code',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8B7355),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon:
                          const Icon(Icons.search, color: Color(0xFF8B7355)),
                      hintText: 'Search by user code...',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF8B7355),
                          width: 2,
                        ),
                      ),
                    ),
                    onChanged: onSearchChanged,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: searchAsync.when(
                      data: (results) {
                        if (searchText.trim().length < 2) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Text(
                                'Type at least 2 characters to search',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        }
                        if (results.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.person_off_outlined,
                                      size: 40, color: Colors.grey[400]),
                                  const SizedBox(height: 8),
                                  Text(
                                    'No users found',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: results.length,
                          separatorBuilder: (_, __) => const Divider(height: 1),
                          itemBuilder: (context, index) {
                            final r = results[index];
                            return ListTile(
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              leading: CircleAvatar(
                                backgroundColor:
                                    const Color(0xFF8B7355).withOpacity(0.2),
                                child: Text(
                                  r.name.isNotEmpty
                                      ? r.name[0].toUpperCase()
                                      : r.userCode[0].toUpperCase(),
                                  style: const TextStyle(
                                    color: Color(0xFF8B7355),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Text(
                                r.name.isNotEmpty ? r.name : r.userCode,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              subtitle: Text(
                                'Code: ${r.userCode}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Color(0xFF8B7355),
                              ),
                              onTap: () => onSelectUserCode(r.userCode),
                            );
                          },
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error, stackTrace) => PrintError(
                        caller: 'GroupAccessPage(Add) accountSearchProvider',
                        error: error,
                        stackTrace: stackTrace,
                        compact: true,
                        onRetry: () =>
                            ref.invalidate(accountSearchProvider(searchText)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Invite Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF8B7355).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.person_add_alt_1,
                          color: Color(0xFF8B7355),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Grant Access',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8B7355),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Toggle between user code and email
                  Row(
                    children: [
                      Expanded(
                        child: ChoiceChip(
                          label: const Text('By User Code'),
                          selected: !inviteByEmail,
                          onSelected: (selected) {
                            if (selected) onToggleInviteByEmail(false);
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ChoiceChip(
                          label: const Text('By Email'),
                          selected: inviteByEmail,
                          onSelected: (selected) {
                            if (selected) onToggleInviteByEmail(true);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (!inviteByEmail)
                    TextField(
                      controller: userCodeController,
                      decoration: InputDecoration(
                        prefixIcon:
                            const Icon(Icons.tag, color: Color(0xFF8B7355)),
                        hintText: 'Enter user code (e.g., a3B7kN9mP2)',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF8B7355),
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: onUserCodeChanged,
                    )
                  else
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined,
                            color: Color(0xFF8B7355)),
                        hintText: 'invitee@example.com',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        filled: true,
                        fillColor: Colors.grey[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFF8B7355),
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: onEmailChanged,
                    ),
                  const SizedBox(height: 16),
                  rolesAsync.when(
                    data: (roles) {
                      final effectiveRole = selectedRole ??
                          (roles.isNotEmpty ? roles[0].role : null);
                      return DropdownButtonFormField<int>(
                        value: effectiveRole,
                        decoration: InputDecoration(
                          labelText: 'Role',
                          labelStyle: const TextStyle(color: Color(0xFF8B7355)),
                          prefixIcon: const Icon(Icons.admin_panel_settings,
                              color: Color(0xFF8B7355)),
                          filled: true,
                          fillColor: Colors.grey[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.grey[300]!,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF8B7355),
                              width: 2,
                            ),
                          ),
                        ),
                        selectedItemBuilder: (context) => roles
                            .map((r) => Text(
                                  r.label,
                                  overflow: TextOverflow.ellipsis,
                                ))
                            .toList(),
                        items: roles
                            .map(
                              (r) => DropdownMenuItem<int>(
                                value: r.role,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      r.label,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    if (r.description.isNotEmpty)
                                      Text(
                                        r.description,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey[600],
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (v) => onSelectRole(v),
                      );
                    },
                    loading: () => const LinearProgressIndicator(),
                    error: (error, stackTrace) => PrintError(
                      caller: 'GroupAccessPage(Add) assignableRolesProvider',
                      error: error,
                      stackTrace: stackTrace,
                      compact: true,
                      onRetry: () => ref.invalidate(assignableRolesProvider),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final roles =
                            rolesAsync.value ?? const <AssignableRole>[];
                        final role = selectedRole ??
                            (roles.isNotEmpty ? roles[0].role : null);
                        if (role == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('No roles available.')),
                          );
                          return;
                        }

                        try {
                          if (inviteByEmail) {
                            final email = selectedEmail.trim();
                            if (email.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Enter an email first.')),
                              );
                              return;
                            }
                            await ref
                                .read(groupAccessActionsProvider)
                                .assignRoleByEmail(
                                  groupId: groupId,
                                  targetEmail: email,
                                  role: role,
                                );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('✓ Invite sent to $email'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            emailController.clear();
                            onEmailChanged('');
                          } else {
                            final userCode = selectedUserCode.trim();
                            if (userCode.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Enter a user code first.')),
                              );
                              return;
                            }
                            await ref
                                .read(groupAccessActionsProvider)
                                .assignRoleByUserCode(
                                  groupId: groupId,
                                  targetUserCode: userCode,
                                  role: role,
                                );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('✓ Invite sent to user $userCode'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            userCodeController.clear();
                            onUserCodeChanged('');
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to send invite: $e'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.person_add_alt_1, size: 20),
                      label: const Text(
                        'Send Invite',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8B7355),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Extra space for keyboard
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class _ManageAccessTab extends ConsumerWidget {
  const _ManageAccessTab({
    required this.groupId,
    required this.rolesAsync,
    required this.onAssignRoleByEmail,
    required this.onRemove,
  });

  final int groupId;
  final AsyncValue<List<AssignableRole>> rolesAsync;
  final Future<void> Function(String email, int role) onAssignRoleByEmail;
  final Future<void> Function(String userCode) onRemove;

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
                final statusColor = m.status == 'active'
                    ? Colors.green
                    : m.status == 'pending'
                        ? Colors.orange
                        : Colors.red;
                final statusIcon = m.status == 'active'
                    ? Icons.check_circle
                    : m.status == 'pending'
                        ? Icons.pending
                        : Icons.cancel;

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: m.status == 'active'
                          ? Colors.grey[300]!
                          : statusColor.withOpacity(0.3),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor:
                                  const Color(0xFF8B7355).withOpacity(0.2),
                              child: Text(
                                m.accountName.isNotEmpty
                                    ? m.accountName[0].toUpperCase()
                                    : m.userCode[0].toUpperCase(),
                                style: const TextStyle(
                                  color: Color(0xFF8B7355),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    m.accountName.isNotEmpty
                                        ? m.accountName
                                        : 'User ${m.userCode}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    'Code: ${m.userCode}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              statusIcon,
                              color: statusColor,
                              size: 20,
                            ),
                          ],
                        ),
                        if (m.status != 'active') ...[
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              m.status == 'pending'
                                  ? 'Pending Invite'
                                  : 'Rejected',
                              style: TextStyle(
                                fontSize: 11,
                                color: statusColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B7355).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.admin_panel_settings,
                                color: Color(0xFF8B7355),
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      label,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF8B7355),
                                      ),
                                    ),
                                    if (roleDescription.isNotEmpty)
                                      Text(
                                        roleDescription,
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (m.status == 'active')
                                PopupMenuButton<int>(
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: Colors.grey[600],
                                  ),
                                  tooltip: 'Change role',
                                  onSelected: (newRole) async {
                                    if (newRole == m.role) return;
                                    try {
                                      // For active members, use email to update
                                      // Note: Backend may need user's email, which we don't have in the model
                                      // This is a limitation - we might need to store email in GroupRoleMember
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Role updates are not supported in this view. Please remove and re-add the user.'),
                                          backgroundColor: Colors.orange,
                                        ),
                                      );
                                    } catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content:
                                              Text('Failed to update role: $e'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    }
                                  },
                                  itemBuilder: (context) => roles
                                      .map(
                                        (r) => PopupMenuItem<int>(
                                          value: r.role,
                                          child: Row(
                                            children: [
                                              Icon(
                                                r.role == m.role
                                                    ? Icons.check_circle
                                                    : Icons.circle_outlined,
                                                size: 20,
                                                color: r.role == m.role
                                                    ? const Color(0xFF8B7355)
                                                    : Colors.grey[400],
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      r.label,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: r.role == m.role
                                                            ? const Color(
                                                                0xFF8B7355)
                                                            : null,
                                                      ),
                                                    ),
                                                    if (r
                                                        .description.isNotEmpty)
                                                      Text(
                                                        r.description,
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color:
                                                              Colors.grey[600],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                            ],
                          ),
                        ),
                        if (m.status == 'active') ...[
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () async {
                                final ok = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    title: Row(
                                      children: [
                                        Icon(
                                          Icons.warning_amber_rounded,
                                          color: Colors.orange[700],
                                        ),
                                        const SizedBox(width: 8),
                                        const Text('Remove Access'),
                                      ],
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            'Are you sure you want to remove:'),
                                        const SizedBox(height: 8),
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                m.accountName.isNotEmpty
                                                    ? m.accountName
                                                    : 'User ${m.userCode}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Code: ${m.userCode}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                          'This action cannot be undone.',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(false),
                                        child: const Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red,
                                          foregroundColor: Colors.white,
                                        ),
                                        child: const Text('Remove'),
                                      ),
                                    ],
                                  ),
                                );

                                if (ok != true) return;

                                try {
                                  await onRemove(m.userCode);
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            '✓ Removed ${m.accountName.isNotEmpty ? m.accountName : m.userCode}'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Failed to remove: $e'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                }
                              },
                              icon: const Icon(Icons.person_remove_alt_1,
                                  size: 18),
                              label: const Text('Remove Access'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                side: const BorderSide(color: Colors.red),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => PrintError(
            caller: 'GroupAccessPage(Manage) groupRoleMembersProvider',
            error: error,
            stackTrace: stackTrace,
            onRetry: () => ref.invalidate(groupRoleMembersProvider(groupId)),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => PrintError(
        caller: 'GroupAccessPage(Manage) assignableRolesProvider',
        error: error,
        stackTrace: stackTrace,
        onRetry: () => ref.invalidate(assignableRolesProvider),
      ),
    );
  }
}
