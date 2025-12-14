import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/paper_mode.dart';

/// Reusable widget for displaying prayer notes with PaperMode
class PrayerNotesWidget extends StatelessWidget {
  const PrayerNotesWidget({
    super.key,
    required this.groupId,
    this.collectionId,
    this.contactId,
    this.maxHeight = 400,
    this.showHeader = true,
    this.title = "Prayer Notes",
    this.permissions,
  }) : assert(collectionId != null || contactId != null,
            'Either collectionId or contactId must be provided');

  final int groupId;
  final int? collectionId;
  final int? contactId;
  final double maxHeight;
  final bool showHeader;
  final String title;
  final List<String>? permissions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          if (showHeader)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.note_alt, size: 20, color: Colors.blue[700]),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

          // Simple header when showHeader is false
          if (!showHeader)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.blue[100]!,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue[900],
                  letterSpacing: 0.3,
                ),
              ),
            ),

          // PaperMode content
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            child: PaperModePermissions(
              groupId: groupId,
              collectionId: collectionId,
              contactId: contactId,
              showHeader: showHeader,
              maxHeight: maxHeight,
              permissions: permissions,
            ),
          ),
        ],
      ),
    );
  }
}

class PaperModePermissions extends StatelessWidget {
  const PaperModePermissions({
    super.key,
    required this.groupId,
    required this.collectionId,
    required this.contactId,
    required this.showHeader,
    required this.maxHeight,
    this.permissions,
  });

  final int groupId;
  final int? collectionId;
  final int? contactId;
  final bool showHeader;
  final double maxHeight;
  final List<String>? permissions;

  @override
  Widget build(BuildContext context) {
    if (permissions != null &&
        !permissions!.contains(Permission.editPrayers.value)) {
      return PaperMode(
        config: PaperModeConfig.readOnly(
          collectionId: collectionId,
          contactId: contactId,
          showHeader: showHeader,
          noPadding: true,
          maxHeight: maxHeight,
          shrinkWrap: true,
          disablePullToRefresh: true,
        ),
      );
    }

    return PaperMode(
      config: PaperModeConfig.editable(
        groupId: groupId,
        collectionId: collectionId,
        contactId: contactId,
        showHeader: showHeader,
        skipKeyboardFocusOnLoad: true,
        noPadding: true,
        maxHeight: maxHeight,
        shrinkWrap: true,
        disablePullToRefresh: true,
      ),
    );
  }
}
