import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'generated/contact_model.freezed.dart';
part 'generated/contact_model.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    required int id,
    required String name,
    @Default('') String description,
    @Default('') String createdAt,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}

@freezed
class ContactGroupPairs with _$ContactGroupPairs {
  const factory ContactGroupPairs({
    required int contactId,
    required int groupId,
    required String createdAt,
  }) = _ContactGroupPairs;

  factory ContactGroupPairs.fromJson(Map<String, dynamic> json) => _$ContactGroupPairsFromJson(json);
} 