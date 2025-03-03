import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/request_model.dart';

part 'generated/reminder_model.freezed.dart';
part 'generated/reminder_model.g.dart';

@freezed
class ReminderGroups with _$ReminderGroups {
  const factory ReminderGroups({
    required int id,
    required String name,
    required int count,
    required String type,
  }) = _ReminderGroups;

  factory ReminderGroups.fromJson(Map<String, dynamic> json) => _$ReminderGroupsFromJson(json);
}

@freezed
class RemindersForGroup with _$RemindersForGroup {
  const factory RemindersForGroup({
    required List<PrayerRequest> reminders,
    required ReminderGroups group,
  }) = _RemindersForGroup;

  factory RemindersForGroup.fromJson(Map<String, dynamic> json) => _$RemindersForGroupFromJson(json);
}