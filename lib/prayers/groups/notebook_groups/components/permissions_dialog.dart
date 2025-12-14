import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';

/// Dialog displaying user permissions for a notebook.
///
/// Shows a detailed breakdown of:
/// - Notebook permissions (view, edit prayers, manage, delete)
/// - Document permissions (view, edit, delete documents)
///
/// Each permission displays a visual indicator (check/cross) and description.
class PermissionsDialog extends StatelessWidget {
  const PermissionsDialog({
    super.key,
    required this.groupContacts,
  });

  final GroupWithMembers groupContacts;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF8B7355).withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.security,
              color: Color(0xFF8B7355),
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Permissions',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Access rights for this notebook',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF9E6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFF8B7355).withValues(alpha: 0.2),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.book,
                    color: Color(0xFF8B7355),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      groupContacts.group.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'What you can do:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            _PermissionItem(
              label: 'View content',
              description: 'See prayers and requests in this notebook',
              granted: hasPermission(groupContacts.group, Permission.view),
            ),
            _PermissionItem(
              label: 'Edit prayers',
              description: 'Add, edit, and modify prayer requests',
              granted:
                  hasPermission(groupContacts.group, Permission.editPrayers),
            ),
            _PermissionItem(
              label: 'Manage notebook',
              description: 'Edit notebook settings and members',
              granted: hasPermission(groupContacts.group, Permission.editGroup),
            ),
            _PermissionItem(
              label: 'Delete notebook',
              description: 'Permanently delete this notebook',
              granted:
                  hasPermission(groupContacts.group, Permission.deleteGroup),
            ),
            const Divider(height: 24),
            const Text(
              'Document permissions:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            _PermissionItem(
              label: 'View documents',
              description: 'Access attached documents',
              granted:
                  hasPermission(groupContacts.group, Permission.viewDocument),
            ),
            _PermissionItem(
              label: 'Edit documents',
              description: 'Upload and modify documents',
              granted:
                  hasPermission(groupContacts.group, Permission.editDocument),
            ),
            _PermissionItem(
              label: 'Delete documents',
              description: 'Remove documents from notebook',
              granted:
                  hasPermission(groupContacts.group, Permission.deleteDocument),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Close',
            style: TextStyle(color: Color(0xFF8B7355)),
          ),
        ),
      ],
    );
  }
}

/// Individual permission item widget.
///
/// Displays a permission with:
/// - Visual indicator (check mark if granted, X if not)
/// - Label and description
/// - Color-coded based on grant status
class _PermissionItem extends StatelessWidget {
  const _PermissionItem({
    required this.label,
    required this.description,
    required this.granted,
  });

  final String label;
  final String description;
  final bool granted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: granted
                  ? Colors.green.withValues(alpha: 0.1)
                  : Colors.red.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              granted ? Icons.check : Icons.close,
              color: granted ? Colors.green : Colors.red,
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: granted ? Colors.grey[800] : Colors.grey[500],
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 11,
                    color: granted ? Colors.grey[600] : Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Helper function to show the permissions dialog.
void showPermissionsDialog(
    BuildContext context, GroupWithMembers groupContacts) {
  showDialog(
    context: context,
    builder: (context) => PermissionsDialog(groupContacts: groupContacts),
  );
}
