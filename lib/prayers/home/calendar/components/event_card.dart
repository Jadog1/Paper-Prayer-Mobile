import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';

/// Reusable event card component
class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
    required this.onTap,
  });

  final EventWithCollection event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Calculate if multi-day and number of days
    bool isMultiDay = false;
    int daysSpan = 1;
    try {
      final startDate = DateTime.parse(event.event.eventStart);
      final endDate = event.event.eventEnd != null && event.event.eventEnd!.isNotEmpty
          ? DateTime.parse(event.event.eventEnd!)
          : startDate;
      isMultiDay = !startDate.isAtSameMomentAs(endDate);
      daysSpan = endDate.difference(startDate).inDays + 1;
    } catch (e) {
      // If parsing fails, assume single day
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Event icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.event,
                  color: Colors.blueAccent,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              
              // Event details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (event.event.summary != null && event.event.summary!.isNotEmpty)
                      Text(
                        event.event.summary!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    const SizedBox(height: 4),
                    // Multi-day indicator
                    if (isMultiDay)
                      Row(
                        children: [
                          const Icon(Icons.date_range, size: 16, color: Colors.blueAccent),
                          const SizedBox(width: 4),
                          Text(
                            'Multi-day event ($daysSpan days)',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 4),
                    Text(
                      _formatEventDateRange(event),
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              
              // Chevron icon
              Icon(Icons.chevron_right, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }

  String _formatEventDateRange(EventWithCollection event) {
    try {
      final startDate = DateTime.parse(event.event.eventStart);
      final startFormatted = "${startDate.month}/${startDate.day}/${startDate.year}";

      if (event.event.eventEnd != null && event.event.eventEnd!.isNotEmpty) {
        final endDate = DateTime.parse(event.event.eventEnd!);
        final endFormatted = "${endDate.month}/${endDate.day}/${endDate.year}";
        
        if (startFormatted == endFormatted) {
          return startFormatted;
        }
        return "$startFormatted - $endFormatted";
      }
      
      return startFormatted;
    } catch (e) {
      return event.event.eventStart;
    }
  }
}
