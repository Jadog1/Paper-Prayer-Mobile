import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/paper_margin_space.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/recommended_requests.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/export_provider.dart';

/// Creates a username break/divider showing the contact's name
/// 
/// This widget displays the user's name with an icon and can be tapped
/// to show recommended prayer requests for that contact.
/// In export mode, tapping selects all requests for that user.
Widget usernameBreak(
  BuildContext context,
  PrayerRequest prayerRequest, {
  List<PrayerRequest>? userRequests,
  WidgetRef? ref,
}) {
  var name = prayerRequest.user.name;
  if (name.isEmpty) {
    name = "No name";
  }

  final exportState = ref?.watch(exportStateProvider).state;
  final isExportMode = exportState?.isExportMode ?? false;

  return PaperMarginSpace(
    paperLine: GestureDetector(
      onTap: () {
        if (isExportMode && userRequests != null && ref != null) {
          // In export mode, toggle all requests for this user
          ref.read(exportStateProvider).toggleMultipleRequests(userRequests);
        } else {
          // Normal mode: show recommendations
          showModalBottomSheet(
            context: context,
            builder: (_) => RecommendedPrayerRequestsLoader(contact: prayerRequest.user),
          );
        }
      },
      child: Row(
        children: [
          Icon(
            isExportMode ? Icons.check_circle_outline : Icons.auto_awesome,
            size: 16,
            color: isExportMode ? Theme.of(context).colorScheme.primary : Colors.amber,
          ),
          const SizedBox(width: 2),
          Text(
            name,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: isExportMode
                  ? Theme.of(context).colorScheme.primary
                  : null,
            ),
          ),
        ],
      ),
    ),
  );
}

/// Creates a date break/divider showing the date
/// In export mode, tapping selects all requests for that date.
Widget dateBreak(
  String timestamp,
  String Function(String) formatTimestamp, {
  List<PrayerRequest>? dateRequests,
  WidgetRef? ref,
  BuildContext? context,
}) {
  final exportState = ref?.watch(exportStateProvider).state;
  final isExportMode = exportState?.isExportMode ?? false;

  return PaperMarginSpace(
    paperLine: Expanded(
      child: GestureDetector(
        onTap: isExportMode && dateRequests != null && ref != null
            ? () {
                // In export mode, toggle all requests for this date
                ref.read(exportStateProvider).toggleMultipleRequests(dateRequests);
              }
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 3),
            Text(
              formatTimestamp(timestamp),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
                color: isExportMode && context != null
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
