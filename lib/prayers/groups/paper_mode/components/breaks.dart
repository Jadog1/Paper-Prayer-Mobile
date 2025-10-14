import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/paper_margin_space.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/recommended_requests.dart';

/// Creates a username break/divider showing the contact's name
/// 
/// This widget displays the user's name with an icon and can be tapped
/// to show recommended prayer requests for that contact.
Widget usernameBreak(BuildContext context, PrayerRequest prayerRequest) {
  var name = prayerRequest.user.name;
  if (name.isEmpty) {
    name = "No name";
  }
  return PaperMarginSpace(
    paperLine: GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) => RecommendedPrayerRequestsLoader(contact: prayerRequest.user),
        );
      },
      child: Row(
        children: [
          const Icon(Icons.auto_awesome, size: 16, color: Colors.amber),
          const SizedBox(width: 2),
          Text(
            name,
            textAlign: TextAlign.left,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ],
      ),
    ),
  );
}

/// Creates a date break/divider showing the date
Widget dateBreak(String timestamp, String Function(String) formatTimestamp) {
  return PaperMarginSpace(
    paperLine: Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 3),
          Text(
            formatTimestamp(timestamp),
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    ),
  );
}
