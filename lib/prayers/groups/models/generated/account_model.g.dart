// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      monthlySpendLimit: (json['monthly_spend_limit'] as num?)?.toDouble(),
      userCode: json['user_code'] as String?,
      firebaseId: json['firebase_id'] as String?,
      isActive: json['is_active'] as bool?,
      isSuperuser: json['is_superuser'] as bool?,
      isVerified: json['is_verified'] as bool?,
      betaUser: json['beta_user'] as bool?,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'monthly_spend_limit': instance.monthlySpendLimit,
      'user_code': instance.userCode,
      'firebase_id': instance.firebaseId,
      'is_active': instance.isActive,
      'is_superuser': instance.isSuperuser,
      'is_verified': instance.isVerified,
      'beta_user': instance.betaUser,
    };

_$AccountUpdateRequestImpl _$$AccountUpdateRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountUpdateRequestImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$AccountUpdateRequestImplToJson(
        _$AccountUpdateRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
