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
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/export_action_bar.dart';
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
class PaperMode extends ConsumerStatefulWidget {
  const PaperMode({
    super.key,
    required this.config,
  });

  final PaperModeConfig config;

  @override
  ConsumerState<PaperMode> createState() => _PaperModeState();
}

class _PaperModeState extends ConsumerState<PaperMode> {
  List<PrayerRequest> _loadedRequests = [];
  bool _backgroundFeatureChecked = false;

  void _onRequestsLoaded(List<PrayerRequest> requests) {
    // Defer setState to after the current build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _loadedRequests = requests;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // If we have groupContacts directly, use them
    GroupWithMembers? effectiveGroupContacts = widget.config.groupContacts;

    // If readOnly or we have groupContacts, proceed
    if (effectiveGroupContacts != null || widget.config.readOnly) {
      return _buildWithGroupContacts(effectiveGroupContacts);
    }

    // If no groupContacts but have groupId, fetch from repo
    if (effectiveGroupContacts == null && widget.config.groupId != null) {
      final groupContactsAsync = ref.watch(groupContactsRepoProvider);
      
      return switch (groupContactsAsync) {
        AsyncData(:final value) => _buildGroupIfGroupExists(value),
        AsyncError(:final error, :final stackTrace) => PrintError(
            caller: "PaperMode",
            error: error,
            stackTrace: stackTrace),
        _ => const Center(child: CircularProgressIndicator()),
      };
    }

    // Configuration error
    return const Center(
      child: Text('Configuration error: groupContacts or groupId is required.'),
    );
  }

  Widget _buildGroupIfGroupExists(List<GroupWithMembers> groups) {
    final matchingGroup = groups.where((group) => group.group.id == widget.config.groupId).firstOrNull;
    if (matchingGroup != null) {
      return _buildWithGroupContacts(matchingGroup);
    } else {
      return const Center(
        child: Text('Group not found'),
      );
    }
  } 

  Widget _buildWithGroupContacts(GroupWithMembers? groupContacts) {
    final effectiveConfig = widget.config.copyWith(groupContacts: groupContacts);

    // Start background feature checking if enabled
    if (effectiveConfig.enableBackgroundFeatureCheck && effectiveConfig.groupContacts != null && !_backgroundFeatureChecked) {
      ref.read(paperModeStateProvider).startBackgroundFeatureCheck(
        fetchUpdatedPrayerRequest,
      );
      _backgroundFeatureChecked = true;
    }

    final padding = effectiveConfig.noPadding ? EdgeInsets.zero : const EdgeInsets.fromLTRB(8, 0, 8, 0);
    return Column(
      children: [
        if (effectiveConfig.showHeader) OptionsHeader(config: effectiveConfig),
        Expanded(
          child: Padding(
            padding: padding,
            child: Paper(
              config: effectiveConfig,
              onRequestsLoaded: _onRequestsLoaded,
            ),
          ),
        ),
        ExportActionBar(allRequests: _loadedRequests),
      ],
    );
  }
}
