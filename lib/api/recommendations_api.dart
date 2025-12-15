import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';
import 'package:prayer_ml/prayers/groups/models/shared.dart';
import 'package:prayer_ml/prayers/home/models/recommendations_model.dart';
import 'dart:convert';

import 'package:prayer_ml/shared/config.dart';

enum CollectionRecommendationAction {
  prayed,
  notRelevant,
  resolved,
}

String actionToServerString(CollectionRecommendationAction action) {
  switch (action) {
    case CollectionRecommendationAction.prayed:
      return "Prayed";
    case CollectionRecommendationAction.notRelevant:
      return "Not relevant";
    case CollectionRecommendationAction.resolved:
      return "Resolved";
  }
}

class RecommendationApiClient {
  final FirebaseAuthHttpClient authClient;
  final String baseUrl;

  RecommendationApiClient({required this.authClient, required this.baseUrl});

  Future<List<RecommendationGroup>> getRecommendationGroups() async {
    Map<String, dynamic> queryParams = {
      "client_date": DateTime.now().toIso8601String().split('T')[0],
    };
    final response = await authClient
        .get(config.uri("/recommendation_groups/", queryParams));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting recommendations: ${response.statusCode} - ${response.body}");
    }

    final List<dynamic> jsonResponse =
        jsonDecode(utf8.decode(response.bodyBytes));
    return jsonResponse
        .map((group) => RecommendationGroup.fromJson(group))
        .toList();
  }

  Future<void> updateAction(
      int collectionId, CollectionRecommendationAction action,
      {String? snoozeUntil}) async {
    final body = {
      "collection_id": collectionId,
      "action": actionToServerString(action),
    };

    if (snoozeUntil != null) {
      body["snooze_until"] = snoozeUntil;
    }

    final response = await authClient.post(
      config.uri("/recommendation_groups/recommendations/action"),
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception(
          "Error updating action: ${response.statusCode} - ${response.body}");
    }
  }

  Future<PaginatedCollectionRecommendation> fetchRecommendationsForGroupType(
      RecommendationGroup recommendationGroup,
      CursorPagination pagination) async {
    Map<String, dynamic> queryParams = {
      "group_type": recommendationGroup.groupType,
      "limit": pagination.limit.toString(),
      // Date only
      "client_date": DateTime.now().toIso8601String().split('T')[0],
    };
    if (recommendationGroup.id != null) {
      queryParams["id"] = recommendationGroup.id.toString();
    }
    if (pagination.cursor != null) {
      queryParams["cursor"] = pagination.cursor.toString();
    }
    final response = await authClient
        .get(config.uri("/recommendation_groups/recommendations", queryParams));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting recommendations: ${response.statusCode} - ${response.body}");
    }

    final Map<String, dynamic> jsonResponse =
        jsonDecode(utf8.decode(response.bodyBytes));
    return PaginatedCollectionRecommendation.fromJson(jsonResponse);
  }

  Future<PaginatedUnresolvedFollowups> getUnresolvedFollowups(
      CursorPagination pagination,
      {int lookbackDays = 30}) async {
    Map<String, dynamic> queryParams = {
      "lookback_days": lookbackDays.toString(),
      "limit": pagination.limit.toString(),
    };
    if (pagination.cursor != null) {
      queryParams["cursor"] = pagination.cursor.toString();
    }
    final response = await authClient.get(config.uri(
        "/recommendation_groups/recommendations/unresolved-followups",
        queryParams));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting unresolved followups: ${response.statusCode} - ${response.body}");
    }

    final Map<String, dynamic> jsonResponse =
        jsonDecode(utf8.decode(response.bodyBytes));
    return PaginatedUnresolvedFollowups.fromJson(jsonResponse);
  }

  Future<PaginatedHistoricalCollectionRecommendation> getRecommendationHistory(
      CursorPagination pagination) async {
    Map<String, dynamic> queryParams = {
      "limit": pagination.limit.toString(),
    };
    if (pagination.cursor != null) {
      queryParams["cursor"] = pagination.cursor.toString();
    }
    final response = await authClient.get(config.uri(
        "/recommendation_groups/recommendations/history", queryParams));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting recommendation history: ${response.statusCode} - ${response.body}");
    }

    final Map<String, dynamic> jsonResponse =
        jsonDecode(utf8.decode(response.bodyBytes));
    return PaginatedHistoricalCollectionRecommendation.fromJson(jsonResponse);
  }

  Future<List<PrayerRequest>> getRecentPrayerRequests(int collectionId,
      {int n = 10}) async {
    Map<String, dynamic> queryParams = {
      "n": n.toString(),
    };
    final response = await authClient.get(
        config.uri("/collections/requests/recent/$collectionId", queryParams));

    if (response.statusCode != 200) {
      throw Exception(
          "Error getting recent prayer requests: ${response.statusCode} - ${response.body}");
    }

    final List<dynamic> jsonResponse =
        jsonDecode(utf8.decode(response.bodyBytes));
    return jsonResponse
        .map((request) => PrayerRequest.fromJson(request))
        .toList();
  }
}
