import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'generated/account_model.freezed.dart';
part 'generated/account_model.g.dart';

@freezed
class Account with _$Account {
  const factory Account({
    required int id,
    String? name,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'monthly_spend_limit') double? monthlySpendLimit,
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
