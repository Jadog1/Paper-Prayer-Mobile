import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/collection_model.dart';
import 'package:prayer_ml/prayers/groups/models/group_model.dart';
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
    @JsonKey(name: "max_created_at") required String maxCreatedAt,
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

@freezed
class Reminder with _$Reminder {
  const factory Reminder({
    @JsonKey(name: "reminder_label") required String reminderLabel,
    required Group group,
    @JsonKey(name: "prayer_collection") required Collection prayerCollection,
    @JsonKey(name: "default_snooze_days") required int defaultSnoozeDays,
    @JsonKey(name: "is_snoozed") required bool isSnoozed,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "snooze_until") DateTime? snoozeUntil,
  }) = _Reminder;

  factory Reminder.fromJson(Map<String, dynamic> json) => _$ReminderFromJson(json);
}