import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';
import 'package:prayer_ml/prayers/home/repos/events_repo.dart';
import 'package:prayer_ml/prayers/home/views/calendar_view.dart';
import 'package:prayer_ml/prayers/home/views/event_details_view.dart';
import 'package:prayer_ml/shared/widgets.dart';

/// Widget showing a preview of upcoming events
class UpcomingEventsPreview extends ConsumerStatefulWidget {
  const UpcomingEventsPreview({super.key});

  @override
  ConsumerState<UpcomingEventsPreview> createState() =>
      _UpcomingEventsPreviewState();
}

class _UpcomingEventsPreviewState extends ConsumerState<UpcomingEventsPreview> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollIndicator = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    // Show indicator if we can scroll down
    if (_scrollController.hasClients) {
      final canScrollDown = _scrollController.position.pixels <
          _scrollController.position.maxScrollExtent - 10;
      if (canScrollDown != _showScrollIndicator) {
        setState(() {
          _showScrollIndicator = canScrollDown;
        });
      }
    }
  }

  void _checkIfScrollable() {
    // Check after the frame is rendered if content is scrollable
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        final canScroll = _scrollController.position.maxScrollExtent > 0;
        if (canScroll != _showScrollIndicator) {
          setState(() {
            _showScrollIndicator = canScroll;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final futureEventsAsync =
        ref.watch(fetchFutureEventsProvider(limit: 5, maxDays: 30));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.event, color: Colors.orange[700], size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    "Upcoming Events",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              // View All button
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CalendarView(),
                    ),
                  );
                },
                icon: const Icon(Icons.calendar_month, size: 16),
                label: const Text("Calendar"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.orange[700],
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                ),
              ),
            ],
          ),
        ),

        // Scrollable Events list with indicator
        Expanded(
          child: Stack(
            children: [
              // Events list
              futureEventsAsync.when(
                data: (events) {
                  _checkIfScrollable();

                  if (events.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 16.0),
                      child: Center(
                        child: Text(
                          "No upcoming events in the next 30 days",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.only(bottom: 48),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return _UpcomingEventCard(
                        event: events[index],
                      );
                    },
                  );
                },
                loading: () => const _EventsLoadingSkeleton(),
                error: (error, stackTrace) => PrintError(
                  caller: "UpcomingEventsPreview",
                  error: error,
                  stackTrace: stackTrace,
                  onRetry: () => ref.invalidate(
                      fetchFutureEventsProvider(limit: 5, maxDays: 30)),
                  compact: true,
                ),
              ),

              // Scroll indicator at bottom
              if (_showScrollIndicator)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: 0.0),
                          Colors.white.withValues(alpha: 0.95),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.orange[700],
                        size: 24,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(height: 8),
      ],
    );
  }
}

class _UpcomingEventCard extends StatelessWidget {
  const _UpcomingEventCard({
    required this.event,
  });

  final PrayerCollectionEvent event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          children: [
            // Event icon with date indicator
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _getDay(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[700],
                    ),
                  ),
                  Text(
                    _getMonth(),
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.orange[600],
                    ),
                  ),
                ],
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
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  else
                    Text(
                      "Event",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                  const SizedBox(height: 2),
                  Text(
                    _formatEventDate(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            // Chevron
            Icon(Icons.chevron_right, size: 20, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  String _getDay() {
    try {
      final date = DateTime.parse(event.eventStart);
      return date.day.toString();
    } catch (e) {
      return "?";
    }
  }

  String _getMonth() {
    try {
      final date = DateTime.parse(event.eventStart);
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec'
      ];
      return months[date.month - 1];
    } catch (e) {
      return "";
    }
  }

  String _formatEventDate() {
    try {
      final startDate = DateTime.parse(event.eventStart);
      final now = DateTime.now();
      final difference = startDate.difference(now).inDays;

      String dateStr;
      if (difference == 0) {
        dateStr = "Today";
      } else if (difference == 1) {
        dateStr = "Tomorrow";
      } else if (difference < 7) {
        dateStr = "In $difference days";
      } else {
        dateStr = "${startDate.month}/${startDate.day}/${startDate.year}";
      }

      if (event.eventEnd != null && event.eventEnd!.isNotEmpty) {
        final endDate = DateTime.parse(event.eventEnd!);
        final duration = endDate.difference(startDate).inDays;
        if (duration > 0) {
          dateStr += " ($duration days)";
        }
      }

      return dateStr;
    } catch (e) {
      return event.eventStart;
    }
  }
}

class _EventsLoadingSkeleton extends StatelessWidget {
  const _EventsLoadingSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 48),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                      width: double.infinity * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 12,
                      width: double.infinity * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
