// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrayerRequestImpl _$$PrayerRequestImplFromJson(Map<String, dynamic> json) =>
    _$PrayerRequestImpl(
      id: (json['id'] as num).toInt(),
      request: json['request'] as String,
      user: Contact.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PrayerRequestImplToJson(_$PrayerRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request': instance.request,
      'user': instance.user,
    };
