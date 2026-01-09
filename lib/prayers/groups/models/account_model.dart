import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'generated/account_model.freezed.dart';
part 'generated/account_model.g.dart';

/*

        user_code=account_orm.user_code,
        firebase_id=account_orm.firebase_id,
        is_active=account_orm.is_active,
        is_superuser=account_orm.is_superuser,
        is_verified=account_orm.is_verified,
        beta_user=account_orm.beta_user
*/

@freezed
class Account with _$Account {
  const factory Account({
    required int id,
    String? name,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'monthly_spend_limit') double? monthlySpendLimit,
    @JsonKey(name: 'user_code') String? userCode,
    @JsonKey(name: 'firebase_id') String? firebaseId,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'is_superuser') bool? isSuperuser,
    @JsonKey(name: 'is_verified') bool? isVerified,
    @JsonKey(name: 'beta_user') bool? betaUser,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

@freezed
class AccountUpdateRequest with _$AccountUpdateRequest {
  const factory AccountUpdateRequest({
    required int id,
    String? name,
  }) = _AccountUpdateRequest;

  factory AccountUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountUpdateRequestFromJson(json);
}
