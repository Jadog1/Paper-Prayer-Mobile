import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'contact_model.dart';

part 'generated/request_model.freezed.dart';
part 'generated/request_model.g.dart';

// TODO: Consider using dart_mappable: https://pub.dev/packages/dart_mappable

@unfreezed
class PrayerRequest with _$PrayerRequest {
  factory PrayerRequest({
    required int id,
    @JsonKey(name: 'request') required String description,
    @JsonKey(name: 'contact') required Contact user,
    @JsonKey(name: 'contact_group') required ContactGroupPairs group,
    PrayerFeatures? features,
    @Default("") @JsonKey(name: 'created_at') final String createdAt,
    @JsonKey(name: 'related_contact_ids') required final List<int> relatedContactIds,
  }) = _PrayerRequest;

  factory PrayerRequest.fromJson(Map<String, dynamic> json) => _$PrayerRequestFromJson(json);
}

// TODO: Should this be deprecated?
@freezed
class PrayerRequestScore with _$PrayerRequestScore {
  const factory PrayerRequestScore({
    required int id,
    required String request,
    @JsonKey(name: 'contact') required Contact user,
    @JsonKey(name: 'contact_group') required ContactGroupPairs group,
    PrayerFeatures? features,
    required double score,
    @Default("") @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'related_contact_ids') required List<int> relatedContactIds,
  }) = _PrayerRequestScore;

  factory PrayerRequestScore.fromJson(Map<String, dynamic> json) => _$PrayerRequestScoreFromJson(json);
}

@freezed
class PrayerFeatures with _$PrayerFeatures {
  const factory PrayerFeatures({
    String? sentiment,
    String? emotion,
    String? prayerType,
    required String title,
  }) = _PrayerFeatures;

  factory PrayerFeatures.fromJson(Map<String, dynamic> json) => _$PrayerFeaturesFromJson(json);
}

// Map PrayerRequestScore to PrayerRequest
PrayerRequest prayerRequestScoreToPrayerRequest(PrayerRequestScore score) {
  return PrayerRequest(
    id: score.id,
    description: score.request,
    user: score.user,
    group: score.group,
    features: score.features,
    createdAt: score.createdAt,
    relatedContactIds: score.relatedContactIds,
  );
}

PrayerRequest defaultPrayerRequest(Contact contact, ContactGroupPairs group) {
  return PrayerRequest(
    id: 0,
    description: "",
    user: contact,
    group: group,
    createdAt: DateTime.now().toIso8601String(),
    relatedContactIds: [],
  );
}


@freezed
class BibleReference with _$BibleReference {
  const factory BibleReference({
    @JsonKey(name: 'book_of_the_bible') required String bookOfTheBible,
    required int chapter,
    @JsonKey(name: 'verse_start') required int verseStart,
    @JsonKey(name: 'verse_end') required int verseEnd,
  }) = _BibleReference;

  factory BibleReference.fromJson(Map<String, dynamic> json) => _$BibleReferenceFromJson(json);
}

@freezed
class RelatedBibleVerse with _$RelatedBibleVerse {
  const factory RelatedBibleVerse({
    required BibleReference reference,
    required String reasonForRecommendation,
    required String referenceType,
  }) = _RelatedBibleVerse;

  factory RelatedBibleVerse.fromJson(Map<String, dynamic> json) => _$RelatedBibleVerseFromJson(json);
}

@freezed
class BibleReferenceAndText with _$BibleReferenceAndText {
  const factory BibleReferenceAndText({
    required RelatedBibleVerse modelOutput,
    required String text,
  }) = _BibleReferenceAndText;

  factory BibleReferenceAndText.fromJson(Map<String, dynamic> json) => _$BibleReferenceAndTextFromJson(json);
}