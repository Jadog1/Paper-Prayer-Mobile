import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/models/paper_mode_config.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/models/paper_mode_state.dart';

/// Provider for PaperMode state management
/// 
/// This is an auto-dispose provider that creates a new state notifier
/// for each paper mode instance. The state is initialized based on the config.
final paperModeStateProvider =
    ChangeNotifierProvider.autoDispose<PaperModeStateNotifier>((ref) {
  return PaperModeStateNotifier();
});

/// Family provider for creating paper mode state with specific config
/// 
/// This allows multiple independent paper mode instances with different configs
final paperModeStateWithConfigProvider = ChangeNotifierProvider.autoDispose
    .family<PaperModeStateNotifier, PaperModeConfig>((ref, config) {
  final initialState = PaperModeState(
    aiMode: config.aiModeDefault,
    newRequests: config.readOnly ? [] : [
      PaperModeState.initial().newRequests.first,
    ],
  );
  return PaperModeStateNotifier(initialState: initialState);
});
