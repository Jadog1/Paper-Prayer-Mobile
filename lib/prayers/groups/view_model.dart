
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
// import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
// import '../../shared/state_management.dart';

String dateTimeToDate(String dateTime) {
    var format = DateFormat('yMd');
    var date = DateTime.parse(dateTime).toLocal();
    return format.format(date);
  }

class GroupViewModel extends ChangeNotifier {
  final List<GroupWithMembers> _groups = [];

  List<GroupWithMembers> get groups {
    
   return _groups;
  }

  void addGroup(GroupWithMembers group) {
    _groups.add(group);
    notifyListeners();
  }

  void removeGroup(GroupWithMembers group) {
    _groups.remove(group);
    notifyListeners();
  }
}

class PrayerRequestViewModel extends ChangeNotifier {
  final List<PrayerRequest> _requests = [];

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

List<int> getRelatedContactIds(List<RelatedContact> relatedContacts) {
  return relatedContacts.map((contact) => contact.id).toList();
}

List<RelatedContact> findRelatedContacts(List<RelatedContact> allRelated, List<int> relatedContactIds) {
  return allRelated.where((related) => relatedContactIds.contains(related.id)).toList();
}

String relatedContactsAsString(List<RelatedContact> relatedContacts) {
  List<String> contacts = [];
  for (var relatedContact in relatedContacts) {
    String relatedContactString = relatedContact.name;
    if (relatedContactString.isEmpty && relatedContact.lowLevelRelationship != null && relatedContact.lowLevelRelationship!.isNotEmpty) {
      relatedContactString = relatedContact.lowLevelRelationship!;
    } 
    
    if (relatedContact.highLevelRelationship != null && relatedContact.highLevelRelationship!.isNotEmpty && relatedContact.highLevelRelationship != 'other') {
      relatedContactString = "$relatedContactString (${relatedContact.highLevelRelationship!})";
    }  
    if (relatedContact.label != null && relatedContact.label!.isNotEmpty) {
      relatedContactString = "$relatedContactString [${relatedContact.label}]";
    }
    contacts.add(relatedContactString.trim());
  }
  return contacts.join(", ");
}