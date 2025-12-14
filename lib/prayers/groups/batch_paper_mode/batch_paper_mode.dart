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
        ),
        body: SafeArea(
          child: Stack(
            children: [
              // Main content
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: state.currentStep == BatchPaperModeStep.contentEditing
                      ? (state.selectedGroup != null
                          ? 92.0
                          : 56.0) // Space for toolbar (taller if group is shown)
                      : 16.0,
                  bottom:
                      state.currentStep == BatchPaperModeStep.contentEditing &&
                              !state.isEditMode
                          ? 80.0 // Space for bottom buttons in read mode
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
                            Icon(Icons.error_outline,
                                color: Colors.red.shade700),
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

              // Toolbar (only in content editing step)
              if (state.currentStep == BatchPaperModeStep.contentEditing)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: _buildToolbar(context, state, notifier),
                ),

              // Bottom action buttons - fixed position (only in read mode)
              if (state.currentStep == BatchPaperModeStep.contentEditing &&
                  !state.isEditMode)
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
                          color: Colors.black.withValues(alpha: 0.1),
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
  Future<bool> _handleBackPress(
      BuildContext context, BatchPaperModeState state) async {
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

  Widget _buildToolbar(
    BuildContext context,
    BatchPaperModeState state,
    BatchPaperModeNotifier notifier,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Group name display
          if (state.selectedGroup != null) ...[
            Row(
              children: [
                Icon(Icons.book, size: 16, color: Colors.grey.shade600),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Sending to: ${state.selectedGroup!.group.name}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
          // Action buttons with horizontal scroll
          SizedBox(
            height: 36,
            child: Stack(
              children: [
                // Scrollable buttons
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Change Group button
                    if (state.selectedGroup != null) ...[
                      OutlinedButton.icon(
                        onPressed: () => notifier.goBackToGroupSelection(),
                        icon: const Icon(Icons.swap_horiz, size: 16),
                        label: const Text('Change Group',
                            style: TextStyle(fontSize: 12)),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    // Edit/Preview button
                    OutlinedButton.icon(
                      onPressed: () => notifier.toggleMode(),
                      icon: Icon(
                          state.isEditMode ? Icons.visibility : Icons.edit,
                          size: 16),
                      label: Text(
                        state.isEditMode ? 'Preview' : 'Edit',
                        style: const TextStyle(fontSize: 12),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Paste button (only in edit mode)
                    if (state.isEditMode) ...[
                      OutlinedButton.icon(
                        onPressed: () async {
                          final clipboardData =
                              await Clipboard.getData(Clipboard.kTextPlain);
                          if (clipboardData != null &&
                              clipboardData.text != null) {
                            notifier.handlePaste(clipboardData.text!);
                          }
                        },
                        icon: const Icon(Icons.paste, size: 16),
                        label:
                            const Text('Paste', style: TextStyle(fontSize: 12)),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                    // Help button
                    OutlinedButton.icon(
                      onPressed: () => _showHelpDialog(context, state),
                      icon: const Icon(Icons.help_outline, size: 16),
                      label: const Text('Help', style: TextStyle(fontSize: 12)),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                      ),
                    ),
                  ],
                ),
                // Scroll indicator on the right
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 24,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.white.withValues(alpha: 0.0),
                          Colors.white.withValues(alpha: 0.9),
                        ],
                      ),
                    ),
                    child: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog(BuildContext context, BatchPaperModeState state) {
    final isEditMode = state.isEditMode;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              isEditMode ? Icons.edit : Icons.visibility,
              color: const Color(0xFF8B7355),
            ),
            const SizedBox(width: 12),
            Text(isEditMode ? 'Edit Mode Help' : 'Read Mode Help'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:
                isEditMode ? _buildEditModeHelp() : _buildReadModeHelp(state),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildEditModeHelp() {
    return [
      const Text(
        'How to use Edit Mode:',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 12),
      _buildHelpItem(
        Icons.edit,
        'Enter Content',
        'Type or paste prayer requests. Each line will be parsed separately.',
      ),
      _buildHelpItem(
        Icons.paste,
        'Paste Content',
        'Use the Paste button to paste from clipboard. The view will automatically switch to Read Mode for review.',
      ),
      _buildHelpItem(
        Icons.person,
        'Contact Names',
        'Lines with just names (< 150 chars) will be detected as contacts. Prayer requests will be associated with the contact above them.',
      ),
      _buildHelpItem(
        Icons.format_list_bulleted,
        'Formatting',
        'Bullet points (-, *, •) and numbering (1., 2., etc.) are automatically removed.',
      ),
      _buildHelpItem(
        Icons.visibility,
        'Preview',
        'Click the Preview button to see how your content will be organized.',
      ),
    ];
  }

  List<Widget> _buildReadModeHelp(BatchPaperModeState state) {
    return [
      const Text(
        'How to use Read Mode:',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      const SizedBox(height: 12),
      _buildHelpItem(
        Icons.drag_indicator,
        'Reorder Items',
        'Long press and drag items to change their order.',
      ),
      _buildHelpItem(
        Icons.touch_app,
        'Edit Items',
        'Tap any item to edit its content or change between contact/prayer request.',
      ),
      _buildHelpItem(
        Icons.delete_outline,
        'Delete Items',
        'Swipe left on any item to delete it.',
      ),
      if (state.hasUnresolvedContacts)
        _buildHelpItem(
          Icons.warning_amber,
          'Resolve Ambiguous Contacts',
          'Items with a warning icon match multiple contacts. Tap them to select the correct contact.',
          color: Colors.orange,
        ),
      _buildHelpItem(
        Icons.edit,
        'Switch to Edit',
        'Click the Edit button to go back to raw text editing.',
      ),
      _buildHelpItem(
        Icons.check_circle,
        'Submit',
        'Once everything looks good, click Submit All at the bottom.',
      ),
    ];
  }

  Widget _buildHelpItem(IconData icon, String title, String description,
      {Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: color ?? const Color(0xFF8B7355)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
                      final currentState =
                          ref.read(batchPaperModeNotifierProvider(config));
                      if (currentState.errorMessage == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Prayer requests submitted successfully!'),
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
