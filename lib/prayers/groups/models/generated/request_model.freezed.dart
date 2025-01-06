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
  String get request => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact')
  Contact get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_group')
  ContactGroupPairs get group => throw _privateConstructorUsedError;
  String? get sentiment => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

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
      String request,
      @JsonKey(name: 'contact') Contact user,
      @JsonKey(name: 'contact_group') ContactGroupPairs group,
      String? sentiment,
      @JsonKey(name: 'created_at') String createdAt});

  $ContactCopyWith<$Res> get user;
  $ContactGroupPairsCopyWith<$Res> get group;
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
    Object? request = null,
    Object? user = null,
    Object? group = null,
    Object? sentiment = freezed,
    Object? createdAt = null,
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
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
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
      String request,
      @JsonKey(name: 'contact') Contact user,
      @JsonKey(name: 'contact_group') ContactGroupPairs group,
      String? sentiment,
      @JsonKey(name: 'created_at') String createdAt});

  @override
  $ContactCopyWith<$Res> get user;
  @override
  $ContactGroupPairsCopyWith<$Res> get group;
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
    Object? request = null,
    Object? user = null,
    Object? group = null,
    Object? sentiment = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$PrayerRequestImpl(
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
      sentiment: freezed == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrayerRequestImpl
    with DiagnosticableTreeMixin
    implements _PrayerRequest {
  const _$PrayerRequestImpl(
      {required this.id,
      required this.request,
      @JsonKey(name: 'contact') required this.user,
      @JsonKey(name: 'contact_group') required this.group,
      this.sentiment = "",
      @JsonKey(name: 'created_at') this.createdAt = ""});

  factory _$PrayerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrayerRequestImplFromJson(json);

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
  @JsonKey()
  final String? sentiment;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerRequest(id: $id, request: $request, user: $user, group: $group, sentiment: $sentiment, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerRequest'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('request', request))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('group', group))
      ..add(DiagnosticsProperty('sentiment', sentiment))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrayerRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, request, user, group, sentiment, createdAt);

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
  const factory _PrayerRequest(
      {required final int id,
      required final String request,
      @JsonKey(name: 'contact') required final Contact user,
      @JsonKey(name: 'contact_group') required final ContactGroupPairs group,
      final String? sentiment,
      @JsonKey(name: 'created_at')
      final String createdAt}) = _$PrayerRequestImpl;

  factory _PrayerRequest.fromJson(Map<String, dynamic> json) =
      _$PrayerRequestImpl.fromJson;

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
  String? get sentiment;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of PrayerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerRequestImplCopyWith<_$PrayerRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
