import 'package:flutter/material.dart';

/// Configuration for the Event Details widget
/// 
/// This class defines all configuration options for displaying the details
/// of a specific event along with its associated prayer requests.
class EventDetailsConfig {
  /// Whether to show the app bar
  final bool showAppBar;

  /// Whether to show the delete button
  final bool showDeleteButton;

  /// Whether to show the collection navigation link
  final bool showCollectionLink;

  /// Whether to show the event-only/collection toggle
  final bool showFilterToggle;

  /// Default filter state (true = event only, false = full collection)
  final bool defaultShowEventOnly;

  /// Custom title for the app bar (if showAppBar is true)
  final String? title;

  /// Custom app bar background color
  final Color appBarColor;

  /// Callback when event is deleted
  final void Function()? onEventDeleted;

  /// Callback when collection link is tapped (overrides default navigation)
  final void Function(BuildContext context, dynamic collection)? onCollectionTap;

  const EventDetailsConfig({
    this.showAppBar = true,
    this.showDeleteButton = true,
    this.showCollectionLink = true,
    this.showFilterToggle = true,
    this.defaultShowEventOnly = true,
    this.title,
    this.appBarColor = Colors.blueAccent,
    this.onEventDeleted,
    this.onCollectionTap,
  });

  /// Create a full-featured config (default)
  factory EventDetailsConfig.full({
    String? title,
    void Function()? onEventDeleted,
  }) {
    return EventDetailsConfig(
      title: title,
      onEventDeleted: onEventDeleted,
    );
  }

  /// Create a read-only config (no delete button)
  factory EventDetailsConfig.readOnly({
    String? title,
    bool showCollectionLink = true,
    bool showFilterToggle = true,
  }) {
    return EventDetailsConfig(
      showDeleteButton: false,
      showCollectionLink: showCollectionLink,
      showFilterToggle: showFilterToggle,
      title: title,
    );
  }

  /// Create a minimal config for embedding
  factory EventDetailsConfig.embedded({
    bool showFilterToggle = true,
    bool defaultShowEventOnly = true,
  }) {
    return EventDetailsConfig(
      showAppBar: false,
      showDeleteButton: false,
      showCollectionLink: false,
      showFilterToggle: showFilterToggle,
      defaultShowEventOnly: defaultShowEventOnly,
    );
  }

  /// Create a config showing full collection by default
  factory EventDetailsConfig.collectionView({
    String? title,
    bool showDeleteButton = true,
  }) {
    return EventDetailsConfig(
      defaultShowEventOnly: false,
      title: title,
      showDeleteButton: showDeleteButton,
    );
  }

  EventDetailsConfig copyWith({
    bool? showAppBar,
    bool? showDeleteButton,
    bool? showCollectionLink,
    bool? showFilterToggle,
    bool? defaultShowEventOnly,
    String? title,
    Color? appBarColor,
    void Function()? onEventDeleted,
    void Function(BuildContext context, dynamic collection)? onCollectionTap,
  }) {
    return EventDetailsConfig(
      showAppBar: showAppBar ?? this.showAppBar,
      showDeleteButton: showDeleteButton ?? this.showDeleteButton,
      showCollectionLink: showCollectionLink ?? this.showCollectionLink,
      showFilterToggle: showFilterToggle ?? this.showFilterToggle,
      defaultShowEventOnly: defaultShowEventOnly ?? this.defaultShowEventOnly,
      title: title ?? this.title,
      appBarColor: appBarColor ?? this.appBarColor,
      onEventDeleted: onEventDeleted ?? this.onEventDeleted,
      onCollectionTap: onCollectionTap ?? this.onCollectionTap,
    );
  }
}
