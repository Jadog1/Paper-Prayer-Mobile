import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';
import 'package:prayer_ml/prayers/home/repos/events_repo.dart';
import 'package:prayer_ml/prayers/home/views/event_details_view.dart';
import 'package:prayer_ml/shared/widgets.dart';

enum CalendarViewType { daily, weekly, monthly }

/// Calendar view for viewing events in daily, weekly, or monthly format
class CalendarView extends ConsumerStatefulWidget {
  const CalendarView({
    super.key,
  });

  @override
  ConsumerState<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends ConsumerState<CalendarView> {
  CalendarViewType _viewType = CalendarViewType.monthly;
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events Calendar"),
        backgroundColor: Colors.blueAccent,
        actions: [
          // View type selector
          PopupMenuButton<CalendarViewType>(
            icon: const Icon(Icons.view_module),
            onSelected: (CalendarViewType type) {
              setState(() {
                _viewType = type;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: CalendarViewType.daily,
                child: Row(
                  children: [
                    Icon(Icons.view_day, size: 20),
                    SizedBox(width: 8),
                    Text("Daily"),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: CalendarViewType.weekly,
                child: Row(
                  children: [
                    Icon(Icons.view_week, size: 20),
                    SizedBox(width: 8),
                    Text("Weekly"),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: CalendarViewType.monthly,
                child: Row(
                  children: [
                    Icon(Icons.calendar_month, size: 20),
                    SizedBox(width: 8),
                    Text("Monthly"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          // Date navigation header
          _buildDateNavigationHeader(),
          
          // Calendar content based on view type
          Expanded(
            child: _buildCalendarContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildDateNavigationHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        border: Border(
          bottom: BorderSide(color: Colors.blue[200]!, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: _previousPeriod,
          ),
          Text(
            _getDateRangeText(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: _nextPeriod,
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarContent() {
    final dateRange = _getDateRange();
    final startDate = dateRange['start']!.toIso8601String();
    final endDate = dateRange['end']!.toIso8601String();

    final eventsAsync = ref.watch(
      fetchEventsInRangeProvider(
        startDate: startDate,
        endDate: endDate,
        limit: 100,
      ),
    );

    return eventsAsync.when(
      data: (paginatedEvents) {
        switch (_viewType) {
          case CalendarViewType.daily:
            return _buildDailyView(paginatedEvents.events);
          case CalendarViewType.weekly:
            return _buildWeeklyView(paginatedEvents.events);
          case CalendarViewType.monthly:
            return _buildMonthlyView(paginatedEvents.events);
        }
      },
      loading: () => const CreativeLoadingScreen(
        icon: Icons.calendar_month,
        iconColor: Colors.blueAccent,
        primaryText: 'Loading calendar events...',
        secondaryText: 'Gathering your upcoming moments',
      ),
      error: (error, stackTrace) => PrintError(
        caller: "CalendarView",
        error: error,
        stackTrace: stackTrace,
      ),
    );
  }

  Widget _buildDailyView(List<PrayerCollectionEvent> events) {
    // Filter events for the selected day
    final dayEvents = _filterEventsForDate(events, _selectedDate);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: dayEvents.length,
      itemBuilder: (context, index) {
        return _buildEventCard(dayEvents[index]);
      },
    );
  }

  Widget _buildWeeklyView(List<PrayerCollectionEvent> events) {
    final weekStart = _getWeekStart(_selectedDate);
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
              ...dayEvents.map((event) => _buildEventCard(event)),
            
            const Divider(height: 24),
          ],
        );
      },
    );
  }

  Widget _buildMonthlyView(List<PrayerCollectionEvent> events) {
    final monthStart = DateTime(_selectedDate.year, _selectedDate.month, 1);
    final monthEnd = DateTime(_selectedDate.year, _selectedDate.month + 1, 0);
    final daysInMonth = monthEnd.day;

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.8,
      ),
      itemCount: daysInMonth + monthStart.weekday - 1,
      itemBuilder: (context, index) {
        // Add empty cells for days before month starts
        if (index < monthStart.weekday - 1) {
          return Container();
        }

        final dayNumber = index - monthStart.weekday + 2;
        final date = DateTime(_selectedDate.year, _selectedDate.month, dayNumber);
        final dayEvents = _filterEventsForDate(events, date);

        return GestureDetector(
          onTap: dayEvents.isNotEmpty
              ? () {
                  setState(() {
                    _selectedDate = date;
                    _viewType = CalendarViewType.daily;
                  });
                }
              : null,
          child: Container(
            decoration: BoxDecoration(
              color: dayEvents.isEmpty ? Colors.grey[100] : Colors.blue[50],
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
                Text(
                  '$dayNumber',
                  style: TextStyle(
                    fontWeight: _isSameDay(date, DateTime.now())
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _isSameDay(date, DateTime.now())
                        ? Colors.blueAccent
                        : Colors.black87,
                  ),
                ),
                if (dayEvents.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${dayEvents.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEventCard(PrayerCollectionEvent event) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EventDetailsView(
                event: event,
              ),
            ),
          );
        },
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
                    if (event.summary != null && event.summary!.isNotEmpty)
                      Text(
                        event.summary!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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

  // Helper methods
  String _getDateRangeText() {
    switch (_viewType) {
      case CalendarViewType.daily:
        return _formatDate(_selectedDate);
      case CalendarViewType.weekly:
        final weekStart = _getWeekStart(_selectedDate);
        final weekEnd = weekStart.add(const Duration(days: 6));
        return "${_formatDate(weekStart)} - ${_formatDate(weekEnd)}";
      case CalendarViewType.monthly:
        return "${_getMonthName(_selectedDate.month)} ${_selectedDate.year}";
    }
  }

  Map<String, DateTime> _getDateRange() {
    switch (_viewType) {
      case CalendarViewType.daily:
        return {
          'start': DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day),
          'end': DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day, 23, 59, 59),
        };
      case CalendarViewType.weekly:
        final weekStart = _getWeekStart(_selectedDate);
        final weekEnd = weekStart.add(const Duration(days: 7));
        return {
          'start': weekStart,
          'end': weekEnd,
        };
      case CalendarViewType.monthly:
        return {
          'start': DateTime(_selectedDate.year, _selectedDate.month, 1),
          'end': DateTime(_selectedDate.year, _selectedDate.month + 1, 0, 23, 59, 59),
        };
    }
  }

  void _previousPeriod() {
    setState(() {
      switch (_viewType) {
        case CalendarViewType.daily:
          _selectedDate = _selectedDate.subtract(const Duration(days: 1));
          break;
        case CalendarViewType.weekly:
          _selectedDate = _selectedDate.subtract(const Duration(days: 7));
          break;
        case CalendarViewType.monthly:
          _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
          break;
      }
    });
  }

  void _nextPeriod() {
    setState(() {
      switch (_viewType) {
        case CalendarViewType.daily:
          _selectedDate = _selectedDate.add(const Duration(days: 1));
          break;
        case CalendarViewType.weekly:
          _selectedDate = _selectedDate.add(const Duration(days: 7));
          break;
        case CalendarViewType.monthly:
          _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
          break;
      }
    });
  }

  DateTime _getWeekStart(DateTime date) {
    // Get the Monday of the week
    return date.subtract(Duration(days: date.weekday - 1));
  }

  List<PrayerCollectionEvent> _filterEventsForDate(
    List<PrayerCollectionEvent> events,
    DateTime date,
  ) {
    return events.where((event) {
      try {
        final eventStart = DateTime.parse(event.eventStart);
        final eventEnd = event.eventEnd != null && event.eventEnd!.isNotEmpty
            ? DateTime.parse(event.eventEnd!)
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

  String _formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }

  String _formatDayHeader(DateTime date) {
    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return "${weekdays[date.weekday - 1]}, ${_formatDate(date)}";
  }

  String _formatEventDateRange(PrayerCollectionEvent event) {
    try {
      final startDate = DateTime.parse(event.eventStart);
      final startFormatted = "${startDate.month}/${startDate.day}/${startDate.year}";
      
      if (event.eventEnd != null && event.eventEnd!.isNotEmpty) {
        final endDate = DateTime.parse(event.eventEnd!);
        final endFormatted = "${endDate.month}/${endDate.day}/${endDate.year}";
        
        if (startFormatted == endFormatted) {
          return startFormatted;
        }
        return "$startFormatted - $endFormatted";
      }
      
      return startFormatted;
    } catch (e) {
      return event.eventStart;
    }
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
}
