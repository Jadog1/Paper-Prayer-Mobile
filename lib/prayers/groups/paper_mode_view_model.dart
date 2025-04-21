import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';

class PaperModeSharedState extends ChangeNotifier {
  ContactAndGroupPair? _selectedUser;
  bool _aiMode = false;
  Map<int, bool> hiddenPrayerRequests = {};
  final List<PrayerRequest> _newRequests = [
    defaultPrayerRequest(
      const Contact(id: 0, name: "", createdAt: ""),
      const ContactGroupPairs(id: 0, groupId: 0, contactId: 0, createdAt: ""),
    ),
  ];

  
  ContactAndGroupPair? get selectedUser => _selectedUser;
  bool get aiMode => _aiMode;
  List<PrayerRequest> get newRequests => _newRequests;

  void setContact(ContactAndGroupPair contact) {
    _selectedUser = contact;
    notifyListeners();
  }

  void setAiMode(bool mode) {
    _aiMode = mode;
    notifyListeners();
  }

  void addDefaultPrayerRequest(ContactAndGroupPair user) {
    var newRequest = defaultPrayerRequest(user.contact, user.groupPair);
    _newRequests.add(newRequest);
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