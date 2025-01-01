
import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
// import '../../shared/state_management.dart';

class GroupViewModel extends ChangeNotifier {
  final List<GroupContacts> _groups = [];

  List<GroupContacts> get groups {
    
   return _groups;
  }

  void addGroup(GroupContacts group) {
    _groups.add(group);
    notifyListeners();
  }

  void removeGroup(GroupContacts group) {
    _groups.remove(group);
    notifyListeners();
  }
}

class PrayerRequestViewModel extends ChangeNotifier {
  final List<PrayerRequest> _requests = [
     const PrayerRequest(
      id: 1,
      request: 'Pray for my family',
      user: Contact(id: 1, name: 'John Doe', createdAt: '2021-01-01'),
    ),
     const PrayerRequest(
      id: 2,
      request: 'Pray for my health',
      user: Contact(id: 2, name: 'Jane Doe', createdAt: '2021-01-01'),
    ),
  ];

  List<PrayerRequest> get requests => _requests;

  void addRequest(PrayerRequest request) {
    _requests.add(request);
    notifyListeners();
  }

  void removeRequest(PrayerRequest request) {
    _requests.remove(request);
    notifyListeners();
  }
}