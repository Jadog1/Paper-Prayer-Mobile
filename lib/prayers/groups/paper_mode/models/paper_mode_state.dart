import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/pipeline_status_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/repos/repo.dart';

/// Immutable state class for PaperMode
///
/// This class holds all the state for the PaperMode widget in an immutable way,
/// making it easier to reason about state changes and test.
class PaperModeState {
  const PaperModeState({
    this.selectedUser,
    this.aiMode = true,
    this.hiddenPrayerRequests = const {},
    this.prayerIdsInOverrideEditMode = const {},
    this.newRequests = const [],
    this.createdFirstFocusOnEditMode = false,
    this.pipelineStatuses = const {},
  });

  final ContactAndGroupPair? selectedUser;
  final bool aiMode;
  final Map<int, bool> hiddenPrayerRequests;
  final Set<int> prayerIdsInOverrideEditMode;
  final List<PrayerRequest> newRequests;
  final bool createdFirstFocusOnEditMode;
  final Map<int, PipelineRunDTO> pipelineStatuses;

  /// Create initial state with a default prayer request
  factory PaperModeState.initial() {
    return PaperModeState(
      newRequests: [
        defaultPrayerRequest(
          defaultContact(),
          const ContactGroupPairs(
              id: 0, groupId: 0, contactId: 0, createdAt: ""),
        ),
      ],
    );
  }

  /// Create a copy with modified fields
  PaperModeState copyWith({
    ContactAndGroupPair? selectedUser,
    bool? aiMode,
    Map<int, bool>? hiddenPrayerRequests,
    Set<int>? prayerIdsInOverrideEditMode,
    List<PrayerRequest>? newRequests,
    bool clearSelectedUser = false,
    bool? createdFirstFocusOnEditMode,
    Map<int, PipelineRunDTO>? pipelineStatuses,
  }) {
    return PaperModeState(
      selectedUser:
          clearSelectedUser ? null : selectedUser ?? this.selectedUser,
      aiMode: aiMode ?? this.aiMode,
      hiddenPrayerRequests: hiddenPrayerRequests ?? this.hiddenPrayerRequests,
      prayerIdsInOverrideEditMode:
          prayerIdsInOverrideEditMode ?? this.prayerIdsInOverrideEditMode,
      newRequests: newRequests ?? this.newRequests,
      createdFirstFocusOnEditMode:
          createdFirstFocusOnEditMode ?? this.createdFirstFocusOnEditMode,
      pipelineStatuses: pipelineStatuses ?? this.pipelineStatuses,
    );
  }
}

/// Mutable notifier for managing PaperMode state
///
/// This class provides methods to update the state and notify listeners.
/// It's decoupled from the view layer and can be easily tested.
class PaperModeStateNotifier extends ChangeNotifier {
  PaperModeStateNotifier({PaperModeState? initialState})
      : _state = initialState ?? PaperModeState.initial();

  PaperModeState _state;
  PaperModeState get state => _state;

  // Track which request IDs are being processed
  final Set<int> _requestIdsToTrack = {};
  Timer? _backgroundTimer;

  @override
  void dispose() {
    _backgroundTimer?.cancel();
    super.dispose();
  }

  /// Start tracking pipeline status for a request ID
  void startTrackingPipelineStatus(int requestId) {
    _requestIdsToTrack.add(requestId);

    // Start the background timer if not already running
    if (_backgroundTimer == null || !_backgroundTimer!.isActive) {
      _startPipelineStatusPolling();
    }
  }

  /// Stop tracking pipeline status for a request ID
  void stopTrackingPipelineStatus(int requestId) {
    _requestIdsToTrack.remove(requestId);

    // Stop the timer if no more requests to track
    if (_requestIdsToTrack.isEmpty) {
      _backgroundTimer?.cancel();
      _backgroundTimer = null;
    }
  }

  /// Internal method to poll pipeline statuses
  void _startPipelineStatusPolling() {
    _backgroundTimer?.cancel();
    _backgroundTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      if (_requestIdsToTrack.isEmpty) {
        _backgroundTimer?.cancel();
        _backgroundTimer = null;
        return;
      }

      final updatedStatuses =
          Map<int, PipelineRunDTO>.from(_state.pipelineStatuses);
      final completedIds = <int>[];

      for (final requestId in _requestIdsToTrack) {
        try {
          final pipelineStatus = await getPipelineStatus(requestId);

          if (pipelineStatus != null) {
            updatedStatuses[requestId] = pipelineStatus;

            // If pipeline is complete or failed, stop tracking
            if (pipelineStatus.isComplete || pipelineStatus.hasFailed) {
              completedIds.add(requestId);

              // Update the prayer request with fresh data if features are ready
              if (pipelineStatus.isComplete) {
                try {
                  final updatedRequest =
                      await fetchUpdatedPrayerRequest(requestId);
                  final idx =
                      _state.newRequests.indexWhere((r) => r.id == requestId);
                  if (idx != -1) {
                    final updatedRequests =
                        List<PrayerRequest>.from(_state.newRequests);
                    updatedRequests[idx] = updatedRequest;
                    _state = _state.copyWith(newRequests: updatedRequests);
                  }
                } catch (_) {
                  // Ignore errors fetching updated request
                }
              }
            }
          }
        } catch (_) {
          // Ignore errors for individual requests
        }
      }

      // Remove completed requests from tracking
      for (final id in completedIds) {
        _requestIdsToTrack.remove(id);
      }

      // Update state with new pipeline statuses
      _state = _state.copyWith(pipelineStatuses: updatedStatuses);
      notifyListeners();
    });
  }

  /// Legacy method for backwards compatibility
  @Deprecated('Use startTrackingPipelineStatus instead')
  void startBackgroundFeatureCheck(
      Future<PrayerRequest> Function(int) fetchUpdatedPrayerRequest) {
    // This method is kept for backwards compatibility but does nothing
    // The new pipeline status tracking handles this automatically
  }

  /// Set the selected user/contact
  void setContact(ContactAndGroupPair contact) {
    _state = _state.copyWith(selectedUser: contact);
    notifyListeners();
  }

  /// Clear the selected user
  void clearContact() {
    _state = _state.copyWith(clearSelectedUser: true);
    notifyListeners();
  }

  /// Toggle or set edit mode override for a specific prayer
  void setEditModeOverride(int prayerId, bool isEditing) {
    final newSet = Set<int>.from(_state.prayerIdsInOverrideEditMode);
    if (isEditing) {
      newSet.add(prayerId);
    } else {
      newSet.remove(prayerId);
    }
    _state = _state.copyWith(prayerIdsInOverrideEditMode: newSet);
    notifyListeners();
  }

  /// Set AI mode on or off
  void setAiMode(bool mode) {
    _state = _state.copyWith(
      aiMode: mode,
      prayerIdsInOverrideEditMode: {}, // Clear edit mode when toggling AI mode
    );
    notifyListeners();
  }

  void setCreatedFirstFocusOnEditMode() {
    if (!_state.createdFirstFocusOnEditMode) {
      _state = _state.copyWith(createdFirstFocusOnEditMode: true);
      notifyListeners();
    }
  }

  /// Add a new default prayer request for the selected user
  void addDefaultPrayerRequest(ContactAndGroupPair user) {
    final newRequest = defaultPrayerRequest(user.contact, user.groupPair);
    final updatedRequests = List<PrayerRequest>.from(_state.newRequests)
      ..add(newRequest);
    _state = _state.copyWith(newRequests: updatedRequests);
    notifyListeners();
  }

  /// Hide a prayer request by ID
  void hidePrayerRequest(int id) {
    final updatedHidden = Map<int, bool>.from(_state.hiddenPrayerRequests);
    updatedHidden[id] = true;
    _state = _state.copyWith(hiddenPrayerRequests: updatedHidden);
    notifyListeners();
  }

  /// Update a specific new request (by index or ID)
  void updateNewRequest(int id, PrayerRequest updatedRequest) {
    final idx = _state.newRequests.indexWhere((r) => r.id == id);
    if (idx != -1) {
      final updatedRequests = List<PrayerRequest>.from(_state.newRequests);
      updatedRequests[idx] = updatedRequest;
      _state = _state.copyWith(newRequests: updatedRequests);
      notifyListeners();
    }
  }

  /// Get pipeline status for a specific request ID
  PipelineRunDTO? getPipelineStatusForRequest(int requestId) {
    return _state.pipelineStatuses[requestId];
  }

  /// Check if a request is currently being processed
  bool isRequestProcessing(int requestId) {
    final status = _state.pipelineStatuses[requestId];
    return status != null && status.isRunning;
  }
}
