import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';

/// State for managing multi-select export mode
class ExportState {
  const ExportState({
    this.isExportMode = false,
    this.selectedRequests = const {},
  });

  final bool isExportMode;
  final Set<int> selectedRequests; // Set of prayer request IDs

  ExportState copyWith({
    bool? isExportMode,
    Set<int>? selectedRequests,
  }) {
    return ExportState(
      isExportMode: isExportMode ?? this.isExportMode,
      selectedRequests: selectedRequests ?? this.selectedRequests,
    );
  }

  /// Check if a prayer request is selected
  bool isSelected(int requestId) {
    return selectedRequests.contains(requestId);
  }

  /// Get the count of selected requests
  int get selectedCount => selectedRequests.length;

  /// Clear all selections
  ExportState clearSelections() {
    return copyWith(selectedRequests: {});
  }

  /// Exit export mode and clear selections
  ExportState exitExportMode() {
    return const ExportState(
      isExportMode: false,
      selectedRequests: {},
    );
  }

  /// Enter export mode
  ExportState enterExportMode() {
    return copyWith(isExportMode: true, selectedRequests: {});
  }
}

/// Notifier for managing export state
class ExportStateNotifier extends ChangeNotifier {
  ExportStateNotifier() : _state = const ExportState();

  ExportState _state;
  ExportState get state => _state;

  /// Toggle export mode
  void toggleExportMode() {
    if (_state.isExportMode) {
      _state = _state.exitExportMode();
    } else {
      _state = _state.enterExportMode();
    }
    notifyListeners();
  }

  /// Enter export mode
  void enterExportMode() {
    _state = _state.enterExportMode();
    notifyListeners();
  }

  /// Exit export mode
  void exitExportMode() {
    _state = _state.exitExportMode();
    notifyListeners();
  }

  /// Toggle a single prayer request
  void toggleRequest(int requestId) {
    final newSet = Set<int>.from(_state.selectedRequests);
    if (newSet.contains(requestId)) {
      newSet.remove(requestId);
    } else {
      newSet.add(requestId);
    }
    _state = _state.copyWith(selectedRequests: newSet);
    notifyListeners();
  }

  /// Toggle multiple prayer requests
  /// If not all are selected, select all. If all are selected, deselect all.
  void toggleMultipleRequests(List<PrayerRequest> requests) {
    final requestIds = requests.map((r) => r.id).toSet();
    final currentlySelected = requestIds.intersection(_state.selectedRequests);
    
    final newSet = Set<int>.from(_state.selectedRequests);
    
    // If not all are selected, select all
    if (currentlySelected.length < requestIds.length) {
      newSet.addAll(requestIds);
    } else {
      // If all are selected, deselect all
      newSet.removeAll(requestIds);
    }
    
    _state = _state.copyWith(selectedRequests: newSet);
    notifyListeners();
  }

  /// Clear all selections
  void clearSelections() {
    _state = _state.clearSelections();
    notifyListeners();
  }

  /// Select multiple requests (used when clicking date/name headers)
  void selectRequests(List<int> requestIds) {
    final newSet = Set<int>.from(_state.selectedRequests);
    newSet.addAll(requestIds);
    _state = _state.copyWith(selectedRequests: newSet);
    notifyListeners();
  }
}
