import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/calendar/components/daily_view.dart';
import 'package:prayer_ml/prayers/home/calendar/components/event_details_widget.dart';
import 'package:prayer_ml/prayers/home/calendar/components/monthly_view.dart';
import 'package:prayer_ml/prayers/home/calendar/components/weekly_view.dart';
import 'package:prayer_ml/prayers/home/calendar/models/calendar_config.dart';
import 'package:prayer_ml/prayers/home/calendar/models/event_details_config.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';
import 'package:prayer_ml/prayers/home/repos/events_repo.dart';
import 'package:prayer_ml/shared/widgets.dart';

/// Main calendar widget for viewing events
class CalendarWidget extends ConsumerStatefulWidget {
  const CalendarWidget({
    super.key,
    required this.config,
  });

  final CalendarConfig config;

  @override
  ConsumerState<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends ConsumerState<CalendarWidget> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.config.initialDate;
  }

  CalendarViewType get _viewType => widget.config.initialViewType;

  @override
  Widget build(BuildContext context) {
    final content = Column(
      children: [
        // Date navigation header
        if (widget.config.showNavigationHeader) _buildDateNavigationHeader(),

        // Calendar content based on view type
        Expanded(
          child: _buildCalendarContent(),
        ),
      ],
    );

    if (!widget.config.showAppBar) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.config.title ?? "Events Calendar"),
        backgroundColor: widget.config.appBarColor,
        actions: [
          // View type selector
          if (widget.config.allowViewTypeChange)
            PopupMenuButton<CalendarViewType>(
              icon: const Icon(Icons.view_module),
              onSelected: (CalendarViewType type) {
                _navigateToViewType(type);
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
      body: content,
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
        limit: widget.config.eventLimit,
        contactId: widget.config.contactId,
        collectionId: widget.config.collectionId,
      ),
    );

    return eventsAsync.when(
      data: (paginatedEvents) {
        switch (_viewType) {
          case CalendarViewType.daily:
            return DailyView(
              events: paginatedEvents.events,
              selectedDate: _selectedDate,
              onEventTap: _handleEventTap,
            );
          case CalendarViewType.weekly:
            return WeeklyView(
              events: paginatedEvents.events,
              selectedDate: _selectedDate,
              onEventTap: _handleEventTap,
            );
          case CalendarViewType.monthly:
            return MonthlyView(
              events: paginatedEvents.events,
              selectedDate: _selectedDate,
              onDateTap: (date) {
                _navigateToViewType(CalendarViewType.daily, newDate: date);
              },
            );
        }
      },
      loading: () => const CreativeLoadingScreen(
        icon: Icons.calendar_month,
        iconColor: Colors.blueAccent,
        primaryText: 'Loading calendar events...',
        secondaryText: 'Gathering your upcoming moments',
      ),
      error: (error, stackTrace) => PrintError(
        caller: "CalendarWidget",
        error: error,
        stackTrace: stackTrace,
      ),
    );
  }

  void _handleEventTap(EventWithCollection event) {
    if (widget.config.onEventTap != null) {
      widget.config.onEventTap!(context, event);
    } else {
      // Default navigation to event details
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EventDetailsWidget(
            event: event.event,
            config: EventDetailsConfig.full(),
          ),
        ),
      );
    }
  }

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
    const buffer = Duration(days: 30);
    switch (_viewType) {
      case CalendarViewType.daily:
        final start =
            DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day)
                .subtract(buffer);
        final end = DateTime(_selectedDate.year, _selectedDate.month,
                _selectedDate.day, 23, 59, 59)
            .add(buffer);
        return {
          'start': start,
          'end': end,
        };
      case CalendarViewType.weekly:
        final weekStart = _getWeekStart(_selectedDate).subtract(buffer);
        final weekEnd = weekStart.add(const Duration(days: 7)).add(buffer);
        return {
          'start': weekStart,
          'end': weekEnd,
        };
      case CalendarViewType.monthly:
        final start = DateTime(_selectedDate.year, _selectedDate.month, 1)
            .subtract(buffer);
        final end =
            DateTime(_selectedDate.year, _selectedDate.month + 1, 0, 23, 59, 59)
                .add(buffer);
        return {
          'start': start,
          'end': end,
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
          _selectedDate =
              DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
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
          _selectedDate =
              DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
          break;
      }
    });
  }

  DateTime _getWeekStart(DateTime date) {
    // Get the Monday of the week
    return date.subtract(Duration(days: date.weekday - 1));
  }

  String _formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  /// Navigate to a different calendar view type using proper navigation
  void _navigateToViewType(CalendarViewType type, {DateTime? newDate}) {
    // Don't navigate if already on the same view type
    if (type == _viewType && newDate == null) {
      return;
    }

    // Create new config for the target view
    final newConfig = widget.config.copyWith(
      initialViewType: type,
      initialDate: newDate ?? _selectedDate,
    );

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CalendarWidget(config: newConfig),
      ),
    );
  }
}
