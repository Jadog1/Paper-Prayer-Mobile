// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrayerRequest _$PrayerRequestFromJson(Map<String, dynamic> json) {
  return _PrayerRequest.fromJson(json);
}

/// @nodoc
mixin _$PrayerRequest {
  int get id => throw _privateConstructorUsedError;
  set id(int value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'request')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'request')
  set description(String value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact')
  Contact get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact')
  set user(Contact value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_group')
  ContactGroupPairs get group => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_group')
  set group(ContactGroupPairs value) => throw _privateConstructorUsedError;
  PrayerFeatures? get features => throw _privateConstructorUsedError;
  set features(PrayerFeatures? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'related_contact_ids')
  List<int> get relatedContactIds => throw _privateConstructorUsedError;

  /// Serializes this PrayerRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrayerRequestCopyWith<PrayerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerRequestCopyWith<$Res> {
  factory $PrayerRequestCopyWith(
          PrayerRequest value, $Res Function(PrayerRequest) then) =
      _$PrayerRequestCopyWithImpl<$Res, PrayerRequest>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'request') String description,
      @JsonKey(name: 'contact') Contact user,
      @JsonKey(name: 'contact_group') ContactGroupPairs group,
      PrayerFeatures? features,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'related_contact_ids') List<int> relatedContactIds});

  $ContactCopyWith<$Res> get user;
  $ContactGroupPairsCopyWith<$Res> get group;
  $PrayerFeaturesCopyWith<$Res>? get features;
}

/// @nodoc
class _$PrayerRequestCopyWithImpl<$Res, $Val extends PrayerRequest>
    implements $PrayerRequestCopyWith<$Res> {
  _$PrayerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? user = null,
    Object? group = null,
    Object? features = freezed,
    Object? createdAt = null,
    Object? relatedContactIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Contact,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ContactGroupPairs,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as PrayerFeatures?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      relatedContactIds: null == relatedContactIds
          ? _value.relatedContactIds
          : relatedContactIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }

  /// Create a copy of PrayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res> get user {
    return $ContactCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of PrayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactGroupPairsCopyWith<$Res> get group {
    return $ContactGroupPairsCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }

  /// Create a copy of PrayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrayerFeaturesCopyWith<$Res>? get features {
    if (_value.features == null) {
      return null;
    }

    return $PrayerFeaturesCopyWith<$Res>(_value.features!, (value) {
      return _then(_value.copyWith(features: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrayerRequestImplCopyWith<$Res>
    implements $PrayerRequestCopyWith<$Res> {
  factory _$$PrayerRequestImplCopyWith(
          _$PrayerRequestImpl value, $Res Function(_$PrayerRequestImpl) then) =
      __$$PrayerRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'request') String description,
      @JsonKey(name: 'contact') Contact user,
      @JsonKey(name: 'contact_group') ContactGroupPairs group,
      PrayerFeatures? features,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'related_contact_ids') List<int> relatedContactIds});

  @override
  $ContactCopyWith<$Res> get user;
  @override
  $ContactGroupPairsCopyWith<$Res> get group;
  @override
  $PrayerFeaturesCopyWith<$Res>? get features;
}

/// @nodoc
class __$$PrayerRequestImplCopyWithImpl<$Res>
    extends _$PrayerRequestCopyWithImpl<$Res, _$PrayerRequestImpl>
    implements _$$PrayerRequestImplCopyWith<$Res> {
  __$$PrayerRequestImplCopyWithImpl(
      _$PrayerRequestImpl _value, $Res Function(_$PrayerRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? user = null,
    Object? group = null,
    Object? features = freezed,
    Object? createdAt = null,
    Object? relatedContactIds = null,
  }) {
    return _then(_$PrayerRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Contact,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ContactGroupPairs,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as PrayerFeatures?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      relatedContactIds: null == relatedContactIds
          ? _value.relatedContactIds
          : relatedContactIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrayerRequestImpl
    with DiagnosticableTreeMixin
    implements _PrayerRequest {
  _$PrayerRequestImpl(
      {required this.id,
      @JsonKey(name: 'request') required this.description,
      @JsonKey(name: 'contact') required this.user,
      @JsonKey(name: 'contact_group') required this.group,
      this.features,
      @JsonKey(name: 'created_at') this.createdAt = "",
      @JsonKey(name: 'related_contact_ids') required this.relatedContactIds});

  factory _$PrayerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrayerRequestImplFromJson(json);

  @override
  int id;
  @override
  @JsonKey(name: 'request')
  String description;
  @override
  @JsonKey(name: 'contact')
  Contact user;
  @override
  @JsonKey(name: 'contact_group')
  ContactGroupPairs group;
  @override
  PrayerFeatures? features;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'related_contact_ids')
  final List<int> relatedContactIds;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerRequest(id: $id, description: $description, user: $user, group: $group, features: $features, createdAt: $createdAt, relatedContactIds: $relatedContactIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerRequest'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('group', group))
      ..add(DiagnosticsProperty('features', features))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('relatedContactIds', relatedContactIds));
  }

  /// Create a copy of PrayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrayerRequestImplCopyWith<_$PrayerRequestImpl> get copyWith =>
      __$$PrayerRequestImplCopyWithImpl<_$PrayerRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrayerRequestImplToJson(
      this,
    );
  }
}

abstract class _PrayerRequest implements PrayerRequest {
  factory _PrayerRequest(
      {required int id,
      @JsonKey(name: 'request') required String description,
      @JsonKey(name: 'contact') required Contact user,
      @JsonKey(name: 'contact_group') required ContactGroupPairs group,
      PrayerFeatures? features,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(name: 'related_contact_ids')
      required final List<int> relatedContactIds}) = _$PrayerRequestImpl;

  factory _PrayerRequest.fromJson(Map<String, dynamic> json) =
      _$PrayerRequestImpl.fromJson;

  @override
  int get id;
  set id(int value);
  @override
  @JsonKey(name: 'request')
  String get description;
  @JsonKey(name: 'request')
  set description(String value);
  @override
  @JsonKey(name: 'contact')
  Contact get user;
  @JsonKey(name: 'contact')
  set user(Contact value);
  @override
  @JsonKey(name: 'contact_group')
  ContactGroupPairs get group;
  @JsonKey(name: 'contact_group')
  set group(ContactGroupPairs value);
  @override
  PrayerFeatures? get features;
  set features(PrayerFeatures? value);
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'related_contact_ids')
  List<int> get relatedContactIds;

  /// Create a copy of PrayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerRequestImplCopyWith<_$PrayerRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrayerRequestScore _$PrayerRequestScoreFromJson(Map<String, dynamic> json) {
  return _PrayerRequestScore.fromJson(json);
}

/// @nodoc
mixin _$PrayerRequestScore {
  int get id => throw _privateConstructorUsedError;
  String get request => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact')
  Contact get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_group')
  ContactGroupPairs get group => throw _privateConstructorUsedError;
  PrayerFeatures? get features => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'related_contact_ids')
  List<int> get relatedContactIds => throw _privateConstructorUsedError;

  /// Serializes this PrayerRequestScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrayerRequestScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrayerRequestScoreCopyWith<PrayerRequestScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerRequestScoreCopyWith<$Res> {
  factory $PrayerRequestScoreCopyWith(
          PrayerRequestScore value, $Res Function(PrayerRequestScore) then) =
      _$PrayerRequestScoreCopyWithImpl<$Res, PrayerRequestScore>;
  @useResult
  $Res call(
      {int id,
      String request,
      @JsonKey(name: 'contact') Contact user,
      @JsonKey(name: 'contact_group') ContactGroupPairs group,
      PrayerFeatures? features,
      double score,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'related_contact_ids') List<int> relatedContactIds});

  $ContactCopyWith<$Res> get user;
  $ContactGroupPairsCopyWith<$Res> get group;
  $PrayerFeaturesCopyWith<$Res>? get features;
}

/// @nodoc
class _$PrayerRequestScoreCopyWithImpl<$Res, $Val extends PrayerRequestScore>
    implements $PrayerRequestScoreCopyWith<$Res> {
  _$PrayerRequestScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrayerRequestScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
    Object? user = null,
    Object? group = null,
    Object? features = freezed,
    Object? score = null,
    Object? createdAt = null,
    Object? relatedContactIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Contact,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ContactGroupPairs,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as PrayerFeatures?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      relatedContactIds: null == relatedContactIds
          ? _value.relatedContactIds
          : relatedContactIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }

  /// Create a copy of PrayerRequestScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res> get user {
    return $ContactCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of PrayerRequestScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactGroupPairsCopyWith<$Res> get group {
    return $ContactGroupPairsCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }

  /// Create a copy of PrayerRequestScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrayerFeaturesCopyWith<$Res>? get features {
    if (_value.features == null) {
      return null;
    }

    return $PrayerFeaturesCopyWith<$Res>(_value.features!, (value) {
      return _then(_value.copyWith(features: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrayerRequestScoreImplCopyWith<$Res>
    implements $PrayerRequestScoreCopyWith<$Res> {
  factory _$$PrayerRequestScoreImplCopyWith(_$PrayerRequestScoreImpl value,
          $Res Function(_$PrayerRequestScoreImpl) then) =
      __$$PrayerRequestScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String request,
      @JsonKey(name: 'contact') Contact user,
      @JsonKey(name: 'contact_group') ContactGroupPairs group,
      PrayerFeatures? features,
      double score,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'related_contact_ids') List<int> relatedContactIds});

  @override
  $ContactCopyWith<$Res> get user;
  @override
  $ContactGroupPairsCopyWith<$Res> get group;
  @override
  $PrayerFeaturesCopyWith<$Res>? get features;
}

/// @nodoc
class __$$PrayerRequestScoreImplCopyWithImpl<$Res>
    extends _$PrayerRequestScoreCopyWithImpl<$Res, _$PrayerRequestScoreImpl>
    implements _$$PrayerRequestScoreImplCopyWith<$Res> {
  __$$PrayerRequestScoreImplCopyWithImpl(_$PrayerRequestScoreImpl _value,
      $Res Function(_$PrayerRequestScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerRequestScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? request = null,
    Object? user = null,
    Object? group = null,
    Object? features = freezed,
    Object? score = null,
    Object? createdAt = null,
    Object? relatedContactIds = null,
  }) {
    return _then(_$PrayerRequestScoreImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Contact,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ContactGroupPairs,
      features: freezed == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as PrayerFeatures?,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      relatedContactIds: null == relatedContactIds
          ? _value._relatedContactIds
          : relatedContactIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrayerRequestScoreImpl
    with DiagnosticableTreeMixin
    implements _PrayerRequestScore {
  const _$PrayerRequestScoreImpl(
      {required this.id,
      required this.request,
      @JsonKey(name: 'contact') required this.user,
      @JsonKey(name: 'contact_group') required this.group,
      this.features,
      required this.score,
      @JsonKey(name: 'created_at') this.createdAt = "",
      @JsonKey(name: 'related_contact_ids')
      required final List<int> relatedContactIds})
      : _relatedContactIds = relatedContactIds;

  factory _$PrayerRequestScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrayerRequestScoreImplFromJson(json);

  @override
  final int id;
  @override
  final String request;
  @override
  @JsonKey(name: 'contact')
  final Contact user;
  @override
  @JsonKey(name: 'contact_group')
  final ContactGroupPairs group;
  @override
  final PrayerFeatures? features;
  @override
  final double score;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  final List<int> _relatedContactIds;
  @override
  @JsonKey(name: 'related_contact_ids')
  List<int> get relatedContactIds {
    if (_relatedContactIds is EqualUnmodifiableListView)
      return _relatedContactIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedContactIds);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerRequestScore(id: $id, request: $request, user: $user, group: $group, features: $features, score: $score, createdAt: $createdAt, relatedContactIds: $relatedContactIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerRequestScore'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('request', request))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('group', group))
      ..add(DiagnosticsProperty('features', features))
      ..add(DiagnosticsProperty('score', score))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('relatedContactIds', relatedContactIds));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrayerRequestScoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.features, features) ||
                other.features == features) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._relatedContactIds, _relatedContactIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      request,
      user,
      group,
      features,
      score,
      createdAt,
      const DeepCollectionEquality().hash(_relatedContactIds));

  /// Create a copy of PrayerRequestScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrayerRequestScoreImplCopyWith<_$PrayerRequestScoreImpl> get copyWith =>
      __$$PrayerRequestScoreImplCopyWithImpl<_$PrayerRequestScoreImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrayerRequestScoreImplToJson(
      this,
    );
  }
}

abstract class _PrayerRequestScore implements PrayerRequestScore {
  const factory _PrayerRequestScore(
      {required final int id,
      required final String request,
      @JsonKey(name: 'contact') required final Contact user,
      @JsonKey(name: 'contact_group') required final ContactGroupPairs group,
      final PrayerFeatures? features,
      required final double score,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(name: 'related_contact_ids')
      required final List<int> relatedContactIds}) = _$PrayerRequestScoreImpl;

  factory _PrayerRequestScore.fromJson(Map<String, dynamic> json) =
      _$PrayerRequestScoreImpl.fromJson;

  @override
  int get id;
  @override
  String get request;
  @override
  @JsonKey(name: 'contact')
  Contact get user;
  @override
  @JsonKey(name: 'contact_group')
  ContactGroupPairs get group;
  @override
  PrayerFeatures? get features;
  @override
  double get score;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'related_contact_ids')
  List<int> get relatedContactIds;

  /// Create a copy of PrayerRequestScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerRequestScoreImplCopyWith<_$PrayerRequestScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PrayerFeatures _$PrayerFeaturesFromJson(Map<String, dynamic> json) {
  return _PrayerFeatures.fromJson(json);
}

/// @nodoc
mixin _$PrayerFeatures {
  String? get sentiment => throw _privateConstructorUsedError;
  String? get emotion => throw _privateConstructorUsedError;
  String? get prayerType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get highlight => throw _privateConstructorUsedError;

  /// Serializes this PrayerFeatures to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrayerFeatures
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrayerFeaturesCopyWith<PrayerFeatures> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerFeaturesCopyWith<$Res> {
  factory $PrayerFeaturesCopyWith(
          PrayerFeatures value, $Res Function(PrayerFeatures) then) =
      _$PrayerFeaturesCopyWithImpl<$Res, PrayerFeatures>;
  @useResult
  $Res call(
      {String? sentiment,
      String? emotion,
      String? prayerType,
      String title,
      String highlight});
}

/// @nodoc
class _$PrayerFeaturesCopyWithImpl<$Res, $Val extends PrayerFeatures>
    implements $PrayerFeaturesCopyWith<$Res> {
  _$PrayerFeaturesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrayerFeatures
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentiment = freezed,
    Object? emotion = freezed,
    Object? prayerType = freezed,
    Object? title = null,
    Object? highlight = null,
  }) {
    return _then(_value.copyWith(
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      emotion: freezed == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String?,
      prayerType: freezed == prayerType
          ? _value.prayerType
          : prayerType // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      highlight: null == highlight
          ? _value.highlight
          : highlight // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrayerFeaturesImplCopyWith<$Res>
    implements $PrayerFeaturesCopyWith<$Res> {
  factory _$$PrayerFeaturesImplCopyWith(_$PrayerFeaturesImpl value,
          $Res Function(_$PrayerFeaturesImpl) then) =
      __$$PrayerFeaturesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? sentiment,
      String? emotion,
      String? prayerType,
      String title,
      String highlight});
}

/// @nodoc
class __$$PrayerFeaturesImplCopyWithImpl<$Res>
    extends _$PrayerFeaturesCopyWithImpl<$Res, _$PrayerFeaturesImpl>
    implements _$$PrayerFeaturesImplCopyWith<$Res> {
  __$$PrayerFeaturesImplCopyWithImpl(
      _$PrayerFeaturesImpl _value, $Res Function(_$PrayerFeaturesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerFeatures
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentiment = freezed,
    Object? emotion = freezed,
    Object? prayerType = freezed,
    Object? title = null,
    Object? highlight = null,
  }) {
    return _then(_$PrayerFeaturesImpl(
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      emotion: freezed == emotion
          ? _value.emotion
          : emotion // ignore: cast_nullable_to_non_nullable
              as String?,
      prayerType: freezed == prayerType
          ? _value.prayerType
          : prayerType // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      highlight: null == highlight
          ? _value.highlight
          : highlight // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrayerFeaturesImpl
    with DiagnosticableTreeMixin
    implements _PrayerFeatures {
  const _$PrayerFeaturesImpl(
      {this.sentiment,
      this.emotion,
      this.prayerType,
      required this.title,
      required this.highlight});

  factory _$PrayerFeaturesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrayerFeaturesImplFromJson(json);

  @override
  final String? sentiment;
  @override
  final String? emotion;
  @override
  final String? prayerType;
  @override
  final String title;
  @override
  final String highlight;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerFeatures(sentiment: $sentiment, emotion: $emotion, prayerType: $prayerType, title: $title, highlight: $highlight)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerFeatures'))
      ..add(DiagnosticsProperty('sentiment', sentiment))
      ..add(DiagnosticsProperty('emotion', emotion))
      ..add(DiagnosticsProperty('prayerType', prayerType))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('highlight', highlight));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrayerFeaturesImpl &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment) &&
            (identical(other.emotion, emotion) || other.emotion == emotion) &&
            (identical(other.prayerType, prayerType) ||
                other.prayerType == prayerType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.highlight, highlight) ||
                other.highlight == highlight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, sentiment, emotion, prayerType, title, highlight);

  /// Create a copy of PrayerFeatures
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrayerFeaturesImplCopyWith<_$PrayerFeaturesImpl> get copyWith =>
      __$$PrayerFeaturesImplCopyWithImpl<_$PrayerFeaturesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrayerFeaturesImplToJson(
      this,
    );
  }
}

abstract class _PrayerFeatures implements PrayerFeatures {
  const factory _PrayerFeatures(
      {final String? sentiment,
      final String? emotion,
      final String? prayerType,
      required final String title,
      required final String highlight}) = _$PrayerFeaturesImpl;

  factory _PrayerFeatures.fromJson(Map<String, dynamic> json) =
      _$PrayerFeaturesImpl.fromJson;

  @override
  String? get sentiment;
  @override
  String? get emotion;
  @override
  String? get prayerType;
  @override
  String get title;
  @override
  String get highlight;

  /// Create a copy of PrayerFeatures
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerFeaturesImplCopyWith<_$PrayerFeaturesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BibleReference _$BibleReferenceFromJson(Map<String, dynamic> json) {
  return _BibleReference.fromJson(json);
}

/// @nodoc
mixin _$BibleReference {
  @JsonKey(name: 'book_of_the_bible')
  String get bookOfTheBible => throw _privateConstructorUsedError;
  int get chapter => throw _privateConstructorUsedError;
  @JsonKey(name: 'verse_start')
  int get verseStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'verse_end')
  int get verseEnd => throw _privateConstructorUsedError;

  /// Serializes this BibleReference to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BibleReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BibleReferenceCopyWith<BibleReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BibleReferenceCopyWith<$Res> {
  factory $BibleReferenceCopyWith(
          BibleReference value, $Res Function(BibleReference) then) =
      _$BibleReferenceCopyWithImpl<$Res, BibleReference>;
  @useResult
  $Res call(
      {@JsonKey(name: 'book_of_the_bible') String bookOfTheBible,
      int chapter,
      @JsonKey(name: 'verse_start') int verseStart,
      @JsonKey(name: 'verse_end') int verseEnd});
}

/// @nodoc
class _$BibleReferenceCopyWithImpl<$Res, $Val extends BibleReference>
    implements $BibleReferenceCopyWith<$Res> {
  _$BibleReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BibleReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookOfTheBible = null,
    Object? chapter = null,
    Object? verseStart = null,
    Object? verseEnd = null,
  }) {
    return _then(_value.copyWith(
      bookOfTheBible: null == bookOfTheBible
          ? _value.bookOfTheBible
          : bookOfTheBible // ignore: cast_nullable_to_non_nullable
              as String,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      verseStart: null == verseStart
          ? _value.verseStart
          : verseStart // ignore: cast_nullable_to_non_nullable
              as int,
      verseEnd: null == verseEnd
          ? _value.verseEnd
          : verseEnd // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BibleReferenceImplCopyWith<$Res>
    implements $BibleReferenceCopyWith<$Res> {
  factory _$$BibleReferenceImplCopyWith(_$BibleReferenceImpl value,
          $Res Function(_$BibleReferenceImpl) then) =
      __$$BibleReferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'book_of_the_bible') String bookOfTheBible,
      int chapter,
      @JsonKey(name: 'verse_start') int verseStart,
      @JsonKey(name: 'verse_end') int verseEnd});
}

/// @nodoc
class __$$BibleReferenceImplCopyWithImpl<$Res>
    extends _$BibleReferenceCopyWithImpl<$Res, _$BibleReferenceImpl>
    implements _$$BibleReferenceImplCopyWith<$Res> {
  __$$BibleReferenceImplCopyWithImpl(
      _$BibleReferenceImpl _value, $Res Function(_$BibleReferenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of BibleReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookOfTheBible = null,
    Object? chapter = null,
    Object? verseStart = null,
    Object? verseEnd = null,
  }) {
    return _then(_$BibleReferenceImpl(
      bookOfTheBible: null == bookOfTheBible
          ? _value.bookOfTheBible
          : bookOfTheBible // ignore: cast_nullable_to_non_nullable
              as String,
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as int,
      verseStart: null == verseStart
          ? _value.verseStart
          : verseStart // ignore: cast_nullable_to_non_nullable
              as int,
      verseEnd: null == verseEnd
          ? _value.verseEnd
          : verseEnd // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BibleReferenceImpl
    with DiagnosticableTreeMixin
    implements _BibleReference {
  const _$BibleReferenceImpl(
      {@JsonKey(name: 'book_of_the_bible') required this.bookOfTheBible,
      required this.chapter,
      @JsonKey(name: 'verse_start') required this.verseStart,
      @JsonKey(name: 'verse_end') required this.verseEnd});

  factory _$BibleReferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BibleReferenceImplFromJson(json);

  @override
  @JsonKey(name: 'book_of_the_bible')
  final String bookOfTheBible;
  @override
  final int chapter;
  @override
  @JsonKey(name: 'verse_start')
  final int verseStart;
  @override
  @JsonKey(name: 'verse_end')
  final int verseEnd;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BibleReference(bookOfTheBible: $bookOfTheBible, chapter: $chapter, verseStart: $verseStart, verseEnd: $verseEnd)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BibleReference'))
      ..add(DiagnosticsProperty('bookOfTheBible', bookOfTheBible))
      ..add(DiagnosticsProperty('chapter', chapter))
      ..add(DiagnosticsProperty('verseStart', verseStart))
      ..add(DiagnosticsProperty('verseEnd', verseEnd));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BibleReferenceImpl &&
            (identical(other.bookOfTheBible, bookOfTheBible) ||
                other.bookOfTheBible == bookOfTheBible) &&
            (identical(other.chapter, chapter) || other.chapter == chapter) &&
            (identical(other.verseStart, verseStart) ||
                other.verseStart == verseStart) &&
            (identical(other.verseEnd, verseEnd) ||
                other.verseEnd == verseEnd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bookOfTheBible, chapter, verseStart, verseEnd);

  /// Create a copy of BibleReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BibleReferenceImplCopyWith<_$BibleReferenceImpl> get copyWith =>
      __$$BibleReferenceImplCopyWithImpl<_$BibleReferenceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BibleReferenceImplToJson(
      this,
    );
  }
}

abstract class _BibleReference implements BibleReference {
  const factory _BibleReference(
      {@JsonKey(name: 'book_of_the_bible') required final String bookOfTheBible,
      required final int chapter,
      @JsonKey(name: 'verse_start') required final int verseStart,
      @JsonKey(name: 'verse_end')
      required final int verseEnd}) = _$BibleReferenceImpl;

  factory _BibleReference.fromJson(Map<String, dynamic> json) =
      _$BibleReferenceImpl.fromJson;

  @override
  @JsonKey(name: 'book_of_the_bible')
  String get bookOfTheBible;
  @override
  int get chapter;
  @override
  @JsonKey(name: 'verse_start')
  int get verseStart;
  @override
  @JsonKey(name: 'verse_end')
  int get verseEnd;

  /// Create a copy of BibleReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BibleReferenceImplCopyWith<_$BibleReferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RelatedBibleVerse _$RelatedBibleVerseFromJson(Map<String, dynamic> json) {
  return _RelatedBibleVerse.fromJson(json);
}

/// @nodoc
mixin _$RelatedBibleVerse {
  BibleReference get reference => throw _privateConstructorUsedError;
  String get reasonForRecommendation => throw _privateConstructorUsedError;
  String get referenceType => throw _privateConstructorUsedError;

  /// Serializes this RelatedBibleVerse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelatedBibleVerse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelatedBibleVerseCopyWith<RelatedBibleVerse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatedBibleVerseCopyWith<$Res> {
  factory $RelatedBibleVerseCopyWith(
          RelatedBibleVerse value, $Res Function(RelatedBibleVerse) then) =
      _$RelatedBibleVerseCopyWithImpl<$Res, RelatedBibleVerse>;
  @useResult
  $Res call(
      {BibleReference reference,
      String reasonForRecommendation,
      String referenceType});

  $BibleReferenceCopyWith<$Res> get reference;
}

/// @nodoc
class _$RelatedBibleVerseCopyWithImpl<$Res, $Val extends RelatedBibleVerse>
    implements $RelatedBibleVerseCopyWith<$Res> {
  _$RelatedBibleVerseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelatedBibleVerse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? reasonForRecommendation = null,
    Object? referenceType = null,
  }) {
    return _then(_value.copyWith(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as BibleReference,
      reasonForRecommendation: null == reasonForRecommendation
          ? _value.reasonForRecommendation
          : reasonForRecommendation // ignore: cast_nullable_to_non_nullable
              as String,
      referenceType: null == referenceType
          ? _value.referenceType
          : referenceType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of RelatedBibleVerse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BibleReferenceCopyWith<$Res> get reference {
    return $BibleReferenceCopyWith<$Res>(_value.reference, (value) {
      return _then(_value.copyWith(reference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RelatedBibleVerseImplCopyWith<$Res>
    implements $RelatedBibleVerseCopyWith<$Res> {
  factory _$$RelatedBibleVerseImplCopyWith(_$RelatedBibleVerseImpl value,
          $Res Function(_$RelatedBibleVerseImpl) then) =
      __$$RelatedBibleVerseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BibleReference reference,
      String reasonForRecommendation,
      String referenceType});

  @override
  $BibleReferenceCopyWith<$Res> get reference;
}

/// @nodoc
class __$$RelatedBibleVerseImplCopyWithImpl<$Res>
    extends _$RelatedBibleVerseCopyWithImpl<$Res, _$RelatedBibleVerseImpl>
    implements _$$RelatedBibleVerseImplCopyWith<$Res> {
  __$$RelatedBibleVerseImplCopyWithImpl(_$RelatedBibleVerseImpl _value,
      $Res Function(_$RelatedBibleVerseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RelatedBibleVerse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? reasonForRecommendation = null,
    Object? referenceType = null,
  }) {
    return _then(_$RelatedBibleVerseImpl(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as BibleReference,
      reasonForRecommendation: null == reasonForRecommendation
          ? _value.reasonForRecommendation
          : reasonForRecommendation // ignore: cast_nullable_to_non_nullable
              as String,
      referenceType: null == referenceType
          ? _value.referenceType
          : referenceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RelatedBibleVerseImpl
    with DiagnosticableTreeMixin
    implements _RelatedBibleVerse {
  const _$RelatedBibleVerseImpl(
      {required this.reference,
      required this.reasonForRecommendation,
      required this.referenceType});

  factory _$RelatedBibleVerseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelatedBibleVerseImplFromJson(json);

  @override
  final BibleReference reference;
  @override
  final String reasonForRecommendation;
  @override
  final String referenceType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RelatedBibleVerse(reference: $reference, reasonForRecommendation: $reasonForRecommendation, referenceType: $referenceType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RelatedBibleVerse'))
      ..add(DiagnosticsProperty('reference', reference))
      ..add(DiagnosticsProperty(
          'reasonForRecommendation', reasonForRecommendation))
      ..add(DiagnosticsProperty('referenceType', referenceType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelatedBibleVerseImpl &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(
                    other.reasonForRecommendation, reasonForRecommendation) ||
                other.reasonForRecommendation == reasonForRecommendation) &&
            (identical(other.referenceType, referenceType) ||
                other.referenceType == referenceType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, reference, reasonForRecommendation, referenceType);

  /// Create a copy of RelatedBibleVerse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelatedBibleVerseImplCopyWith<_$RelatedBibleVerseImpl> get copyWith =>
      __$$RelatedBibleVerseImplCopyWithImpl<_$RelatedBibleVerseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelatedBibleVerseImplToJson(
      this,
    );
  }
}

abstract class _RelatedBibleVerse implements RelatedBibleVerse {
  const factory _RelatedBibleVerse(
      {required final BibleReference reference,
      required final String reasonForRecommendation,
      required final String referenceType}) = _$RelatedBibleVerseImpl;

  factory _RelatedBibleVerse.fromJson(Map<String, dynamic> json) =
      _$RelatedBibleVerseImpl.fromJson;

  @override
  BibleReference get reference;
  @override
  String get reasonForRecommendation;
  @override
  String get referenceType;

  /// Create a copy of RelatedBibleVerse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelatedBibleVerseImplCopyWith<_$RelatedBibleVerseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BibleReferenceAndText _$BibleReferenceAndTextFromJson(
    Map<String, dynamic> json) {
  return _BibleReferenceAndText.fromJson(json);
}

/// @nodoc
mixin _$BibleReferenceAndText {
  RelatedBibleVerse get modelOutput => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this BibleReferenceAndText to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BibleReferenceAndText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BibleReferenceAndTextCopyWith<BibleReferenceAndText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BibleReferenceAndTextCopyWith<$Res> {
  factory $BibleReferenceAndTextCopyWith(BibleReferenceAndText value,
          $Res Function(BibleReferenceAndText) then) =
      _$BibleReferenceAndTextCopyWithImpl<$Res, BibleReferenceAndText>;
  @useResult
  $Res call({RelatedBibleVerse modelOutput, String text});

  $RelatedBibleVerseCopyWith<$Res> get modelOutput;
}

/// @nodoc
class _$BibleReferenceAndTextCopyWithImpl<$Res,
        $Val extends BibleReferenceAndText>
    implements $BibleReferenceAndTextCopyWith<$Res> {
  _$BibleReferenceAndTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BibleReferenceAndText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modelOutput = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      modelOutput: null == modelOutput
          ? _value.modelOutput
          : modelOutput // ignore: cast_nullable_to_non_nullable
              as RelatedBibleVerse,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of BibleReferenceAndText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RelatedBibleVerseCopyWith<$Res> get modelOutput {
    return $RelatedBibleVerseCopyWith<$Res>(_value.modelOutput, (value) {
      return _then(_value.copyWith(modelOutput: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BibleReferenceAndTextImplCopyWith<$Res>
    implements $BibleReferenceAndTextCopyWith<$Res> {
  factory _$$BibleReferenceAndTextImplCopyWith(
          _$BibleReferenceAndTextImpl value,
          $Res Function(_$BibleReferenceAndTextImpl) then) =
      __$$BibleReferenceAndTextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RelatedBibleVerse modelOutput, String text});

  @override
  $RelatedBibleVerseCopyWith<$Res> get modelOutput;
}

/// @nodoc
class __$$BibleReferenceAndTextImplCopyWithImpl<$Res>
    extends _$BibleReferenceAndTextCopyWithImpl<$Res,
        _$BibleReferenceAndTextImpl>
    implements _$$BibleReferenceAndTextImplCopyWith<$Res> {
  __$$BibleReferenceAndTextImplCopyWithImpl(_$BibleReferenceAndTextImpl _value,
      $Res Function(_$BibleReferenceAndTextImpl) _then)
      : super(_value, _then);

  /// Create a copy of BibleReferenceAndText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modelOutput = null,
    Object? text = null,
  }) {
    return _then(_$BibleReferenceAndTextImpl(
      modelOutput: null == modelOutput
          ? _value.modelOutput
          : modelOutput // ignore: cast_nullable_to_non_nullable
              as RelatedBibleVerse,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BibleReferenceAndTextImpl
    with DiagnosticableTreeMixin
    implements _BibleReferenceAndText {
  const _$BibleReferenceAndTextImpl(
      {required this.modelOutput, required this.text});

  factory _$BibleReferenceAndTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$BibleReferenceAndTextImplFromJson(json);

  @override
  final RelatedBibleVerse modelOutput;
  @override
  final String text;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BibleReferenceAndText(modelOutput: $modelOutput, text: $text)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BibleReferenceAndText'))
      ..add(DiagnosticsProperty('modelOutput', modelOutput))
      ..add(DiagnosticsProperty('text', text));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BibleReferenceAndTextImpl &&
            (identical(other.modelOutput, modelOutput) ||
                other.modelOutput == modelOutput) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, modelOutput, text);

  /// Create a copy of BibleReferenceAndText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BibleReferenceAndTextImplCopyWith<_$BibleReferenceAndTextImpl>
      get copyWith => __$$BibleReferenceAndTextImplCopyWithImpl<
          _$BibleReferenceAndTextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BibleReferenceAndTextImplToJson(
      this,
    );
  }
}

abstract class _BibleReferenceAndText implements BibleReferenceAndText {
  const factory _BibleReferenceAndText(
      {required final RelatedBibleVerse modelOutput,
      required final String text}) = _$BibleReferenceAndTextImpl;

  factory _BibleReferenceAndText.fromJson(Map<String, dynamic> json) =
      _$BibleReferenceAndTextImpl.fromJson;

  @override
  RelatedBibleVerse get modelOutput;
  @override
  String get text;

  /// Create a copy of BibleReferenceAndText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BibleReferenceAndTextImplCopyWith<_$BibleReferenceAndTextImpl>
      get copyWith => throw _privateConstructorUsedError;
}
