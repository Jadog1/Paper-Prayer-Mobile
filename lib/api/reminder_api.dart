import 'package:http/http.dart' as http;
import 'package:prayer_ml/prayers/home/models/reminder_model.dart';
import 'dart:convert';

import 'package:prayer_ml/shared/config.dart';

class ReminderApiClient{
  final http.Client httpClient;
  final String baseUrl;

  ReminderApiClient({required this.httpClient, required this.baseUrl});

  Future<List<ReminderGroups>> getReminderGroups() async {
    final response = await httpClient.get(config.uri("/reminders/groups"));

    if (response.statusCode != 200) {
      throw Exception("Error getting reminder groups: ${response.statusCode} - ${response.body}");
    }
    
    final json = jsonDecode(response.body) as List;
    final nestedJson = json[0] as List;
    return nestedJson.map((group) => ReminderGroups.fromJson(group)).toList();
  }

  Future<List<RemindersForGroup>> getRemindersForGroup(int groupId, String type) async {
    final response = await httpClient.post(config.uri("/reminders/group"), 
      body: jsonEncode({"group_id": groupId, "type": type}), headers: {"Content-Type": "application/json"});

    if (response.statusCode != 200) {
      throw Exception("Error getting reminders for group: ${response.statusCode} - ${response.body}");
    }

    final json = jsonDecode(response.body) as List;
    return json.map((group) => RemindersForGroup.fromJson(group)).toList();
  }

}