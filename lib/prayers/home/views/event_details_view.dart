import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/home/calendar/calendar.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';

/// Legacy EventDetailsView - now a wrapper around EventDetailsWidget
/// 
/// This is maintained for backward compatibility.
/// New code should use EventDetailsWidget directly.
class EventDetailsView extends StatelessWidget {
  const EventDetailsView({
    super.key,
    required this.event,
  });

  final PrayerCollectionEvent event;

  @override
  Widget build(BuildContext context) {
    return EventDetailsWidget(
      event: event,
      config: EventDetailsConfig.full(),
    );
  }
}

