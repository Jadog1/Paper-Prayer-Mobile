/// Calendar Library - A modular event calendar interface
/// 
/// This library provides calendar widgets for viewing and managing
/// prayer collection events in daily, weekly, or monthly formats.
/// 
/// ## Usage
/// 
/// ```dart
/// import 'package:prayer_ml/prayers/home/calendar/calendar.dart';
/// 
/// // Basic calendar
/// CalendarWidget(
///   config: CalendarConfig.all(),
/// )
/// 
/// // Filtered by contact
/// CalendarWidget(
///   config: CalendarConfig.forContact(contactId: 123),
/// )
/// 
/// // Event details
/// EventDetailsWidget(
///   event: myEvent,
///   config: EventDetailsConfig.full(),
/// )
/// ```

library calendar;

// Export models
export 'models/calendar_config.dart';
export 'models/event_details_config.dart';

// Export main widgets
export 'components/calendar_widget.dart';
export 'components/event_details_widget.dart';
