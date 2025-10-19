import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/home/calendar/calendar.dart';

/// Legacy CalendarView - now a wrapper around CalendarWidget
/// 
/// This is maintained for backward compatibility.
/// New code should use CalendarWidget directly.
class CalendarView extends StatelessWidget {
  const CalendarView({
    super.key,
    this.contactId,
    this.collectionId,
  });

  final int? contactId;
  final int? collectionId;

  @override
  Widget build(BuildContext context) {
    CalendarConfig config;
    
    if (contactId != null) {
      config = CalendarConfig.forContact(contactId: contactId!);
    } else if (collectionId != null) {
      config = CalendarConfig.forCollection(collectionId: collectionId!);
    } else {
      config = CalendarConfig.all();
    }

    return CalendarWidget(config: config);
  }
}

