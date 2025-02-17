import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:prayer_ml/prayers/groups/models/contact_model.dart';

part 'generated/collection_model.freezed.dart';
part 'generated/collection_model.g.dart';

@freezed
class Collection with _$Collection {
  const factory Collection({
    required int id,
    @Default("") String? title,
    @JsonKey(name: 'summary') @Default("") String? description,
    @JsonKey(name: 'related_contact_ids') @Default([]) List<int> relatedContactIds,
    @JsonKey(name: 'contact') required Contact user,
    @JsonKey(name: 'contact_group') required ContactGroupPairs group,
    @Default("") @JsonKey(name: 'created_at') String createdAt,
    double? score,
  }) = _Collection;

  factory Collection.fromJson(Map<String, dynamic> json) => _$CollectionFromJson(json);
}