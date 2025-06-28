import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'dart:async';

import 'package:prayer_ml/prayers/groups/repos/repo.dart';

class PaperModeSharedState extends ChangeNotifier {
  ContactAndGroupPair? _selectedUser;
  bool _aiMode = true;
  Map<int, bool> hiddenPrayerRequests = {};
  final Set<int> prayerIdsInOverrideEditMode = {};
  final List<PrayerRequest> _newRequests = [
    defaultPrayerRequest(
      defaultContact(),
      const ContactGroupPairs(id: 0, groupId: 0, contactId: 0, createdAt: ""),
    ),
  ];

  // Track which requests are being processed or have been updated
  final List<PrayerRequest> _requestsToProcess = [];
  Timer? _backgroundTimer;

  PaperModeSharedState() {
    // Initialize with default prayer request
    _requestsToProcess.add(_newRequests.first);
  }

  @override
  void dispose() {
    _backgroundTimer?.cancel();
    super.dispose();
  }

  // Call this in your constructor or after initialization
  void startBackgroundFeatureCheck(Function(int) fetchUpdatedPrayerRequest) {
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
          int idx = _newRequests.indexWhere((r) => r.id == req.id);
          if (idx != -1) {
            _newRequests[idx] = updated;
            notifyListeners();
          }
        }
      }
    });
  }
  
  ContactAndGroupPair? get selectedUser => _selectedUser;
  bool get aiMode => _aiMode;
  List<PrayerRequest> get newRequests => _newRequests;

  void setContact(ContactAndGroupPair contact) {
    _selectedUser = contact;
    notifyListeners();
  }

  void setEditModeOverride(int prayerId, bool isEditing) {
    if (isEditing) {
      prayerIdsInOverrideEditMode.add(prayerId);
    } else {
      prayerIdsInOverrideEditMode.remove(prayerId);
    }
    notifyListeners();
  }

  void setAiMode(bool mode) {
    _aiMode = mode;
    prayerIdsInOverrideEditMode.clear(); // Clear edit mode when toggling AI mode
    notifyListeners();
  }

  void addDefaultPrayerRequest(ContactAndGroupPair user) {
    var newRequest = defaultPrayerRequest(user.contact, user.groupPair);
    _newRequests.add(newRequest);
    _requestsToProcess.add(newRequest);
    notifyListeners();
  }

  void hidePrayerRequest(int id) {
    hiddenPrayerRequests[id] = true;
    notifyListeners();
  }
}

final paperModeSharedStateProvider = ChangeNotifierProvider.autoDispose<PaperModeSharedState>((ref) {
  return PaperModeSharedState();
});

class AsyncSavedPrayerRequest {
  AsyncSavedPrayerRequest({
    required this.request,
    required this.user,
    this.prayerRequest,
  });

  final String request;
  final Contact user;
  final PrayerRequest? prayerRequest;
}