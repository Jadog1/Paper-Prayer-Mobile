import 'package:http/http.dart' as http;
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'dart:convert';

import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/shared/config.dart';

class ContactsApiClient {
  final http.Client httpClient;
  final String baseUrl;

  ContactsApiClient({required this.httpClient, required this.baseUrl});

  Future<void> removeContactFromGroup(int groupId, int contactId) async {
    final response = await httpClient.delete(config.uri("/contacts/groups"), 
      body: jsonEncode({"group_id": groupId, "contact_id": contactId}), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error removing contact from group: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> removeContact(int contactId) async {
    final response = await httpClient.delete(config.uri("/contacts/$contactId"));

    if (response.statusCode != 200) {
      throw Exception("Error removing contact: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> removeGroup(int groupId) async {
    final response = await httpClient.delete(config.uri("/contacts/groups/$groupId"));

    if (response.statusCode != 200) {
      throw Exception("Error removing group: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> addContactToGroup(int groupId, int contactId) async {
    final response = await httpClient.post(config.uri("/contacts/groups"), 
      body: jsonEncode({"group_id": groupId, "contact_id": contactId}), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error adding contact to group: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> saveGroup(Group group) async {
    final response = await httpClient.post(config.uri("/contacts/groups"), 
      body: jsonEncode(group.toJson()), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error adding group: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> saveContact(Contact contact) async {
    final response = await httpClient.post(config.uri("/contacts"), 
      body: jsonEncode(contact.toJson()), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error adding contact: ${response.statusCode} - ${response.body}");
    }
  }

  Future<List<Contact>> fetchContacts() async {
    final response = await httpClient.get(config.uri("/contacts/"));

    if (response.statusCode != 200) {
      throw Exception("Error getting contacts: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((contact) => Contact.fromJson(contact)).toList();
  }

  Future<List<Group>> fetchGroups() async {
    final response = await httpClient.get(config.uri("/contacts/groups"));

    if (response.statusCode != 200) {
      throw Exception("Error getting groups: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((group) => Group.fromJson(group)).toList();
  }

  Future<List<ContactGroupPairs>> fetchContactGroupPairs() async {
    final response = await httpClient.get(config.uri("/contacts/contact_groups"));

    if (response.statusCode != 200) {
      throw Exception("Error getting contact group pairs: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((group) => ContactGroupPairs.fromJson(group)).toList();
  }

  Future<List<RelatedContact>> fetchRelatedContacts(int contactId) async {
    final response = await httpClient.get(config.uri("/contacts/related/$contactId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting related contacts: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((contact) => RelatedContact.fromJson(contact)).toList();
  }
}

class PrayerRequestApiClient {
  final http.Client httpClient;
  final String baseUrl;

  PrayerRequestApiClient({required this.httpClient, required this.baseUrl});

  Future<List<PrayerRequest>> fetchPrayerRequests(int contactId) async {
    final response = await httpClient.get(config.uri("/prayer_requests/contact/$contactId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting prayer requests: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((request) => PrayerRequest.fromJson(request)).toList();
  }

  Future<void> removeRequest(int requestId) async {
    final response = await httpClient.delete(config.uri("/prayer_requests/$requestId"));

    if (response.statusCode != 200) {
      throw Exception("Error removing prayer request: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> saveRequest(PrayerRequest request) async {
    final response = await httpClient.post(config.uri("/prayer_requests/"), 
      body: jsonEncode(request.toJson()), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error saving prayer request: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> updateRequest(PrayerRequest request) async {
    final response = await httpClient.put(config.uri("/prayer_requests/"), 
      body: jsonEncode(request.toJson()), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error updating prayer request: ${response.statusCode} - ${response.body}");
    }
  }

  
  Future<List<PrayerRequestScore>> fetchSimilarRequests(int requestId) async {
    final response = await config.prayerRequestApiClient.httpClient.get(config.uri("/prayer_requests/similar/$requestId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting similar requests: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((request) => PrayerRequestScore.fromJson(request)).toList();
  }
}
