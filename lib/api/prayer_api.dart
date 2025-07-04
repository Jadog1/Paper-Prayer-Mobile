import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'dart:convert';

import 'package:prayer_ml/prayers/groups/models/group_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/shared/config.dart';


class ContactsApiClient {
  final FirebaseAuthHttpClient authClient;
  final String baseUrl;

  ContactsApiClient({required this.authClient, required this.baseUrl});

  Future<void> removeContactFromGroup(int groupId, int contactId) async {
    final response = await authClient.delete(config.uri("/contacts/groups"), 
      body: jsonEncode({"group_id": groupId, "contact_id": contactId}), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error removing contact from group: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> removeContact(int contactId) async {
    final response = await authClient.delete(config.uri("/contacts/$contactId"));

    if (response.statusCode != 200) {
      throw Exception("Error removing contact: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> removeGroup(int groupId) async {
    final response = await authClient.delete(config.uri("/contacts/groups/$groupId"));

    if (response.statusCode != 200) {
      throw Exception("Error removing group: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> addContactToGroup(int groupId, int contactId) async {
    final response = await authClient.post(config.uri("/contacts/groups"), 
      body: jsonEncode({"group_id": groupId, "contact_id": contactId}), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error adding contact to group: ${response.statusCode} - ${response.body}");
    }
  }

  Future<void> saveGroup(Group group) async {
    final response = await authClient.post(config.uri("/contacts/groups"), 
      body: jsonEncode(group.toJson()), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error adding group: ${response.statusCode} - ${response.body}");
    }
  }

  Future<Contact> saveContact(Contact contact, Group group) async {
    final response = await authClient.post(config.uri("/contacts/"), 
      body: jsonEncode({
        "contact": contact.toJson(),
        "group": group.toJson(),
      }), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error adding contact: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body);
    return Contact.fromJson(json);
  }

  Future<Contact> updateContact(Contact contact) async {
    final response = await authClient.put(config.uri("/contacts/"), 
      body: jsonEncode(contact.toJson()), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error updating contact: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body);
    return Contact.fromJson(json);
  }

  Future<List<Contact>> fetchContacts() async {
    final response = await authClient.get(config.uri("/contacts/"));

    if (response.statusCode != 200) {
      throw Exception("Error getting contacts: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((contact) => Contact.fromJson(contact)).toList();
  }

  Future<List<Group>> fetchGroups() async {
    final response = await authClient.get(config.uri("/contacts/groups"));

    if (response.statusCode != 200) {
      throw Exception("Error getting groups: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((group) => Group.fromJson(group)).toList();
  }

  Future<List<ContactGroupPairs>> fetchContactGroupPairs() async {
    final response = await authClient.get(config.uri("/contacts/contact_groups"));

    if (response.statusCode != 200) {
      throw Exception("Error getting contact group pairs: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((group) => ContactGroupPairs.fromJson(group)).toList();
  }

  Future<ContactGroupPairs> fetchContactGroup(int contactId, int groupId) async {
    final response = await authClient.get(config.uri("/contacts/contact_group", {"contact_id": contactId.toString(), "group_id": groupId.toString()}));

    if (response.statusCode != 200) {
      throw Exception("Error getting contact group: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body);
    return ContactGroupPairs.fromJson(json);
  }

  Future<List<RelatedContact>> fetchRelatedContacts(int contactId) async {
    final response = await authClient.get(config.uri("/contacts/related/$contactId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting related contacts: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((contact) => RelatedContact.fromJson(contact)).toList();
  }
}

class PrayerRequestApiClient {
  final FirebaseAuthHttpClient authClient;
  final String baseUrl;

  PrayerRequestApiClient({required this.authClient, required this.baseUrl});

  Future<List<PrayerRequest>> fetchPrayerRequests(int contactId) async {
    final response = await authClient.get(config.uri("/prayer_requests/contact/$contactId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting prayer requests: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((request) => PrayerRequest.fromJson(request)).toList();
  }

  Future<void> removeRequest(int requestId) async {
    final response = await authClient.delete(config.uri("/prayer_requests/$requestId"));

    if (response.statusCode != 200) {
      throw Exception("Error removing prayer request: ${response.statusCode} - ${response.body}");
    }
  }

  Future<PrayerRequest> saveRequest(PrayerRequest request) async {
    final response = await authClient.post(config.uri("/prayer_requests/"), 
      body: jsonEncode(request.toJson()), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error saving prayer request: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body);
    return PrayerRequest.fromJson(json);
  }

  Future<PrayerRequest> updateRequest(PrayerRequest request) async {
    final response = await authClient.put(config.uri("/prayer_requests/"), 
      body: jsonEncode(request.toJson()), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error updating prayer request: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body);
    return PrayerRequest.fromJson(json);
  }

  
  Future<List<PrayerRequestScore>> fetchSimilarRequests(int requestId) async {
    final response = await config.prayerRequestApiClient.authClient.get(config.uri("/prayer_requests/similar/$requestId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting similar requests: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((request) => PrayerRequestScore.fromJson(request)).toList();
  }

  Future<List<BibleReferenceAndText>> fetchBibleVersesForPrayerRequest(int requestId) async {
    final response = await authClient.get(config.uri("/prayer_requests/similar/bible/$requestId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting bible verses: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((verse) => BibleReferenceAndText.fromJson(verse)).toList();
  }

  Future<bool> requestHasGeneratedFeatures(int requestId) async {
    final response = await authClient.get(config.uri("/prayer_requests/has-generated/$requestId"));

    if (response.statusCode != 200) {
      throw Exception("Error checking request features: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body);
    return json['has_generated'] as bool;
  }

  Future<PrayerRequest> fetchPrayerRequest(int requestId) async {
    final response = await authClient.get(config.uri("/prayer_requests/$requestId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting prayer request: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body);
    return PrayerRequest.fromJson(json);
  }

  Future<void> clearDebounceTimeout(int requestId) async {
    final response = await authClient.post(config.uri("/prayer_requests/clear-debounce/$requestId"));

    if (response.statusCode != 200) {
      throw Exception("Error clearing debounce timeout: ${response.statusCode} - ${response.body}");
    }
  }
}

class CollectionsApiClient {
  final FirebaseAuthHttpClient authClient;
  final String baseUrl;

  CollectionsApiClient({required this.authClient, required this.baseUrl});

  Future<List<Collection>> fetchCollections(int contactId) async {
    final response = await authClient.get(config.uri("/collections/contact/$contactId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting collections: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((collection) => Collection.fromJson(collection)).toList();
  }

  Future<List<Collection>> fetchRecommendations(int contactId) async {
    final response = await authClient.get(config.uri("/collections/recommendations/$contactId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting recommended collections: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((collection) => Collection.fromJson(collection)).toList();
  } 

  Future<List<PrayerRequest>> fetchRelatedRequests(int collectionId) async {
    final response = await authClient.get(config.uri("/collections/requests/$collectionId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting requests: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((request) => PrayerRequest.fromJson(request)).toList();
  }

  Future<void> removeCollection(int collectionId) async {
    final response = await authClient.delete(config.uri("/collections/$collectionId"));

    if (response.statusCode != 200) {
      throw Exception("Error removing collection: ${response.statusCode} - ${response.body}");
    }
  }

  Future<Collection?> fetchCollectionFromRequest(int requestId) async {
    final response = await authClient.get(config.uri("/collections/request/$requestId"));

    if (response.statusCode != 200) {
      throw Exception("Error getting collection from request: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body);
    if (json == null) {
      return null;
    }
    return Collection.fromJson(json);
  }
}