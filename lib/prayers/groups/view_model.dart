
import 'package:flutter/material.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
// import '../../shared/state_management.dart';

class GroupViewModel extends ChangeNotifier {
  final List<GroupContacts> _groups = [
    const GroupContacts(
      id: 1,
      name: 'Group 1',
      description: 'This is the first group.',
      members: [
        Contact(id: 1, name: 'Alice Smith'),
        Contact(id: 2, name: 'Bob Johnson'),
      ],
    ),
     const GroupContacts(
      id: 2,
      name: 'Group 2',
      description: 'This is the second group.',
      members: [
        Contact(id: 3, name: 'Charlie Brown'),
        Contact(id: 4, name: 'Daisy Miller'),
      ],
    ),
  ];

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
      user: Contact(id: 1, name: 'John Doe'),
    ),
     const PrayerRequest(
      id: 2,
      request: 'Pray for my health',
      user: Contact(id: 2, name: 'Jane Doe'),
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