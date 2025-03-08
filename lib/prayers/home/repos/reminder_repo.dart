import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_ml/prayers/home/models/reminder_model.dart';
import 'package:prayer_ml/shared/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/reminder_repo.g.dart';

@riverpod
Future<List<RemindersForGroup>> fetchRemindersForGroup(Ref ref, int groupId) async {
  config = Config();
  var reminderApi = config.reminderApiClient;
  return await reminderApi.getRemindersForGroup(groupId, "prayer");
}

@riverpod
Future<List<ReminderGroups>> fetchReminderGroups(Ref ref) async {
  config = Config();
  var reminderApi = config.reminderApiClient;
  return await reminderApi.getReminderGroups();
}