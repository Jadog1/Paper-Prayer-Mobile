/// Batch Paper Mode - A batch insertion interface for prayer requests
/// 
/// This library provides a wizard-based interface for bulk importing
/// prayer requests with automatic contact detection and parsing.
/// 
/// ## Usage
/// 
/// ```dart
/// import 'package:prayer_ml/prayers/groups/batch_paper_mode/batch_paper_mode.dart';
/// 
/// // With group already selected
/// BatchPaperMode(
///   config: BatchPaperModeConfig.withGroup(
///     groupContacts: groupContacts,
///   ),
/// )
/// 
/// // Requires group selection
/// BatchPaperMode(
///   config: BatchPaperModeConfig.requiresGroupSelection(),
/// )
/// 
/// // With prefilled content
/// BatchPaperMode(
///   config: BatchPaperModeConfig.withGroup(
///     groupContacts: groupContacts,
///     prefillContent: "John Doe\nPray for healing\nJane Smith\nPray for wisdom",
///   ),
/// )
/// ```

library batch_paper_mode;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/components/edit_mode_view.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/components/group_selector.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/components/read_mode_view.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/models/batch_paper_mode_state.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/providers/batch_paper_mode_provider.dart';

// Export models
export 'models/batch_paper_mode_config.dart';
export 'models/batch_paper_mode_state.dart';
export 'models/batch_content_item.dart';

// Export providers
export 'providers/batch_paper_mode_provider.dart';

/// Main BatchPaperMode widget
/// 
/// Provides a wizard interface for batch importing prayer requests
class BatchPaperMode extends ConsumerWidget {
  const BatchPaperMode({
    super.key,
    required this.config,
  });

  final BatchPaperModeConfig config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(batchPaperModeNotifierProvider(config));
    final notifier = ref.read(batchPaperModeNotifierProvider(config).notifier);

    return WillPopScope(
      onWillPop: () async {
        return await _handleBackPress(context, state);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Batch Insert Mode'),
          backgroundColor: const Color(0xFF8B7355),
          foregroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              if (await _handleBackPress(context, state)) {
                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              }
            },
          ),
          actions: [
            if (state.currentStep == BatchPaperModeStep.contentEditing && state.isEditMode)
              IconButton(
                icon: const Icon(Icons.paste),
                onPressed: () async {
                  // Get clipboard data
                  final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
                  if (clipboardData != null && clipboardData.text != null) {
                    notifier.handlePaste(clipboardData.text!);
                  }
                },
                tooltip: 'Paste',
              ),
            if (state.currentStep == BatchPaperModeStep.contentEditing)
              IconButton(
                icon: Icon(state.isEditMode ? Icons.visibility : Icons.edit),
                onPressed: () => notifier.toggleMode(),
                tooltip: state.isEditMode ? 'Preview' : 'Edit',
              ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              // Main content
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                  bottom: state.currentStep == BatchPaperModeStep.contentEditing && !state.isEditMode
                      ? 80.0  // Space for bottom buttons in read mode
                      : 16.0, // Normal spacing in edit mode
                ),
                child: Column(
                  children: [
                    // Error banner
                    if (state.errorMessage != null) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.red.shade300),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.error_outline, color: Colors.red.shade700),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                state.errorMessage!,
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              iconSize: 20,
                              onPressed: () => notifier.clearError(),
                              color: Colors.red.shade700,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Main content based on current step
                    Expanded(
                      child: _buildStepContent(state),
                    ),
                  ],
                ),
              ),

              // Bottom action buttons - fixed position (only in read mode)
              if (state.currentStep == BatchPaperModeStep.contentEditing && !state.isEditMode)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, -2),
                        ),
                      ],
                    ),
                    child: _buildActionButtons(context, state, notifier, ref),
                  ),
                ),
            ],
          ),
        ),
      ),
    ); // Closing WillPopScope
  }

  /// Check if there is content that would be lost
  bool _hasContent(BatchPaperModeState state) {
    return state.rawContent.trim().isNotEmpty || state.parsedItems.isNotEmpty;
  }

  /// Handle back press with confirmation if needed
  Future<bool> _handleBackPress(BuildContext context, BatchPaperModeState state) async {
    if (!_hasContent(state)) {
      return true; // Allow exit without confirmation
    }

    // Show confirmation dialog
    final shouldExit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Discard Changes?'),
        content: const Text(
          'You have unsaved content. Are you sure you want to exit and lose your progress?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Stay'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Discard'),
          ),
        ],
      ),
    );

    return shouldExit ?? false;
  }

  Widget _buildStepContent(BatchPaperModeState state) {
    switch (state.currentStep) {
      case BatchPaperModeStep.groupSelection:
        return GroupSelector(config: config);
      case BatchPaperModeStep.contentEditing:
        if (state.isEditMode) {
          return EditModeView(config: config);
        } else {
          return ReadModeView(config: config);
        }
    }
  }

  Widget _buildActionButtons(
    BuildContext context,
    BatchPaperModeState state,
    BatchPaperModeNotifier notifier,
    WidgetRef ref,
  ) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () async {
              if (await _handleBackPress(context, state)) {
                if (context.mounted) {
                  if (config.returnWidget != null) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => config.returnWidget!,
                      ),
                    );
                  } else {
                    Navigator.of(context).pop();
                  }
                }
              }
            },
            icon: const Icon(Icons.cancel_outlined),
            label: const Text('Cancel'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: ElevatedButton.icon(
            onPressed: state.canSubmit && !state.isSubmitting
                ? () async {
                    await notifier.submitAll();
                    
                    // If submission was successful (no error), navigate back
                    if (context.mounted) {
                      final currentState = ref.read(batchPaperModeNotifierProvider(config));
                      if (currentState.errorMessage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Prayer requests submitted successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        
                        if (config.returnWidget != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => config.returnWidget!,
                            ),
                          );
                        } else {
                          Navigator.of(context).pop();
                        }
                      }
                    }
                  }
                : null,
            icon: state.isSubmitting
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Icon(Icons.check_circle),
            label: Text(state.isSubmitting ? 'Submitting...' : 'Submit All'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B7355),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              disabledBackgroundColor: Colors.grey.shade300,
            ),
          ),
        ),
      ],
    );
  }
}
