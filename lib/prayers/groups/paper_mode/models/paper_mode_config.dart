import 'package:prayer_ml/prayers/groups/models/group_model.dart';

/// Configuration for PaperMode widget behavior and display options.
/// 
/// This class provides a flexible way to configure the PaperMode widget
/// without tight coupling to specific dependencies.
class PaperModeConfig {
  const PaperModeConfig({
    this.readOnly = false,
    this.showHeader = true,
    this.skipKeyboardFocusOnLoad = false,
    this.contactId,
    this.eventId,
    this.groupContacts,
    this.groupId,
    this.enableBackgroundFeatureCheck = true,
    this.aiModeDefault = true,
    this.noPadding = false,
    this.pageSize = 10,
    this.collectionId,
    this.relatedContactId,
    this.maxHeight,
    this.shrinkWrap = false,
    this.disablePullToRefresh = false,
  }) : assert(
          (groupContacts == null && groupId == null) == false || readOnly,
          'Either groupContacts or groupId must be provided when not in readOnly mode',
        );

  /// Whether the paper mode is in read-only mode (no editing allowed)
  final bool readOnly;

  /// Whether to show the header with navigation and AI mode toggle
  final bool showHeader;

  /// Optional contact ID to filter prayer requests
  final int? contactId;

  /// Optional event ID to filter prayer requests
  final int? eventId;

  /// The group and its contacts (optional, can be null in read-only mode)
  final GroupWithMembers? groupContacts;

  /// Alternative to groupContacts - just the group ID
  final int? groupId;

  /// Whether to enable background feature checking for prayer requests
  final bool enableBackgroundFeatureCheck;

  /// Default AI mode state
  final bool aiModeDefault;

  /// Number of items to load per page
  final int pageSize;

  /// Optional collection ID to filter prayer requests
  final int? collectionId;

  /// Optional related contact ID to filter prayer requests
  final int? relatedContactId;

  /// Whether to skip focusing the keyboard on load (for embedded use cases)
  final bool skipKeyboardFocusOnLoad;

  /// Whether to remove padding around the paper content
  final bool noPadding;

  /// Maximum height for the paper content (enables dynamic sizing)
  final double? maxHeight;

  /// Whether to shrink wrap content instead of filling available space
  final bool shrinkWrap;

  /// Whether to disable pull-to-refresh gesture
  final bool disablePullToRefresh;

  /// Get the effective group ID from either groupContacts or groupId
  int? get effectiveGroupId => groupContacts?.group.id ?? groupId;

  /// Check if we have enough context to display the paper
  bool get hasRequiredContext => 
      readOnly || groupContacts != null || groupId != null;

  /// Create a copy with modified fields
  PaperModeConfig copyWith({
    bool? readOnly,
    bool? showHeader,
    int? contactId,
    int? eventId,
    GroupWithMembers? groupContacts,
    int? groupId,
    bool? enableBackgroundFeatureCheck,
    bool? aiModeDefault,
    bool? noPadding,
    int? pageSize,
    int? collectionId,
    int? relatedContactId,
    double? maxHeight,
    bool? shrinkWrap,
    bool? disablePullToRefresh,
  }) {
    return PaperModeConfig(
      readOnly: readOnly ?? this.readOnly,
      showHeader: showHeader ?? this.showHeader,
      contactId: contactId ?? this.contactId,
      eventId: eventId ?? this.eventId,
      groupContacts: groupContacts ?? this.groupContacts,
      groupId: groupId ?? this.groupId,
      enableBackgroundFeatureCheck:
          enableBackgroundFeatureCheck ?? this.enableBackgroundFeatureCheck,
      aiModeDefault: aiModeDefault ?? this.aiModeDefault,
      pageSize: pageSize ?? this.pageSize,
      collectionId: collectionId ?? this.collectionId,
      relatedContactId: relatedContactId ?? this.relatedContactId,
      maxHeight: maxHeight ?? this.maxHeight,
      shrinkWrap: shrinkWrap ?? this.shrinkWrap,
      disablePullToRefresh: disablePullToRefresh ?? this.disablePullToRefresh,
      skipKeyboardFocusOnLoad: skipKeyboardFocusOnLoad,
      noPadding: noPadding ?? this.noPadding,
    );
  }

  /// Create a read-only configuration
  factory PaperModeConfig.readOnly({
    int? contactId,
    int? eventId,
    bool showHeader = false,
    GroupWithMembers? groupContacts,
    int? collectionId,
    int? relatedContactId,
    bool noPadding = false,
    double? maxHeight,
    bool shrinkWrap = false,
    bool disablePullToRefresh = false,
  }) {
    return PaperModeConfig(
      readOnly: true,
      showHeader: showHeader,
      contactId: contactId,
      eventId: eventId,
      groupContacts: groupContacts,
      collectionId: collectionId,
      relatedContactId: relatedContactId,
      noPadding: noPadding,
      maxHeight: maxHeight,
      shrinkWrap: shrinkWrap,
      disablePullToRefresh: disablePullToRefresh,
    );
  }

  /// Create an editable configuration with full group context
  factory PaperModeConfig.editable({
    GroupWithMembers? groupContacts,
    int? groupId,
    bool showHeader = true,
    int? contactId,
    int? eventId,
    int? collectionId,
    int? relatedContactId,
    bool skipKeyboardFocusOnLoad = false,
    bool noPadding = false,
    double? maxHeight,
    bool shrinkWrap = false,
    bool disablePullToRefresh = false,
  }) {
    return PaperModeConfig(
      readOnly: false,
      showHeader: showHeader,
      groupContacts: groupContacts,
      contactId: contactId,
      eventId: eventId,
      collectionId: collectionId,
      relatedContactId: relatedContactId,
      groupId: groupId,
      skipKeyboardFocusOnLoad: skipKeyboardFocusOnLoad,
      noPadding: noPadding,
      maxHeight: maxHeight,
      shrinkWrap: shrinkWrap,
      disablePullToRefresh: disablePullToRefresh,
    );
  }
}
