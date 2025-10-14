/// Paper Mode - A modular prayer request viewing and editing interface
/// 
/// This library provides a paper-like interface for viewing and editing
/// prayer requests with AI-powered summaries and recommendations.
/// 
/// ## Usage
/// 
/// ```dart
/// import 'package:prayer_ml/prayers/groups/paper_mode/paper_mode.dart';
/// 
/// // Read-only mode
/// PaperMode(
///   config: PaperModeConfig.readOnly(contactId: 123),
/// )
/// 
/// // Editable mode
/// PaperMode(
///   config: PaperModeConfig.editable(
///     groupContacts: groupContacts,
///   ),
/// )
/// ```

library paper_mode;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/options_header.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/paper.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/models/paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/paper_mode_provider.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';
import 'package:prayer_ml/shared/widgets.dart';

// Export models
export 'models/paper_mode_config.dart';
export 'models/paper_mode_state.dart';

// Export providers
export 'providers/paper_mode_provider.dart';

/// Main PaperMode widget
/// 
/// Displays a paper-like interface for prayer requests with support for
/// both read-only viewing and interactive editing.
class PaperMode extends ConsumerWidget {
  const PaperMode({
    super.key,
    required this.config,
  });

  final PaperModeConfig config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // If we have groupContacts directly, use them
    GroupWithMembers? effectiveGroupContacts = config.groupContacts;

    // If no groupContacts but have groupId, fetch from repo
    if (effectiveGroupContacts == null && config.groupId != null) {
      final groupContactsAsync = ref.watch(groupContactsRepoProvider);
      
      return switch (groupContactsAsync) {
        AsyncData(:final value) => _buildGroupIfGroupExists(ref, value),
        AsyncError(:final error, :final stackTrace) => PrintError(
            caller: "PaperMode",
            error: error,
            stackTrace: stackTrace),
        _ => const Center(child: CircularProgressIndicator()),
      };
    }

    // If readOnly or we have groupContacts, proceed
    if (effectiveGroupContacts != null || config.readOnly) {
      return _buildWithGroupContacts(ref, effectiveGroupContacts);
    }

    // Configuration error
    return const Center(
      child: Text('Configuration error: groupContacts or groupId is required.'),
    );
  }

  Widget _buildGroupIfGroupExists(WidgetRef ref, List<GroupWithMembers> groups) {
    final matchingGroup = groups.where((group) => group.group.id == config.groupId).firstOrNull;
    if (matchingGroup != null) {
      return _buildWithGroupContacts(ref, matchingGroup);
    } else {
      return const Center(
        child: Text('Group not found'),
      );
    }
  } 

  Widget _buildWithGroupContacts(WidgetRef ref, GroupWithMembers? groupContacts) {
    final effectiveConfig = config.copyWith(groupContacts: groupContacts);

    // Start background feature checking if enabled and we have a group context
    if (effectiveConfig.enableBackgroundFeatureCheck && effectiveConfig.effectiveGroupId != null) {
      ref.read(paperModeStateProvider).startBackgroundFeatureCheck(
        fetchUpdatedPrayerRequest,
      );
    }

    final padding = effectiveConfig.noPadding ? EdgeInsets.zero : const EdgeInsets.fromLTRB(8, 0, 8, 0);
    return Column(
      children: [
        if (effectiveConfig.showHeader) OptionsHeader(config: effectiveConfig),
        Expanded(
          child: Padding(
            padding: padding,
            child: Paper(config: effectiveConfig),
          ),
        ),
      ],
    );
  }
}
