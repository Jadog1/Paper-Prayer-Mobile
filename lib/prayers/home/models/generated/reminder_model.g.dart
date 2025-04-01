// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderImpl _$$ReminderImplFromJson(Map<String, dynamic> json) =>
    _$ReminderImpl(
      reminderLabel: json['reminder_label'] as String,
      group: Group.fromJson(json['group'] as Map<String, dynamic>),
      prayerCollection: Collection.fromJson(
          json['prayer_collection'] as Map<String, dynamic>),
      defaultSnoozeDays: (json['default_snooze_days'] as num).toInt(),
      isSnoozed: json['is_snoozed'] as bool,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      snoozeUntil: json['snooze_until'] == null
          ? null
          : DateTime.parse(json['snooze_until'] as String),
    );

Map<String, dynamic> _$$ReminderImplToJson(_$ReminderImpl instance) =>
    <String, dynamic>{
      'reminder_label': instance.reminderLabel,
      'group': instance.group,
      'prayer_collection': instance.prayerCollection,
      'default_snooze_days': instance.defaultSnoozeDays,
      'is_snoozed': instance.isSnoozed,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'snooze_until': instance.snoozeUntil?.toIso8601String(),
    };
