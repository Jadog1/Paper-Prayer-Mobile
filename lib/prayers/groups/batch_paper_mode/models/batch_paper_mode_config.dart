import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';

/// Configuration for BatchPaperMode widget behavior and display options.
class BatchPaperModeConfig {
  const BatchPaperModeConfig({
    this.groupContacts,
    this.returnWidget,
    this.prefillContent,
    this.autoParseOnLoad = false,
  });

  /// The group and its contacts (optional, if not provided, user must select)
  final GroupWithMembers? groupContacts;

  /// Widget to return to after exiting batch paper mode
  /// If null, will use Navigator.pop()
  final Widget? returnWidget;

  /// Content to prefill the batch paper mode with
  /// If provided, will default to view mode with content already parsed
  final String? prefillContent;

  /// Whether to automatically parse content on load (used when prefillContent is provided)
  final bool autoParseOnLoad;

  /// Check if group selection step should be skipped
  bool get skipGroupSelection => groupContacts != null;

  /// Create a copy with modified fields
  BatchPaperModeConfig copyWith({
    GroupWithMembers? groupContacts,
    Widget? returnWidget,
    String? prefillContent,
    bool? autoParseOnLoad,
  }) {
    return BatchPaperModeConfig(
      groupContacts: groupContacts ?? this.groupContacts,
      returnWidget: returnWidget ?? this.returnWidget,
      prefillContent: prefillContent ?? this.prefillContent,
      autoParseOnLoad: autoParseOnLoad ?? this.autoParseOnLoad,
    );
  }

  /// Create a configuration with group already selected
  factory BatchPaperModeConfig.withGroup({
    required GroupWithMembers groupContacts,
    Widget? returnWidget,
    String? prefillContent,
  }) {
    return BatchPaperModeConfig(
      groupContacts: groupContacts,
      returnWidget: returnWidget,
      prefillContent: prefillContent,
      autoParseOnLoad: prefillContent != null,
    );
  }

  /// Create a configuration that requires group selection
  factory BatchPaperModeConfig.requiresGroupSelection({
    Widget? returnWidget,
    String? prefillContent,
  }) {
    return BatchPaperModeConfig(
      returnWidget: returnWidget,
      prefillContent: prefillContent,
      autoParseOnLoad: prefillContent != null,
    );
  }
}
