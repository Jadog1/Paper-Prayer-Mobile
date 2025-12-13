import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/group_access/group_access_repo.dart';
import 'package:prayer_ml/prayers/groups/group_access/components/add_access_tab.dart';
import 'package:prayer_ml/prayers/groups/group_access/components/manage_access_tab.dart';

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
            AddAccessTab(
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
            ManageAccessTab(
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
              onRevoke: (userCode) async {
                await ref.read(groupAccessActionsProvider).revokeInviteByUserCode(
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
