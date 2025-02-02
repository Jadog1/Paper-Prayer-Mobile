import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';

class PaperModeSharedState extends ChangeNotifier {
  final List<Contact> _contacts = [];
  final List<AsyncSavedPrayerRequest> _requests = [];
  Contact? _selectedUser;

  List<Contact> get contacts => _contacts;
  Contact? get selectedUser => _selectedUser;
  List<AsyncSavedPrayerRequest> get requests => _requests;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void setContact(Contact contact) {
    _selectedUser = contact;
    notifyListeners();
  }

  void addRequest(AsyncSavedPrayerRequest request) {
    _requests.add(request);
    notifyListeners();
  }

  void reset() {
    _contacts.clear();
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