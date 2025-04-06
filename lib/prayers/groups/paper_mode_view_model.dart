import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';

class PaperModeSharedState extends ChangeNotifier {
  Contact? _selectedUser;
  bool _aiMode = false;

  Contact? get selectedUser => _selectedUser;
  bool get aiMode => _aiMode;

  void setContact(Contact contact) {
    _selectedUser = contact;
    notifyListeners();
  }

  void setAiMode(bool mode) {
    _aiMode = mode;
    notifyListeners();
  }

  void reset() {
    _selectedUser = null;
    notifyListeners();
  }
}
final paperModeSharedStateProvider = ChangeNotifierProvider<PaperModeSharedState>((ref) {
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