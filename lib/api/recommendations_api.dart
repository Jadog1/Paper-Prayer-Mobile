import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/prayers/groups/models/shared.dart';
import 'package:prayer_ml/prayers/home/models/recommendations_model.dart';
import 'dart:convert';

import 'package:prayer_ml/shared/config.dart';

enum CollectionRecommendationAction {
  prayed, notRelevant
}

String actionToServerString(CollectionRecommendationAction action) {
  switch (action) {
    case CollectionRecommendationAction.prayed:
      return "Prayed";
    case CollectionRecommendationAction.notRelevant:
      return "Not relevant";
  }
}

class RecommendationApiClient{
  final FirebaseAuthHttpClient authClient;
  final String baseUrl;

  RecommendationApiClient({required this.authClient, required this.baseUrl});

  Future<List<RecommendationGroup>> getRecommendationGroups() async {
    final response = await authClient.get(config.uri("/recommendation_groups/"));

    if (response.statusCode != 200) {
      throw Exception("Error getting recommendations: ${response.statusCode} - ${response.body}");
    }
    
    final List<dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((group) => RecommendationGroup.fromJson(group)).toList();
  }

  Future<void> updateAction(int collectionId, CollectionRecommendationAction action, String snoozeUntil) async {
    final response = await authClient.post(config.uri("/recommendation_groups/recommendations/action"), 
      body: jsonEncode({"collection_id": collectionId, "action": actionToServerString(action), "snooze_until": snoozeUntil}), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error updating action: ${response.statusCode} - ${response.body}");
    }
  }

  Future<PaginatedCollectionRecommendation> fetchRecommendationsForGroupType(RecommendationGroup recommendationGroup, CursorPagination pagination) async {
    Map<String, dynamic> queryParams = {
      "group_type": recommendationGroup.groupType,
      "limit": pagination.limit.toString(),
    };
    if (recommendationGroup.id != null) {
      queryParams["id"] = recommendationGroup.id.toString();
    }
    if (pagination.cursor != null) {
      queryParams["cursor"] = pagination.cursor.toString();
    }
    final response = await authClient.get(config.uri("/recommendation_groups/recommendations", queryParams));

    if (response.statusCode != 200) {
      throw Exception("Error getting recommendations: ${response.statusCode} - ${response.body}");
    }

    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    return PaginatedCollectionRecommendation.fromJson(jsonResponse);
  }

}