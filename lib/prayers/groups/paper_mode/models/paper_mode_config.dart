import 'package:prayer_ml/prayers/groups/models/group_model.dart';

/// Configuration for PaperMode widget behavior and display options.
/// 
/// This class provides a flexible way to configure the PaperMode widget
/// without tight coupling to specific dependencies.
class PaperModeConfig {
  const PaperModeConfig({
    this.readOnly = false,
    this.showHeader = true,
    this.contactId,
    this.eventId,
    this.groupContacts,
    this.groupId,
    this.enableBackgroundFeatureCheck = true,
    this.aiModeDefault = true,
    this.pageSize = 10,
  }) : assert(
          groupContacts != null || groupId != null || readOnly,
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
  final GroupContacts? groupContacts;

  /// Alternative to groupContacts - just the group ID
  final int? groupId;

  /// Whether to enable background feature checking for prayer requests
  final bool enableBackgroundFeatureCheck;

  /// Default AI mode state
  final bool aiModeDefault;

  /// Number of items to load per page
  final int pageSize;

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
    GroupContacts? groupContacts,
    int? groupId,
    bool? enableBackgroundFeatureCheck,
    bool? aiModeDefault,
    int? pageSize,
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
    );
  }

  /// Create a read-only configuration
  factory PaperModeConfig.readOnly({
    int? contactId,
    int? eventId,
    bool showHeader = false,
    GroupContacts? groupContacts,
  }) {
    return PaperModeConfig(
      readOnly: true,
      showHeader: showHeader,
      contactId: contactId,
      eventId: eventId,
      groupContacts: groupContacts,
    );
  }

  /// Create an editable configuration with full group context
  factory PaperModeConfig.editable({
    required GroupContacts groupContacts,
    bool showHeader = true,
    int? contactId,
    int? eventId,
  }) {
    return PaperModeConfig(
      readOnly: false,
      showHeader: showHeader,
      groupContacts: groupContacts,
      contactId: contactId,
      eventId: eventId,
    );
  }
}
