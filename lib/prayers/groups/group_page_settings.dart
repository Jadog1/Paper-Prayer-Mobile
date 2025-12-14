import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prayer_ml/prayers/groups/contact_page_settings.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/shared/widgets.dart';

class GroupSettings extends ConsumerStatefulWidget {
  const GroupSettings({super.key, this.groupContacts});

  final GroupWithMembers? groupContacts;

  @override
  ConsumerState<GroupSettings> createState() => _GroupSettingsState();
}

class _GroupSettingsState extends ConsumerState<GroupSettings> {
  var _name = '';
  var _description = '';

  @override
  void initState() {
    super.initState();
    if (widget.groupContacts == null) {
      return;
    }
    setState(() {
      _name = widget.groupContacts!.group.name;
      _description = widget.groupContacts!.group.description ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    var groupContacts = widget.groupContacts ??
        const GroupWithMembers(
          group: GroupWithPermissions(id: 0, name: "", description: ""),
          members: [],
          memberWithContactGroupPairs: [],
        );

    final isNewGroup = widget.groupContacts == null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isNewGroup ? 'Create New Notebook' : 'Edit Notebook'),
        backgroundColor: const Color(0xFF8B7355),
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          if (!isNewGroup)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Delete Notebook',
              onPressed: () =>
                  _showDeleteGroupDialog(context, groupContacts.group.id),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Group Info Card
            _buildGroupInfoCard(groupContacts),

            const SizedBox(height: 24),

            // Members Section
            if (!isNewGroup) ...[
              _buildMembersHeader(context, groupContacts),
              const SizedBox(height: 12),
              _buildMembersList(groupContacts),
            ],

            const SizedBox(height: 24),

            // Action Buttons
            _buildActionButtons(context, groupContacts, isNewGroup),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupInfoCard(GroupWithMembers groupContacts) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.book, color: Colors.grey[700], size: 24),
                const SizedBox(width: 8),
                Text(
                  'Notebook Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              initialValue: groupContacts.group.name,
              decoration: InputDecoration(
                labelText: 'Notebook Name',
                hintText: 'Enter notebook name',
                prefixIcon: const Icon(Icons.edit),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              onChanged: (value) => _name = value,
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: groupContacts.group.description,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter a description (optional)',
                prefixIcon: const Icon(Icons.description),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              maxLines: 3,
              onChanged: (value) => _description = value,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMembersHeader(
      BuildContext context, GroupWithMembers groupContacts) {
    return Row(
      children: [
        Icon(Icons.people, color: Colors.grey[700], size: 22),
        const SizedBox(width: 8),
        Text(
          'Members',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF8B7355).withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '${groupContacts.members.length}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF8B7355),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMembersList(GroupWithMembers groupContacts) {
    if (groupContacts.members.isEmpty) {
      return Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                Icon(Icons.people_outline, size: 48, color: Colors.grey[400]),
                const SizedBox(height: 12),
                Text(
                  'No members yet',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Add members to start tracking prayers',
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: groupContacts.members
          .map((member) => EditUserForGroup(
                user: member,
                group: groupContacts.group,
              ))
          .toList(),
    );
  }

  Widget _buildActionButtons(
      BuildContext context, GroupWithMembers groupContacts, bool isNewGroup) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: const BorderSide(color: Color(0xFF8B7355)),
              foregroundColor: const Color(0xFF8B7355),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Cancel', style: TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: InteractiveLoadButton(
            customProvider: () async {
              var newGroup = groupContacts.group.copyWith(
                name: _name.isEmpty ? groupContacts.group.name : _name,
                description: _description.isEmpty
                    ? groupContacts.group.description
                    : _description,
              );
              await ref
                  .read(groupContactsRepoProvider.notifier)
                  .saveGroup(newGroup);
            },
            buttonText: isNewGroup ? 'Create Notebook' : 'Save Changes',
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B7355),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 2,
            ),
            successCallback: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }

  void _showDeleteGroupDialog(BuildContext context, int groupId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red),
            SizedBox(width: 8),
            Text('Delete Notebook'),
          ],
        ),
        content: const Text(
          'Are you sure you want to delete this notebook? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          InteractiveLoadButton(
            customProvider: () => ref
                .read(groupContactsRepoProvider.notifier)
                .removeGroup(groupId),
            buttonText: 'Delete',
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            successCallback: () {
              var nav = Navigator.of(context);
              nav.pop(); // Close dialog
              nav.pop(); // Close settings page
            },
          ),
        ],
      ),
    );
  }
}

class EditUserForGroup extends ConsumerWidget {
  const EditUserForGroup({super.key, required this.user, required this.group});

  final Contact user;
  final GroupWithPermissions group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                ContactPageSettings(contact: user, group: group),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF8B7355).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B7355),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Name and description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    if (user.description != null &&
                        user.description!.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        user.description!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(width: 8),

              // Action buttons
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, size: 20),
                    color: const Color(0xFF8B7355),
                    tooltip: 'Edit',
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ContactPageSettings(contact: user, group: group),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline, size: 20),
                    color: Colors.red[400],
                    tooltip: 'Remove',
                    onPressed: () =>
                        _showDeleteMemberDialog(context, ref, user),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteMemberDialog(
      BuildContext context, WidgetRef ref, Contact user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Row(
          children: [
            Icon(Icons.person_remove, color: Colors.orange),
            SizedBox(width: 8),
            Text('Remove Member'),
          ],
        ),
        content: Text(
          'Remove ${user.name} from this notebook? Their prayer requests will not be deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          InteractiveLoadButton(
            customProvider: () => ref
                .read(groupContactsRepoProvider.notifier)
                .removeContactFromGroup(group.id, user.id),
            buttonText: 'Remove',
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            successCallback: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
