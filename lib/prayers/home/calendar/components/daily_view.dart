import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';
import 'package:prayer_ml/prayers/home/calendar/components/event_card.dart';

/// Daily calendar view component
class DailyView extends StatelessWidget {
  const DailyView({
    super.key,
    required this.events,
    required this.selectedDate,
    required this.onEventTap,
  });

  final List<EventWithCollection> events;
  final DateTime selectedDate;
  final void Function(EventWithCollection) onEventTap;

  @override
  Widget build(BuildContext context) {
    // Filter events for the selected day
    final dayEvents = _filterEventsForDate(events, selectedDate);

    if (dayEvents.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_busy, size: 64, color: Colors.grey[300]),
            const SizedBox(height: 16),
            Text(
              "No events on this day",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dayEvents.length,
      itemBuilder: (context, index) {
        return EventCard(
          event: dayEvents[index],
          onTap: () => onEventTap(dayEvents[index]),
        );
      },
    );
  }

  List<EventWithCollection> _filterEventsForDate(
    List<EventWithCollection> events,
    DateTime date,
  ) {
    return events.where((event) {
      try {
        final eventStart = DateTime.parse(event.event.eventStart);
        final eventEnd = event.event.eventEnd != null && event.event.eventEnd!.isNotEmpty
            ? DateTime.parse(event.event.eventEnd!)
            : eventStart;

        return _isSameDay(eventStart, date) ||
            _isSameDay(eventEnd, date) ||
            (eventStart.isBefore(date) && eventEnd.isAfter(date));
      } catch (e) {
        return false;
      }
    }).toList();
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
