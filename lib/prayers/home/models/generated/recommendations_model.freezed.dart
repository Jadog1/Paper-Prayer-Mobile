// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../recommendations_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) {
  return _Recommendation.fromJson(json);
}

/// @nodoc
mixin _$Recommendation {
  @JsonKey(name: "recommendation_type")
  String get recommendationType => throw _privateConstructorUsedError;
  Group get group => throw _privateConstructorUsedError;
  @JsonKey(name: "prayer_collection")
  Collection get prayerCollection => throw _privateConstructorUsedError;
  @JsonKey(name: "default_snooze_days")
  int get defaultSnoozeDays => throw _privateConstructorUsedError;
  @JsonKey(name: "is_snoozed")
  bool get isSnoozed => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "snooze_until")
  DateTime? get snoozeUntil => throw _privateConstructorUsedError;

  /// Serializes this Recommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendationCopyWith<Recommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationCopyWith<$Res> {
  factory $RecommendationCopyWith(
          Recommendation value, $Res Function(Recommendation) then) =
      _$RecommendationCopyWithImpl<$Res, Recommendation>;
  @useResult
  $Res call(
      {@JsonKey(name: "recommendation_type") String recommendationType,
      Group group,
      @JsonKey(name: "prayer_collection") Collection prayerCollection,
      @JsonKey(name: "default_snooze_days") int defaultSnoozeDays,
      @JsonKey(name: "is_snoozed") bool isSnoozed,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "snooze_until") DateTime? snoozeUntil});

  $GroupCopyWith<$Res> get group;
  $CollectionCopyWith<$Res> get prayerCollection;
}

/// @nodoc
class _$RecommendationCopyWithImpl<$Res, $Val extends Recommendation>
    implements $RecommendationCopyWith<$Res> {
  _$RecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendationType = null,
    Object? group = null,
    Object? prayerCollection = null,
    Object? defaultSnoozeDays = null,
    Object? isSnoozed = null,
    Object? updatedAt = freezed,
    Object? snoozeUntil = freezed,
  }) {
    return _then(_value.copyWith(
      recommendationType: null == recommendationType
          ? _value.recommendationType
          : recommendationType // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      prayerCollection: null == prayerCollection
          ? _value.prayerCollection
          : prayerCollection // ignore: cast_nullable_to_non_nullable
              as Collection,
      defaultSnoozeDays: null == defaultSnoozeDays
          ? _value.defaultSnoozeDays
          : defaultSnoozeDays // ignore: cast_nullable_to_non_nullable
              as int,
      isSnoozed: null == isSnoozed
          ? _value.isSnoozed
          : isSnoozed // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      snoozeUntil: freezed == snoozeUntil
          ? _value.snoozeUntil
          : snoozeUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res> get group {
    return $GroupCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CollectionCopyWith<$Res> get prayerCollection {
    return $CollectionCopyWith<$Res>(_value.prayerCollection, (value) {
      return _then(_value.copyWith(prayerCollection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecommendationImplCopyWith<$Res>
    implements $RecommendationCopyWith<$Res> {
  factory _$$RecommendationImplCopyWith(_$RecommendationImpl value,
          $Res Function(_$RecommendationImpl) then) =
      __$$RecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "recommendation_type") String recommendationType,
      Group group,
      @JsonKey(name: "prayer_collection") Collection prayerCollection,
      @JsonKey(name: "default_snooze_days") int defaultSnoozeDays,
      @JsonKey(name: "is_snoozed") bool isSnoozed,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "snooze_until") DateTime? snoozeUntil});

  @override
  $GroupCopyWith<$Res> get group;
  @override
  $CollectionCopyWith<$Res> get prayerCollection;
}

/// @nodoc
class __$$RecommendationImplCopyWithImpl<$Res>
    extends _$RecommendationCopyWithImpl<$Res, _$RecommendationImpl>
    implements _$$RecommendationImplCopyWith<$Res> {
  __$$RecommendationImplCopyWithImpl(
      _$RecommendationImpl _value, $Res Function(_$RecommendationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendationType = null,
    Object? group = null,
    Object? prayerCollection = null,
    Object? defaultSnoozeDays = null,
    Object? isSnoozed = null,
    Object? updatedAt = freezed,
    Object? snoozeUntil = freezed,
  }) {
    return _then(_$RecommendationImpl(
      recommendationType: null == recommendationType
          ? _value.recommendationType
          : recommendationType // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      prayerCollection: null == prayerCollection
          ? _value.prayerCollection
          : prayerCollection // ignore: cast_nullable_to_non_nullable
              as Collection,
      defaultSnoozeDays: null == defaultSnoozeDays
          ? _value.defaultSnoozeDays
          : defaultSnoozeDays // ignore: cast_nullable_to_non_nullable
              as int,
      isSnoozed: null == isSnoozed
          ? _value.isSnoozed
          : isSnoozed // ignore: cast_nullable_to_non_nullable
              as bool,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      snoozeUntil: freezed == snoozeUntil
          ? _value.snoozeUntil
          : snoozeUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationImpl
    with DiagnosticableTreeMixin
    implements _Recommendation {
  const _$RecommendationImpl(
      {@JsonKey(name: "recommendation_type") required this.recommendationType,
      required this.group,
      @JsonKey(name: "prayer_collection") required this.prayerCollection,
      @JsonKey(name: "default_snooze_days") required this.defaultSnoozeDays,
      @JsonKey(name: "is_snoozed") required this.isSnoozed,
      @JsonKey(name: "updated_at") this.updatedAt,
      @JsonKey(name: "snooze_until") this.snoozeUntil});

  factory _$RecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationImplFromJson(json);

  @override
  @JsonKey(name: "recommendation_type")
  final String recommendationType;
  @override
  final Group group;
  @override
  @JsonKey(name: "prayer_collection")
  final Collection prayerCollection;
  @override
  @JsonKey(name: "default_snooze_days")
  final int defaultSnoozeDays;
  @override
  @JsonKey(name: "is_snoozed")
  final bool isSnoozed;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "snooze_until")
  final DateTime? snoozeUntil;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Recommendation(recommendationType: $recommendationType, group: $group, prayerCollection: $prayerCollection, defaultSnoozeDays: $defaultSnoozeDays, isSnoozed: $isSnoozed, updatedAt: $updatedAt, snoozeUntil: $snoozeUntil)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Recommendation'))
      ..add(DiagnosticsProperty('recommendationType', recommendationType))
      ..add(DiagnosticsProperty('group', group))
      ..add(DiagnosticsProperty('prayerCollection', prayerCollection))
      ..add(DiagnosticsProperty('defaultSnoozeDays', defaultSnoozeDays))
      ..add(DiagnosticsProperty('isSnoozed', isSnoozed))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('snoozeUntil', snoozeUntil));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationImpl &&
            (identical(other.recommendationType, recommendationType) ||
                other.recommendationType == recommendationType) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.prayerCollection, prayerCollection) ||
                other.prayerCollection == prayerCollection) &&
            (identical(other.defaultSnoozeDays, defaultSnoozeDays) ||
                other.defaultSnoozeDays == defaultSnoozeDays) &&
            (identical(other.isSnoozed, isSnoozed) ||
                other.isSnoozed == isSnoozed) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.snoozeUntil, snoozeUntil) ||
                other.snoozeUntil == snoozeUntil));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, recommendationType, group,
      prayerCollection, defaultSnoozeDays, isSnoozed, updatedAt, snoozeUntil);

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationImplCopyWith<_$RecommendationImpl> get copyWith =>
      __$$RecommendationImplCopyWithImpl<_$RecommendationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationImplToJson(
      this,
    );
  }
}

abstract class _Recommendation implements Recommendation {
  const factory _Recommendation(
          {@JsonKey(name: "recommendation_type")
          required final String recommendationType,
          required final Group group,
          @JsonKey(name: "prayer_collection")
          required final Collection prayerCollection,
          @JsonKey(name: "default_snooze_days")
          required final int defaultSnoozeDays,
          @JsonKey(name: "is_snoozed") required final bool isSnoozed,
          @JsonKey(name: "updated_at") final DateTime? updatedAt,
          @JsonKey(name: "snooze_until") final DateTime? snoozeUntil}) =
      _$RecommendationImpl;

  factory _Recommendation.fromJson(Map<String, dynamic> json) =
      _$RecommendationImpl.fromJson;

  @override
  @JsonKey(name: "recommendation_type")
  String get recommendationType;
  @override
  Group get group;
  @override
  @JsonKey(name: "prayer_collection")
  Collection get prayerCollection;
  @override
  @JsonKey(name: "default_snooze_days")
  int get defaultSnoozeDays;
  @override
  @JsonKey(name: "is_snoozed")
  bool get isSnoozed;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "snooze_until")
  DateTime? get snoozeUntil;

  /// Create a copy of Recommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendationImplCopyWith<_$RecommendationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
