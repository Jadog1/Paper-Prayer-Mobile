import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/paper_mode/models/export_state.dart';

/// Provider for export state management
/// 
/// This provider manages the state for multi-select export mode
final exportStateProvider =
    ChangeNotifierProvider.autoDispose<ExportStateNotifier>((ref) {
  return ExportStateNotifier();
});
