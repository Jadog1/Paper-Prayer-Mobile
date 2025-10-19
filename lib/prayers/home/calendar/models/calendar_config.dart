import 'package:flutter/material.dart';

/// View type for the calendar
enum CalendarViewType { daily, weekly, monthly }

/// Configuration for the Calendar widget
/// 
/// This class defines all configuration options for displaying a calendar
/// of prayer collection events. It supports filtering by contact or collection
/// and customizing the display and behavior.
class CalendarConfig {
  /// Whether to show the app bar (title, view type selector)
  final bool showAppBar;

  /// Whether to show the date navigation header
  final bool showNavigationHeader;

  /// Initial view type to display
  final CalendarViewType initialViewType;

  /// Initial selected date (defaults to today)
  final DateTime initialDate;

  /// Filter events by specific contact ID
  final int? contactId;

  /// Filter events by specific collection ID
  final int? collectionId;

  /// Custom title for the app bar (if showAppBar is true)
  final String? title;

  /// Custom app bar background color
  final Color appBarColor;

  /// Maximum number of events to fetch
  final int eventLimit;

  /// Callback when an event is tapped (overrides default navigation)
  final void Function(BuildContext context, dynamic event)? onEventTap;

  /// Whether to allow changing view types
  final bool allowViewTypeChange;

  CalendarConfig({
    this.showAppBar = true,
    this.showNavigationHeader = true,
    this.initialViewType = CalendarViewType.monthly,
    DateTime? initialDate,
    this.contactId,
    this.collectionId,
    this.title,
    this.appBarColor = Colors.blueAccent,
    this.eventLimit = 100,
    this.onEventTap,
    this.allowViewTypeChange = true,
  }) : initialDate = initialDate ?? DateTime.now();

  /// Create a config for viewing all events
  factory CalendarConfig.all({
    CalendarViewType initialViewType = CalendarViewType.monthly,
    DateTime? initialDate,
    bool showAppBar = true,
    void Function(BuildContext context, dynamic event)? onEventTap,
  }) {
    return CalendarConfig(
      showAppBar: showAppBar,
      initialViewType: initialViewType,
      initialDate: initialDate,
      onEventTap: onEventTap,
    );
  }

  /// Create a config for viewing events filtered by contact
  factory CalendarConfig.forContact({
    required int contactId,
    CalendarViewType initialViewType = CalendarViewType.monthly,
    DateTime? initialDate,
    bool showAppBar = true,
    String? contactName,
    void Function(BuildContext context, dynamic event)? onEventTap,
  }) {
    return CalendarConfig(
      showAppBar: showAppBar,
      initialViewType: initialViewType,
      initialDate: initialDate,
      contactId: contactId,
      title: contactName != null ? "$contactName's Events" : "Contact Events",
      onEventTap: onEventTap,
    );
  }

  /// Create a config for viewing events filtered by collection
  factory CalendarConfig.forCollection({
    required int collectionId,
    CalendarViewType initialViewType = CalendarViewType.monthly,
    DateTime? initialDate,
    bool showAppBar = true,
    String? collectionName,
    void Function(BuildContext context, dynamic event)? onEventTap,
  }) {
    return CalendarConfig(
      showAppBar: showAppBar,
      initialViewType: initialViewType,
      initialDate: initialDate,
      collectionId: collectionId,
      title: collectionName != null ? "$collectionName Events" : "Collection Events",
      onEventTap: onEventTap,
    );
  }

  /// Create a minimal config for embedding in another view
  factory CalendarConfig.embedded({
    int? contactId,
    int? collectionId,
    CalendarViewType initialViewType = CalendarViewType.monthly,
    DateTime? initialDate,
  }) {
    return CalendarConfig(
      showAppBar: false,
      showNavigationHeader: true,
      initialViewType: initialViewType,
      initialDate: initialDate,
      contactId: contactId,
      collectionId: collectionId,
      allowViewTypeChange: false,
    );
  }

  CalendarConfig copyWith({
    bool? showAppBar,
    bool? showNavigationHeader,
    CalendarViewType? initialViewType,
    DateTime? initialDate,
    int? contactId,
    int? collectionId,
    String? title,
    Color? appBarColor,
    int? eventLimit,
    void Function(BuildContext context, dynamic event)? onEventTap,
    bool? allowViewTypeChange,
  }) {
    return CalendarConfig(
      showAppBar: showAppBar ?? this.showAppBar,
      showNavigationHeader: showNavigationHeader ?? this.showNavigationHeader,
      initialViewType: initialViewType ?? this.initialViewType,
      initialDate: initialDate ?? this.initialDate,
      contactId: contactId ?? this.contactId,
      collectionId: collectionId ?? this.collectionId,
      title: title ?? this.title,
      appBarColor: appBarColor ?? this.appBarColor,
      eventLimit: eventLimit ?? this.eventLimit,
      onEventTap: onEventTap ?? this.onEventTap,
      allowViewTypeChange: allowViewTypeChange ?? this.allowViewTypeChange,
    );
  }
}
