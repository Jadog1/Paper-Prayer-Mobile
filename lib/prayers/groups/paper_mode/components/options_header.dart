import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/batch_paper_mode/batch_paper_mode.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/models/paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/paper_mode_provider.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/export_provider.dart';

/// Header widget with navigation and AI mode toggle
class OptionsHeader extends ConsumerWidget {
  const OptionsHeader({super.key, required this.config});

  final PaperModeConfig config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifier = ref.watch(paperModeStateProvider);
    final state = stateNotifier.state;
    final exportNotifier = ref.watch(exportStateProvider);
    final exportState = exportNotifier.state;
    
    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.surfaceContainer,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Create a back button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Row(
                children: [
                  // Batch insert mode
                  if (config.groupContacts != null && !config.readOnly) ...[
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.playlist_add, size: 20, color: Colors.grey.shade700),
                      tooltip: 'Batch Insert',
                      onPressed:() => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BatchPaperMode(
                            config: BatchPaperModeConfig.withGroup(
                              groupContacts: config.groupContacts!,
                            ),
                          ),
                        ),
                      )
                    ),
                  ],
                  // Export button
                  IconButton(
                    icon: Icon(
                      exportState.isExportMode ? Icons.close : Icons.file_download,
                    ),
                    tooltip: exportState.isExportMode ? 'Cancel export' : 'Export',
                    onPressed: () {
                      exportNotifier.toggleExportMode();
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text("Summary"),
                  Switch(
                    value: state.aiMode,
                    onChanged: (val) {
                      stateNotifier.setAiMode(val);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
