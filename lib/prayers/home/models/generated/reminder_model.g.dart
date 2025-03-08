// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderGroupsImpl _$$ReminderGroupsImplFromJson(Map<String, dynamic> json) =>
    _$ReminderGroupsImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      count: (json['count'] as num).toInt(),
      type: json['type'] as String,
      maxCreatedAt: json['max_created_at'] as String,
    );

Map<String, dynamic> _$$ReminderGroupsImplToJson(
        _$ReminderGroupsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
      'type': instance.type,
      'max_created_at': instance.maxCreatedAt,
    };

_$RemindersForGroupImpl _$$RemindersForGroupImplFromJson(
        Map<String, dynamic> json) =>
    _$RemindersForGroupImpl(
      reminders: (json['reminders'] as List<dynamic>)
          .map((e) => PrayerRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      group: ReminderGroups.fromJson(json['group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RemindersForGroupImplToJson(
        _$RemindersForGroupImpl instance) =>
    <String, dynamic>{
      'reminders': instance.reminders,
      'group': instance.group,
    };
