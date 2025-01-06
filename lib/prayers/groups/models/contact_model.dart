import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'generated/contact_model.freezed.dart';
part 'generated/contact_model.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    required int id,
    required String name,
    @JsonKey(defaultValue: '') String? description,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}

@freezed 
class ContactGroupPairs with _$ContactGroupPairs {
  const factory ContactGroupPairs({
    @Default(0) int? id,
    @JsonKey(name: 'contact_id') required int contactId,
    @JsonKey(name: 'group_id') required int groupId, 
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _ContactGroupPairs;

  factory ContactGroupPairs.fromJson(Map<String, dynamic> json) => _$ContactGroupPairsFromJson(json);
} 