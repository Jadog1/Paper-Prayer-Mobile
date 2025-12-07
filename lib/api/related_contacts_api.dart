import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'dart:convert';
import 'package:prayer_ml/shared/config.dart';

class RelatedContactsApiClient {
  final FirebaseAuthHttpClient authClient;
  final String baseUrl;

  RelatedContactsApiClient({required this.authClient, required this.baseUrl});

  /// Get all related contacts for a contact
  Future<List<RelatedContact>> fetchRelatedContactsForContact(
      int contactId) async {
    final response = await authClient
        .get(config.uri("/related_contacts/contact/$contactId"));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting related contacts: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    return json.map((contact) => RelatedContact.fromJson(contact)).toList();
  }

  /// Get a single related contact by ID
  Future<RelatedContact> fetchRelatedContact(int relatedContactId) async {
    final response =
        await authClient.get(config.uri("/related_contacts/$relatedContactId"));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting related contact: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return RelatedContact.fromJson(json);
  }

  /// Get prayer requests for a related contact
  Future<List<PrayerRequest>> fetchPrayerRequestsForRelatedContact(
      int relatedContactId) async {
    final response = await authClient
        .get(config.uri("/related_contacts/$relatedContactId/prayer-requests"));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting prayer requests for related contact: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    return json.map((request) => PrayerRequest.fromJson(request)).toList();
  }

  /// Get the associated contact for a related contact
  Future<Contact> fetchContactForRelatedContact(int relatedContactId) async {
    final response = await authClient
        .get(config.uri("/related_contacts/$relatedContactId/contact"));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting contact for related contact: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return Contact.fromJson(json);
  }

  /// Delete a related contact
  Future<void> deleteRelatedContact(int relatedContactId) async {
    final response = await authClient
        .delete(config.uri("/related_contacts/$relatedContactId"));

    if (response.statusCode != 200) {
      throw Exception(
          "Error deleting related contact: ${response.statusCode} - ${response.body}");
    }
  }

  /// Update a related contact
  Future<RelatedContact> updateRelatedContact(
      RelatedContactUpdate update) async {
    final response = await authClient.put(config.uri("/related_contacts/"),
        body: jsonEncode(update.toJson()),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception(
          "Error updating related contact: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return RelatedContact.fromJson(json);
  }

  /// Merge two related contacts
  Future<void> mergeRelatedContacts(
      int fromRelatedContactId, int toRelatedContactId) async {
    final response =
        await authClient.post(config.uri("/related_contacts/merge"),
            body: jsonEncode({
              "from_related_contact_id": fromRelatedContactId,
              "to_related_contact_id": toRelatedContactId,
            }),
            headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception(
          "Error merging related contacts: ${response.statusCode} - ${response.body}");
    }
  }
}
