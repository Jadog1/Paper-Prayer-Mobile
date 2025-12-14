import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/contact_page_settings.dart';
import 'package:prayer_ml/prayers/groups/contact_view.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';

/// Modal bottom sheet displaying notebook members.
///
/// Features:
/// - List of all members in the notebook
/// - Member count display
/// - Edit button for each member (if user has edit permission)
/// - Tap to view member details
/// - Hero animation on navigation
class MembersModal extends StatelessWidget {
  const MembersModal({
    super.key,
    required this.groupContacts,
  });

  final GroupWithMembers groupContacts;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF8B7355).withValues(alpha: 0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.people,
                        color: Color(0xFF8B7355),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Members",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          Text(
                            "${groupContacts.members.length} member${groupContacts.members.length != 1 ? 's' : ''} in ${groupContacts.group.name}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Divider(height: 1, color: Colors.grey[200]),

              // Members list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: groupContacts.members.length,
                  itemBuilder: (context, index) {
                    final member = groupContacts.members[index];
                    return _MemberListTile(
                      member: member,
                      groupContacts: groupContacts,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Individual member list tile.
///
/// Displays member information with:
/// - Avatar with gradient
/// - Name and description
/// - Edit button (if user has permission)
/// - Navigation to contact view on tap
class _MemberListTile extends StatelessWidget {
  const _MemberListTile({
    required this.member,
    required this.groupContacts,
  });

  final Contact member;
  final GroupWithMembers groupContacts;

  @override
  Widget build(BuildContext context) {
    final bool canEdit =
        hasPermission(groupContacts.group, Permission.editGroup);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: () {
          Navigator.of(context).pop(); // Close modal
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContactView(
                contact: member,
                groupId: groupContacts.group.id,
              ),
            ),
          );
        },
        leading: Hero(
          tag: 'contact_${member.id}',
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green[400]!, Colors.green[600]!],
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        title: Text(
          member.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: member.description != null && member.description!.isNotEmpty
            ? Text(
                member.description!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              )
            : null,
        trailing: canEdit
            ? IconButton(
                icon: Icon(Icons.edit_outlined, color: Colors.grey[600]),
                onPressed: () {
                  Navigator.of(context).pop(); // Close modal
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ContactPageSettings(
                        contact: member,
                        group: groupContacts.group,
                      ),
                    ),
                  );
                },
              )
            : null,
      ),
    );
  }
}

/// Helper function to show the members modal.
void showMembersModal(BuildContext context, GroupWithMembers groupContacts) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => MembersModal(groupContacts: groupContacts),
  );
}
