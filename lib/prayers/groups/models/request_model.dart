import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'contact_model.dart';

part 'generated/request_model.freezed.dart';
part 'generated/request_model.g.dart';

// TODO: Consider using dart_mappable: https://pub.dev/packages/dart_mappable

@freezed
class PrayerRequest with _$PrayerRequest {
  const factory PrayerRequest({
    required int id,
    required String request,
    String? title,
    @JsonKey(name: 'contact') required Contact user,
    @JsonKey(name: 'contact_group') required ContactGroupPairs group,
    @Default("") String? sentiment,
    @Default("") @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'related_contact_ids') required List<int> relatedContactIds,
  }) = _PrayerRequest;

  factory PrayerRequest.fromJson(Map<String, dynamic> json) => _$PrayerRequestFromJson(json);
}

@freezed
class PrayerRequestScore with _$PrayerRequestScore {
  const factory PrayerRequestScore({
    required int id,
    required String request,
    String? title,
    @JsonKey(name: 'contact') required Contact user,
    @JsonKey(name: 'contact_group') required ContactGroupPairs group,
    @Default("") String? sentiment,
    required double score,
    @Default("") @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'related_contact_ids') required List<int> relatedContactIds,
  }) = _PrayerRequestScore;

  factory PrayerRequestScore.fromJson(Map<String, dynamic> json) => _$PrayerRequestScoreFromJson(json);
}

// Map PrayerRequestScore to PrayerRequest
PrayerRequest prayerRequestScoreToPrayerRequest(PrayerRequestScore score) {
  return PrayerRequest(
    id: score.id,
    request: score.request,
    title: score.title,
    user: score.user,
    group: score.group,
    sentiment: score.sentiment,
    createdAt: score.createdAt,
    relatedContactIds: score.relatedContactIds,
  );
}