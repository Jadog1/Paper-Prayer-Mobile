import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/account_permissions_model.dart';
import 'package:prayer_ml/prayers/groups/group_access/components/search_user_section.dart';
import 'package:prayer_ml/prayers/groups/group_access/components/grant_access_section.dart';

class AddAccessTab extends ConsumerWidget {
  const AddAccessTab({
    super.key,
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Section
            SearchUserSection(
              searchController: searchController,
              searchText: searchText,
              onSearchChanged: onSearchChanged,
              onSelectUserCode: onSelectUserCode,
            ),

            const SizedBox(height: 24),

            // Invite Section
            GrantAccessSection(
              groupId: groupId,
              rolesAsync: rolesAsync,
              userCodeController: userCodeController,
              emailController: emailController,
              selectedUserCode: selectedUserCode,
              selectedEmail: selectedEmail,
              selectedRole: selectedRole,
              inviteByEmail: inviteByEmail,
              onUserCodeChanged: onUserCodeChanged,
              onEmailChanged: onEmailChanged,
              onSelectRole: onSelectRole,
              onToggleInviteByEmail: onToggleInviteByEmail,
            ),

            // Extra space for keyboard
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
