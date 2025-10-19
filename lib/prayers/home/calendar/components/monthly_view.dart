import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';

/// Monthly calendar view component
class MonthlyView extends StatelessWidget {
  const MonthlyView({
    super.key,
    required this.events,
    required this.selectedDate,
    required this.onDateTap,
  });

  final List<EventWithCollection> events;
  final DateTime selectedDate;
  final void Function(DateTime) onDateTap;

  @override
  Widget build(BuildContext context) {
    final monthStart = DateTime(selectedDate.year, selectedDate.month, 1);
    final monthEnd = DateTime(selectedDate.year, selectedDate.month + 1, 0);
    final daysInMonth = monthEnd.day;

    // Get unique priority labels for the legend
    final priorityLabels = _getUniquePriorityLabels(events);

    return Column(
      children: [
        // Priority Legend
        if (priorityLabels.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: priorityLabels.map((label) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _getPriorityColor(label),
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.grey[400]!, width: 0.5),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      label.isEmpty ? 'No Priority' : label,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),

        // Calendar Grid
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 0.6,
            ),
            itemCount: daysInMonth + monthStart.weekday - 1,
            itemBuilder: (context, index) {
              // Add empty cells for days before month starts
              if (index < monthStart.weekday - 1) {
                return Container();
              }

              final dayNumber = index - monthStart.weekday + 2;
              final date =
                  DateTime(selectedDate.year, selectedDate.month, dayNumber);
              final dayEvents = _filterEventsForDate(events, date);

              return GestureDetector(
                onTap: dayEvents.isNotEmpty ? () => onDateTap(date) : null,
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        dayEvents.isEmpty ? Colors.grey[100] : Colors.blue[50],
                    border: Border.all(
                      color: _isSameDay(date, DateTime.now())
                          ? Colors.blueAccent
                          : Colors.grey[300]!,
                      width: _isSameDay(date, DateTime.now()) ? 2 : 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Day number
                      Text(
                        '$dayNumber',
                        style: TextStyle(
                          fontWeight: _isSameDay(date, DateTime.now())
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: _isSameDay(date, DateTime.now())
                              ? Colors.blueAccent
                              : Colors.black87,
                          fontSize: 14,
                        ),
                      ),

                      // Event indicators with priority colors
                      if (dayEvents.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        _buildEventIndicators(dayEvents),

                        // People initials
                        const SizedBox(height: 2),
                        _buildPeopleIndicators(dayEvents),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  List<EventWithCollection> _filterEventsForDate(
    List<EventWithCollection> events,
    DateTime date,
  ) {
    return events.where((event) {
      try {
        final eventStart = DateTime.parse(event.event.eventStart);
        final eventEnd =
            event.event.eventEnd != null && event.event.eventEnd!.isNotEmpty
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

  /// Get unique priority labels from all events
  List<String> _getUniquePriorityLabels(List<EventWithCollection> events) {
    final labels =
        events.map((e) => e.collection.followUpRankLabel).toSet().toList();

    // Sort priorities: High, Medium, Low, then others alphabetically
    labels.sort((a, b) {
      const priorityOrder = {'High': 0, 'Medium': 1, 'Low': 2};
      final aOrder = priorityOrder[a] ?? 99;
      final bOrder = priorityOrder[b] ?? 99;

      if (aOrder != bOrder) return aOrder.compareTo(bOrder);
      return a.compareTo(b);
    });

    return labels;
  }

  /// Get color based on priority label
  Color _getPriorityColor(String priorityLabel) {
    switch (priorityLabel.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  /// Build event indicators with priority colors
  Widget _buildEventIndicators(List<EventWithCollection> dayEvents) {
    final visibleEvents = dayEvents.take(3).toList();
    final hasMore = dayEvents.length > 3;

    return Wrap(
      spacing: 2,
      runSpacing: 2,
      alignment: WrapAlignment.center,
      children: [
        ...visibleEvents.map((eventWithCollection) {
          final priority = eventWithCollection.collection.followUpRankLabel;
          return Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: _getPriorityColor(priority),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 0.5),
            ),
          );
        }),
        if (hasMore)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '+${dayEvents.length - 3}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  /// Build people indicators showing initials
  Widget _buildPeopleIndicators(List<EventWithCollection> dayEvents) {
    // Collect all unique people from related contacts
    final peopleNames = <String>{};

    for (final eventWithCollection in dayEvents) {
      final collection = eventWithCollection.collection;

      // Add the main user
      if (collection.user.name.isNotEmpty) {
        peopleNames.add(collection.user.name);
      }

      // Add related contacts
      for (final contact in collection.relatedContacts) {
        if (contact.name.isNotEmpty) {
          peopleNames.add(contact.name);
        }
      }
    }

    if (peopleNames.isEmpty) return const SizedBox.shrink();

    final visiblePeople = peopleNames.take(3).toList();
    final hasMore = peopleNames.length > 3;

    return Wrap(
      spacing: 2,
      runSpacing: 2,
      alignment: WrapAlignment.center,
      children: [
        ...visiblePeople.map((name) {
          final initials = _getInitials(name);
          return Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.blueGrey[300],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 0.5),
            ),
            child: Center(
              child: Text(
                initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
        if (hasMore)
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 0.5),
            ),
            child: Center(
              child: Text(
                '+${peopleNames.length - 3}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 6,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// Get initials from a name (up to 2 characters)
  String _getInitials(String name) {
    if (name.isEmpty) return '?';

    final parts = name.trim().split(' ');
    if (parts.length == 1) {
      return parts[0].substring(0, 1).toUpperCase();
    } else {
      return (parts[0].substring(0, 1) + parts[1].substring(0, 1))
          .toUpperCase();
    }
  }
}
