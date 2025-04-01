import 'package:prayer_ml/api/firebase_auth_client.dart';
import 'package:prayer_ml/prayers/home/models/reminder_model.dart';
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

  Future<List<ReminderGroups>> getRecommendationGroups() async {
    final response = await authClient.get(config.uri("/recommendations/groups"));

    if (response.statusCode != 200) {
      throw Exception("Error getting reminder groups: ${response.statusCode} - ${response.body}");
    }
    
    final json = jsonDecode(response.body) as List;
    final nestedJson = json[0] as List;
    return nestedJson.map((group) => ReminderGroups.fromJson(group)).toList();
  }

  Future<List<RemindersForGroup>> getRecommendationsForGroup(int groupId, String type) async {
    final response = await authClient.post(config.uri("/recommendations/group"), 
      body: jsonEncode({"group_id": groupId, "type": type}), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error getting reminders for group: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((group) => RemindersForGroup.fromJson(group)).toList();
  }

  Future<List<Reminder>> getRecommendations() async {
    final response = await authClient.get(config.uri("/recommendations/"));

    if (response.statusCode != 200) {
      throw Exception("Error getting reminder recommendations: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((group) => Reminder.fromJson(group)).toList();
  }

  Future<void> updateAction(int collectionId, CollectionRecommendationAction action, String snoozeUntil) async {
    final response = await authClient.post(config.uri("/recommendations/action"), 
      body: jsonEncode({"collection_id": collectionId, "action": actionToServerString(action), "snooze_until": snoozeUntil}), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error updating action: ${response.statusCode} - ${response.body}");
    }
  }

}