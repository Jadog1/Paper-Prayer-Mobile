import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/group_access/group_access_repo.dart';
import 'package:prayer_ml/prayers/groups/models/account_permissions_model.dart';
import 'package:prayer_ml/shared/widgets.dart';

class GrantAccessSection extends ConsumerWidget {
  const GrantAccessSection({
    super.key,
    required this.groupId,
    required this.rolesAsync,
    required this.userCodeController,
    required this.emailController,
    required this.selectedUserCode,
    required this.selectedEmail,
    required this.selectedRole,
    required this.inviteByEmail,
    required this.onUserCodeChanged,
    required this.onEmailChanged,
    required this.onSelectRole,
    required this.onToggleInviteByEmail,
  });

  final int groupId;
  final AsyncValue<List<AssignableRole>> rolesAsync;
  final TextEditingController userCodeController;
  final TextEditingController emailController;
  final String selectedUserCode;
  final String selectedEmail;
  final int? selectedRole;
  final bool inviteByEmail;
  final ValueChanged<String> onUserCodeChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<int?> onSelectRole;
  final ValueChanged<bool> onToggleInviteByEmail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
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
                prefixIcon: const Icon(Icons.tag, color: Color(0xFF8B7355)),
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
                prefixIcon:
                    const Icon(Icons.email_outlined, color: Color(0xFF8B7355)),
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
              final effectiveRole =
                  selectedRole ?? (roles.isNotEmpty ? roles[0].role : null);
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
              caller: 'GrantAccessSection assignableRolesProvider',
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
                final roles = rolesAsync.value ?? const <AssignableRole>[];
                final role =
                    selectedRole ?? (roles.isNotEmpty ? roles[0].role : null);
                if (role == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No roles available.')),
                  );
                  return;
                }

                try {
                  if (inviteByEmail) {
                    final email = selectedEmail.trim();
                    if (email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Enter an email first.')),
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
                        content: Text('✓ Invite sent to user $userCode'),
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
    );
  }
}
