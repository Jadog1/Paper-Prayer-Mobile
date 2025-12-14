import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/paper_mode.dart';

/// Permission wrapper for PaperMode.
///
/// Checks user permissions and displays:
/// - Access denied screen if no view permission
/// - Read-only PaperMode if view-only permission
/// - Editable PaperMode if edit permission granted
class PaperModePermissions extends StatelessWidget {
  const PaperModePermissions({
    super.key,
    required this.groupContacts,
  });

  final GroupWithMembers groupContacts;

  @override
  Widget build(BuildContext context) {
    if (!hasPermission(groupContacts.group, Permission.view)) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Access Denied"),
          backgroundColor: const Color(0xFF8B7355),
        ),
        body: const Center(
          child: Text(
            "You do not have permission to view this notebook.",
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }
    if (!hasPermission(groupContacts.group, Permission.editPrayers)) {
      return PaperMode(
          config: PaperModeConfig.readOnly(
              groupContacts: groupContacts, showHeader: true));
    }
    return PaperMode(
        config: PaperModeConfig.editable(groupContacts: groupContacts));
  }
}
