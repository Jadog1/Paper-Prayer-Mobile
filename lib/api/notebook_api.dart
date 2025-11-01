
import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/prayers/groups/models/notebook_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:prayer_ml/prayers/groups/models/shared.dart';
import 'dart:convert';

class NotebookApiClient {
  final FirebaseAuthHttpClient authClient;
  final String baseUrl;

  NotebookApiClient({required this.authClient, required this.baseUrl});

  Future<PaginatedPrayerRequests> fetchNotebookRequestsAt(CursorPagination pagination, int? groupId, int? contactId, {int? eventId, int? collectionId, int? relatedContactId}) async {
    var input = {
      "limit": pagination.limit.toString(),
      "cursor": pagination.cursor?.toString(),
    };
    if (groupId != null) {
      input["group_id"] = groupId.toString();
    }
    if (contactId != null) {
      input["contact_id"] = contactId.toString();
    }
    if (eventId != null) {
      input["event_id"] = eventId.toString();
    }
    if (collectionId != null) {
      input["collection_id"] = collectionId.toString();
    }
    if (relatedContactId != null) {
      input["related_contact_id"] = relatedContactId.toString();
    }
    final response = await authClient.get(config.uri("/notebook/", input));

    if (response.statusCode != 200) {
      throw Exception("Error getting notebook: ${response.statusCode} - ${response.body}");
    }

    return PaginatedPrayerRequests.fromJson(jsonDecode(response.body));
  }

  Future<PaginatedCollections> fetchNotebookCollectionsAt(CursorPagination pagination, int groupId) async {
    final response = await authClient.get(config.uri("/notebook/collections",
        {
          "limit": pagination.limit.toString(),
          "cursor": pagination.cursor?.toString(),
          "group_id": groupId.toString(),
        }));

    if (response.statusCode != 200) {
      throw Exception("Error getting notebook: ${response.statusCode} - ${response.body}");
    }

    return PaginatedCollections.fromJson(jsonDecode(response.body));
  }
}