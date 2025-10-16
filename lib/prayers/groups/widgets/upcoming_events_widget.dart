import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';
import 'package:prayer_ml/prayers/home/repos/events_repo.dart';
import 'package:prayer_ml/prayers/home/views/event_details_view.dart';

/// Reusable widget for displaying upcoming events
class UpcomingEventsWidget extends ConsumerWidget {
  const UpcomingEventsWidget({
    super.key,
    this.contactId,
    this.collectionId,
    required this.title,
    required this.subtitle,
    this.onViewAll,
    this.limit = 5,
    this.maxDays = 30,
  }) : assert(contactId != null || collectionId != null, 
              'Either contactId or collectionId must be provided');

  final int? contactId;
  final int? collectionId;
  final String title;
  final String subtitle;
  final VoidCallback? onViewAll;
  final int limit;
  final int maxDays;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureEvents = ref.watch(
      fetchFutureEventsProvider(
        limit: limit,
        maxDays: maxDays,
        contactId: contactId,
        collectionId: collectionId,
      ),
    );

    return Container(
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.upcoming, size: 20, color: Colors.blue[700]),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    if (onViewAll != null)
                      TextButton.icon(
                        onPressed: onViewAll,
                        icon: const Icon(Icons.calendar_month, size: 16),
                        label: const Text("View All"),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          // Events List
          futureEvents.when(
            data: (events) {
              if (events.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.event_available, size: 48, color: Colors.grey[300]),
                        const SizedBox(height: 8),
                        Text(
                          "No upcoming events",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Column(
                children: events.map((event) => _EventListItem(event: event)).toList(),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Error loading events",
                style: TextStyle(color: Colors.red[700]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EventListItem extends StatelessWidget {
  const _EventListItem({required this.event});

  final PrayerCollectionEvent event;

  @override
  Widget build(BuildContext context) {
    final startDate = DateTime.parse(event.eventStart);
    final now = DateTime.now();
    final daysUntil = startDate.difference(now).inDays;

    String dateLabel;
    Color dateColor;
    if (daysUntil == 0) {
      dateLabel = "Today";
      dateColor = Colors.red;
    } else if (daysUntil == 1) {
      dateLabel = "Tomorrow";
      dateColor = Colors.orange;
    } else if (daysUntil < 7) {
      dateLabel = "In $daysUntil days";
      dateColor = Colors.blue;
    } else {
      dateLabel = DateFormat('MMM d').format(startDate);
      dateColor = Colors.grey;
    }

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EventDetailsView(event: event),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey[200]!),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 40,
              decoration: BoxDecoration(
                color: dateColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (event.summary != null && event.summary!.isNotEmpty)
                    Text(
                      event.summary!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  else
                    Text(
                      "Event",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  const SizedBox(height: 2),
                  Text(
                    dateLabel,
                    style: TextStyle(
                      fontSize: 12,
                      color: dateColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
          ],
        ),
      ),
    );
  }
}
