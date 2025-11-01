
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
  if (relatedContacts.isEmpty) return '';
  
  List<String> contacts = [];
  for (var relatedContact in relatedContacts) {
    contacts.add(relatedContactAsString(relatedContact));
  }
  
  // Format based on number of contacts
  if (contacts.length == 1) {
    return "For ${contacts[0]}";
  } else if (contacts.length == 2) {
    return "For ${contacts[0]} and ${contacts[1]}";
  } else {
    final lastContact = contacts.removeLast();
    return "For ${contacts.join(', ')}, and $lastContact";
  }
}

String relatedContactAsString(RelatedContact relatedContact) {
  List<String> parts = [];
  
  String namePart = relatedContact.name;
  if (namePart.isEmpty && relatedContact.lowLevelRelationship != null && relatedContact.lowLevelRelationship!.isNotEmpty) {
    namePart = relatedContact.lowLevelRelationship!;
  }
  parts.add(namePart);
  
  if (relatedContact.highLevelRelationship != null && 
      relatedContact.highLevelRelationship!.isNotEmpty && 
      relatedContact.highLevelRelationship != 'other' &&
      relatedContact.label == null) {
    parts.add("(${relatedContact.highLevelRelationship!})");
  }
  
  if (relatedContact.label != null && relatedContact.label!.isNotEmpty) {
    parts.add("(${relatedContact.label})");
  }
  
  return parts.join(' ').trim();
}