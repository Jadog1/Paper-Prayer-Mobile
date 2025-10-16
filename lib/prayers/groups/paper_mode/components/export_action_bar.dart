import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/components/export_options_modal.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/export_provider.dart';

/// Bottom action bar shown when in export mode with selection controls
class ExportActionBar extends ConsumerWidget {
  const ExportActionBar({
    super.key,
    required this.allRequests,
  });

  final List<PrayerRequest> allRequests;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exportNotifier = ref.watch(exportStateProvider);
    final exportState = exportNotifier.state;

    if (!exportState.isExportMode) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${exportState.selectedCount} selected',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    exportNotifier.exitExportMode();
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: exportState.selectedCount > 0
                      ? () {
                          // Get the selected requests
                          final selectedRequests = allRequests
                              .where((r) => exportState.isSelected(r.id))
                              .toList();

                          // Show export modal
                          showDialog(
                            context: context,
                            builder: (context) => ExportOptionsModal(
                              selectedRequests: selectedRequests,
                            ),
                          ).then((_) {
                            // Exit export mode after modal closes
                            exportNotifier.exitExportMode();
                          });
                        }
                      : null,
                  child: const Text('Continue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
