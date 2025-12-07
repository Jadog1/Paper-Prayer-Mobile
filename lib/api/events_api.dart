import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/prayers/home/models/events_model.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'dart:convert';

import 'package:prayer_ml/shared/config.dart';

class EventsApiClient {
  final FirebaseAuthHttpClient authClient;
  final String baseUrl;

  EventsApiClient({required this.authClient, required this.baseUrl});

  /// Get all events via cursor pagination with date range
  /// Endpoint: GET /events/paginated?start_date=2025-10-01T00:00:00&end_date=2025-12-31T23:59:59&cursor=cursor&limit=50
  Future<PaginatedEvents> getEventsPaginated({
    required String startDate,
    required String endDate,
    String? cursor,
    int limit = 50,
    int? contactId,
    int? collectionId,
  }) async {
    final queryParams = {
      'start_date': startDate,
      'end_date': endDate,
      'limit': limit.toString(),
      if (cursor != null) 'cursor': cursor,
      if (contactId != null) 'contact_id': contactId.toString(),
      if (collectionId != null) 'collection_id': collectionId.toString(),
    };

    final response = await authClient.get(
      config.uri("/collections/events/paginated", queryParams),
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting paginated events: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return PaginatedEvents.fromJson(json);
  }

  /// Get X future events within max X days
  /// Endpoint: GET /events/future?limit=10&max_days=30
  Future<List<PrayerCollectionEvent>> getFutureEvents({
    int limit = 10,
    int maxDays = 30,
    int? contactId,
    int? collectionId,
  }) async {
    final queryParams = {
      'limit': limit.toString(),
      'max_days': maxDays.toString(),
    };
    if (contactId != null) {
      queryParams['contact_id'] = contactId.toString();
    }
    if (collectionId != null) {
      queryParams['collection_id'] = collectionId.toString();
    }

    final response = await authClient.get(
      config.uri("/collections/events/future", queryParams),
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting future events: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    return json.map((event) => PrayerCollectionEvent.fromJson(event)).toList();
  }

  /// Get the collection associated with a specific event
  /// Endpoint: GET /events/{event_id}/collection
  Future<Collection> getCollectionForEvent(int eventId) async {
    final response = await authClient.get(
      config.uri("/collections/events/$eventId/collection"),
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting collection for event: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    return Collection.fromJson(json);
  }

  /// Delete an event
  /// Endpoint: DELETE /events/{event_id}
  Future<void> deleteEvent(int eventId) async {
    final response = await authClient.delete(
      config.uri("/collections/events/$eventId"),
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error deleting event: ${response.statusCode} - ${response.body}");
    }
  }
}
