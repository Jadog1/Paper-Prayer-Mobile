import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';
import 'package:prayer_ml/prayers/home/calendar/components/event_card.dart';

/// Weekly calendar view component
class WeeklyView extends StatelessWidget {
  const WeeklyView({
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
    final weekStart = _getWeekStart(selectedDate);
    final days = List.generate(7, (index) => weekStart.add(Duration(days: index)));

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: days.length,
      itemBuilder: (context, index) {
        final day = days[index];
        final dayEvents = _filterEventsForDate(events, day);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                _formatDayHeader(day),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            
            // Events for this day
            if (dayEvents.isEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  "No events",
                  style: TextStyle(color: Colors.grey[500], fontStyle: FontStyle.italic),
                ),
              )
            else
              ...dayEvents.map((event) => EventCard(
                event: event,
                onTap: () => onEventTap(event),
              )),
            
            const Divider(height: 24),
          ],
        );
      },
    );
  }

  DateTime _getWeekStart(DateTime date) {
    // Get the Monday of the week
    return date.subtract(Duration(days: date.weekday - 1));
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

  String _formatDayHeader(DateTime date) {
    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return "${weekdays[date.weekday - 1]}, ${_formatDate(date)}";
  }

  String _formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }
}
