import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/models/paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/providers/paper_mode_provider.dart';

/// Header widget with navigation and AI mode toggle
class OptionsHeader extends ConsumerWidget {
  const OptionsHeader({super.key, required this.config});

  final PaperModeConfig config;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifier = ref.watch(paperModeStateProvider);
    final state = stateNotifier.state;
    
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
