import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/paper_mode.dart';

/// Reusable widget for displaying prayer notes with PaperMode
class PrayerNotesWidget extends StatelessWidget {
  const PrayerNotesWidget({
    super.key,
    required this.groupId,
    this.collectionId,
    this.contactId,
    this.height = 400,
    this.showHeader = true,
    this.title = "Prayer Notes",
  }) : assert(collectionId != null || contactId != null,
              'Either collectionId or contactId must be provided');

  final int groupId;
  final int? collectionId;
  final int? contactId;
  final double height;
  final bool showHeader;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
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

          // PaperMode content
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(12),
                bottomRight: const Radius.circular(12),
                topLeft: showHeader ? Radius.zero : const Radius.circular(12),
                topRight: showHeader ? Radius.zero : const Radius.circular(12),
              ),
              child: PaperMode(
                config: PaperModeConfig.editable(
                  groupId: groupId,
                  collectionId: collectionId,
                  contactId: contactId,
                  showHeader: false,
                  skipKeyboardFocusOnLoad: true,
                  noPadding: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
