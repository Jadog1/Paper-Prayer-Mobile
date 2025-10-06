// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrayerRequestImpl _$$PrayerRequestImplFromJson(Map<String, dynamic> json) =>
    _$PrayerRequestImpl(
      id: (json['id'] as num).toInt(),
      description: json['request'] as String,
      user: Contact.fromJson(json['contact'] as Map<String, dynamic>),
      group: ContactGroupPairs.fromJson(
          json['contact_group'] as Map<String, dynamic>),
      features: json['features'] == null
          ? null
          : PrayerFeatures.fromJson(json['features'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String? ?? "",
      relatedContactIds: (json['related_contact_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$PrayerRequestImplToJson(_$PrayerRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request': instance.description,
      'contact': instance.user,
      'contact_group': instance.group,
      'features': instance.features,
      'created_at': instance.createdAt,
      'related_contact_ids': instance.relatedContactIds,
    };

_$PrayerRequestScoreImpl _$$PrayerRequestScoreImplFromJson(
        Map<String, dynamic> json) =>
    _$PrayerRequestScoreImpl(
      id: (json['id'] as num).toInt(),
      request: json['request'] as String,
      user: Contact.fromJson(json['contact'] as Map<String, dynamic>),
      group: ContactGroupPairs.fromJson(
          json['contact_group'] as Map<String, dynamic>),
      features: json['features'] == null
          ? null
          : PrayerFeatures.fromJson(json['features'] as Map<String, dynamic>),
      score: (json['score'] as num).toDouble(),
      createdAt: json['created_at'] as String? ?? "",
      relatedContactIds: (json['related_contact_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$PrayerRequestScoreImplToJson(
        _$PrayerRequestScoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request': instance.request,
      'contact': instance.user,
      'contact_group': instance.group,
      'features': instance.features,
      'score': instance.score,
      'created_at': instance.createdAt,
      'related_contact_ids': instance.relatedContactIds,
    };

_$PrayerFeaturesImpl _$$PrayerFeaturesImplFromJson(Map<String, dynamic> json) =>
    _$PrayerFeaturesImpl(
      sentiment: json['sentiment'] as String?,
      emotion: json['emotion'] as String?,
      prayerType: json['prayerType'] as String?,
      title: json['title'] as String,
      highlight: json['highlight'] as String,
    );

Map<String, dynamic> _$$PrayerFeaturesImplToJson(
        _$PrayerFeaturesImpl instance) =>
    <String, dynamic>{
      'sentiment': instance.sentiment,
      'emotion': instance.emotion,
      'prayerType': instance.prayerType,
      'title': instance.title,
      'highlight': instance.highlight,
    };

_$BibleReferenceImpl _$$BibleReferenceImplFromJson(Map<String, dynamic> json) =>
    _$BibleReferenceImpl(
      bookOfTheBible: json['book_of_the_bible'] as String,
      chapter: (json['chapter'] as num).toInt(),
      verseStart: (json['verse_start'] as num).toInt(),
      verseEnd: (json['verse_end'] as num).toInt(),
    );

Map<String, dynamic> _$$BibleReferenceImplToJson(
        _$BibleReferenceImpl instance) =>
    <String, dynamic>{
      'book_of_the_bible': instance.bookOfTheBible,
      'chapter': instance.chapter,
      'verse_start': instance.verseStart,
      'verse_end': instance.verseEnd,
    };

_$RelatedBibleVerseImpl _$$RelatedBibleVerseImplFromJson(
        Map<String, dynamic> json) =>
    _$RelatedBibleVerseImpl(
      reference:
          BibleReference.fromJson(json['reference'] as Map<String, dynamic>),
      reasonForRecommendation: json['reasonForRecommendation'] as String,
      referenceType: json['referenceType'] as String,
    );

Map<String, dynamic> _$$RelatedBibleVerseImplToJson(
        _$RelatedBibleVerseImpl instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'reasonForRecommendation': instance.reasonForRecommendation,
      'referenceType': instance.referenceType,
    };

_$BibleReferenceAndTextImpl _$$BibleReferenceAndTextImplFromJson(
        Map<String, dynamic> json) =>
    _$BibleReferenceAndTextImpl(
      modelOutput: RelatedBibleVerse.fromJson(
          json['modelOutput'] as Map<String, dynamic>),
      text: json['text'] as String,
    );

Map<String, dynamic> _$$BibleReferenceAndTextImplToJson(
        _$BibleReferenceAndTextImpl instance) =>
    <String, dynamic>{
      'modelOutput': instance.modelOutput,
      'text': instance.text,
    };
