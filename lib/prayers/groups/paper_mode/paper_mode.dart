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
import 'package:prayer_ml/prayers/groups/paper_mode/components/options_header.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/paper.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/models/paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/paper_mode_provider.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';

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
    // Start background feature checking if enabled and we have a group context
    if (config.enableBackgroundFeatureCheck && config.effectiveGroupId != null) {
      ref.read(paperModeStateProvider).startBackgroundFeatureCheck(
            fetchUpdatedPrayerRequest,
          );
    }

    // For read-only mode without group context, we need to handle it differently
    // if (config.readOnly && config.groupContacts == null) {
    //   // In this case, we can still display the paper but without editing features
    //   // This is a simplified view
    //   return Column(
    //     children: [
    //       if (config.showHeader) OptionsHeader(config: config),
    //       const Expanded(
    //         child: Center(
    //           child: Text(
    //             'Read-only mode requires group context.\nPlease provide groupContacts or groupId in config.',
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // }

    // Normal mode with group context
    if (config.groupContacts == null && !config.readOnly) {
      return const Center(
        child: Text('Configuration error: groupContacts is required.'),
      );
    }

    return Column(
      children: [
        if (config.showHeader) OptionsHeader(config: config),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Paper(config: config),
          ),
        ),
      ],
    );
  }
}
