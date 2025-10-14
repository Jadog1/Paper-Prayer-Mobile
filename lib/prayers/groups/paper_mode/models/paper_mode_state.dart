import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
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
  });

  final ContactAndGroupPair? selectedUser;
  final bool aiMode;
  final Map<int, bool> hiddenPrayerRequests;
  final Set<int> prayerIdsInOverrideEditMode;
  final List<PrayerRequest> newRequests;

  /// Create initial state with a default prayer request
  factory PaperModeState.initial() {
    return PaperModeState(
      newRequests: [
        defaultPrayerRequest(
          defaultContact(),
          const ContactGroupPairs(id: 0, groupId: 0, contactId: 0, createdAt: ""),
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
  }) {
    return PaperModeState(
      selectedUser: clearSelectedUser ? null : selectedUser ?? this.selectedUser,
      aiMode: aiMode ?? this.aiMode,
      hiddenPrayerRequests: hiddenPrayerRequests ?? this.hiddenPrayerRequests,
      prayerIdsInOverrideEditMode:
          prayerIdsInOverrideEditMode ?? this.prayerIdsInOverrideEditMode,
      newRequests: newRequests ?? this.newRequests,
    );
  }
}

/// Mutable notifier for managing PaperMode state
/// 
/// This class provides methods to update the state and notify listeners.
/// It's decoupled from the view layer and can be easily tested.
class PaperModeStateNotifier extends ChangeNotifier {
  PaperModeStateNotifier({PaperModeState? initialState})
      : _state = initialState ?? PaperModeState.initial() {
    // Add the initial default request to processing queue
    if (_state.newRequests.isNotEmpty) {
      _requestsToProcess.add(_state.newRequests.first);
    }
  }

  PaperModeState _state;
  PaperModeState get state => _state;

  // Track which requests are being processed or have been updated
  final List<PrayerRequest> _requestsToProcess = [];
  Timer? _backgroundTimer;

  @override
  void dispose() {
    _backgroundTimer?.cancel();
    super.dispose();
  }

  /// Start background checking for feature generation on prayer requests
  void startBackgroundFeatureCheck(
      Future<PrayerRequest> Function(int) fetchUpdatedPrayerRequest) {
    _backgroundTimer?.cancel();
    _backgroundTimer = Timer.periodic(const Duration(seconds: 5), (_) async {
      for (int i = 0; i < _requestsToProcess.length; i++) {
        PrayerRequest req = _requestsToProcess[i];
        if (req.id == 0) continue; // Skip default request

        bool featuresReady = await hasGeneratedFeatures(req.id);
        if (featuresReady) {
          // Fetch the updated PrayerRequest from your service
          PrayerRequest updated = await fetchUpdatedPrayerRequest(req.id);
          _requestsToProcess.removeAt(i);
          
          // Update the request in newRequests list
          int idx = _state.newRequests.indexWhere((r) => r.id == req.id);
          if (idx != -1) {
            final updatedRequests = List<PrayerRequest>.from(_state.newRequests);
            updatedRequests[idx] = updated;
            _state = _state.copyWith(newRequests: updatedRequests);
            notifyListeners();
          }
        }
      }
    });
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

  /// Add a new default prayer request for the selected user
  void addDefaultPrayerRequest(ContactAndGroupPair user) {
    final newRequest = defaultPrayerRequest(user.contact, user.groupPair);
    final updatedRequests = List<PrayerRequest>.from(_state.newRequests)
      ..add(newRequest);
    _requestsToProcess.add(newRequest);
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
}
