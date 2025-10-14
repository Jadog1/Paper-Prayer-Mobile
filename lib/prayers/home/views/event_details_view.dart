import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';

/// View for displaying prayer requests associated with a specific event
/// This view opens paper mode in read-only mode filtered by event_id
class EventDetailsView extends ConsumerWidget {
  const EventDetailsView({
    super.key,
    required this.event,
    required this.groupContacts,
  });

  final PrayerCollectionEvent event;
  final GroupContacts groupContacts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Prayer Requests"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Event summary header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              border: Border(
                bottom: BorderSide(color: Colors.blue[200]!, width: 1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (event.summary != null && event.summary!.isNotEmpty)
                  Text(
                    event.summary!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16, color: Colors.blueAccent),
                    const SizedBox(width: 6),
                    Text(
                      _formatEventDate(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Paper mode with event filter (read-only)
          Expanded(
            child: PaperMode(
              currentGroup: groupContacts,
              config: PaperModeConfig(
                readOnly: true,
                showHeader: false,
                eventId: event.id,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatEventDate() {
    try {
      final startDate = DateTime.parse(event.eventStart);
      final startFormatted = "${startDate.month}/${startDate.day}/${startDate.year}";
      
      if (event.eventEnd != null && event.eventEnd!.isNotEmpty) {
        final endDate = DateTime.parse(event.eventEnd!);
        final endFormatted = "${endDate.month}/${endDate.day}/${endDate.year}";
        return "$startFormatted - $endFormatted";
      }
      
      return startFormatted;
    } catch (e) {
      return event.eventStart;
    }
  }
}
