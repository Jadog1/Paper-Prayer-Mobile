import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/batch_paper_mode.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/group_page_settings.dart';
import 'package:prayer_ml/prayers/groups/group_access/group_access_page.dart';
import 'painters.dart';
import 'paper_mode_permissions.dart';
import 'permissions_dialog.dart';
import 'members_modal.dart';

/// Individual notebook card widget.
///
/// Features:
/// - Notebook-style design with spiral binding and paper texture
/// - Permission badge showing user's access level
/// - Context menu for batch insert, access management, members, and settings
/// - Permission dialogs and member list modals
/// - Navigation to PaperMode on tap
class GroupNotebook extends ConsumerWidget {
  const GroupNotebook({super.key, required this.groupContacts});

  final GroupWithMembers groupContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.3),
      color: const Color(0xFFFFF9E6), // Warm paper color
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          children: [
            // Spiral binding (Left Side)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 24,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade400,
                      Colors.grey.shade300,
                      Colors.grey.shade400,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    8,
                    (index) => Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade600,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 2,
                            offset: const Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Paper texture lines
            Positioned(
              left: 32,
              right: 8,
              top: 50,
              bottom: 50,
              child: CustomPaint(
                painter: NotebookLinesPainter(),
              ),
            ),

            // Corner fold effect
            Positioned(
              top: 0,
              right: 0,
              child: CustomPaint(
                size: const Size(30, 30),
                painter: CornerFoldPainter(),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 12, top: 12, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Group Name & Description
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => PaperModePermissions(
                                groupContacts: groupContacts)),
                      ),
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              groupContacts.group.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade900,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    offset: const Offset(0.5, 0.5),
                                  ),
                                ],
                              ),
                            ),
                            if (groupContacts.group.description != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  groupContacts.group.description!,
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 13,
                                    height: 1.4,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom Action Bar - Permission Badge + Menu Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPermissionBadge(context, groupContacts.group),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: PopupMenuButton<String>(
                          icon: Icon(
                            Icons.more_horiz,
                            color: Colors.grey.shade700,
                            size: 20,
                          ),
                          padding: const EdgeInsets.all(8),
                          tooltip: 'Notebook Options',
                          onSelected: (value) {
                            switch (value) {
                              case 'batch_insert':
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => BatchPaperMode(
                                      config: BatchPaperModeConfig.withGroup(
                                        groupContacts: groupContacts,
                                      ),
                                    ),
                                  ),
                                );
                                break;
                              case 'access':
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => GroupAccessPage(
                                      groupId: groupContacts.group.id,
                                      groupName: groupContacts.group.name,
                                      mode: GroupAccessPageMode.add,
                                    ),
                                  ),
                                );
                                break;
                              case 'settings':
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => GroupSettings(
                                        groupContacts: groupContacts),
                                  ),
                                );
                                break;
                              case 'members':
                                showMembersModal(context, groupContacts);
                                break;
                            }
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'batch_insert',
                              enabled: hasPermission(
                                  groupContacts.group, Permission.editPrayers),
                              child: Row(
                                children: [
                                  Icon(Icons.playlist_add,
                                      size: 20, color: Colors.grey.shade700),
                                  const SizedBox(width: 12),
                                  const Text('Batch Insert'),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'access',
                              enabled: hasPermission(
                                  groupContacts.group, Permission.editGroup),
                              child: Row(
                                children: [
                                  Icon(Icons.person_add_alt_1,
                                      size: 20, color: Colors.grey.shade700),
                                  const SizedBox(width: 12),
                                  const Text('Manage Access'),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'members',
                              child: Row(
                                children: [
                                  Icon(Icons.people,
                                      size: 20, color: Colors.grey.shade700),
                                  const SizedBox(width: 12),
                                  const Text('View Members'),
                                ],
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'settings',
                              enabled: hasPermission(
                                  groupContacts.group, Permission.editGroup),
                              child: Row(
                                children: [
                                  Icon(Icons.settings,
                                      size: 20, color: Colors.grey.shade700),
                                  const SizedBox(width: 12),
                                  const Text('Settings'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionBadge(
      BuildContext context, GroupWithPermissions group) {
    final bool canEdit = hasPermission(group, Permission.editPrayers);
    final bool canManage = hasPermission(group, Permission.deleteGroup);

    final Color color;
    final IconData icon;

    if (canManage) {
      color = const Color(0xFF8B7355);
      icon = Icons.admin_panel_settings;
    } else if (canEdit) {
      color = Colors.blue.shade700;
      icon = Icons.edit;
    } else {
      color = Colors.grey.shade600;
      icon = Icons.visibility;
    }

    return GestureDetector(
      onTap: () => showPermissionsDialog(context, groupContacts),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.9),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Icon(icon, size: 14, color: Colors.white),
      ),
    );
  }
}
