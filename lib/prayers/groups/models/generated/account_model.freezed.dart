// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_spend_limit')
  double? get monthlySpendLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_code')
  String? get userCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'firebase_id')
  String? get firebaseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_superuser')
  bool? get isSuperuser => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'beta_user')
  bool? get betaUser => throw _privateConstructorUsedError;

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {int id,
      String? name,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'monthly_spend_limit') double? monthlySpendLimit,
      @JsonKey(name: 'user_code') String? userCode,
      @JsonKey(name: 'firebase_id') String? firebaseId,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'is_superuser') bool? isSuperuser,
      @JsonKey(name: 'is_verified') bool? isVerified,
      @JsonKey(name: 'beta_user') bool? betaUser});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? monthlySpendLimit = freezed,
    Object? userCode = freezed,
    Object? firebaseId = freezed,
    Object? isActive = freezed,
    Object? isSuperuser = freezed,
    Object? isVerified = freezed,
    Object? betaUser = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      monthlySpendLimit: freezed == monthlySpendLimit
          ? _value.monthlySpendLimit
          : monthlySpendLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      userCode: freezed == userCode
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseId: freezed == firebaseId
          ? _value.firebaseId
          : firebaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuperuser: freezed == isSuperuser
          ? _value.isSuperuser
          : isSuperuser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      betaUser: freezed == betaUser
          ? _value.betaUser
          : betaUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'monthly_spend_limit') double? monthlySpendLimit,
      @JsonKey(name: 'user_code') String? userCode,
      @JsonKey(name: 'firebase_id') String? firebaseId,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'is_superuser') bool? isSuperuser,
      @JsonKey(name: 'is_verified') bool? isVerified,
      @JsonKey(name: 'beta_user') bool? betaUser});
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? monthlySpendLimit = freezed,
    Object? userCode = freezed,
    Object? firebaseId = freezed,
    Object? isActive = freezed,
    Object? isSuperuser = freezed,
    Object? isVerified = freezed,
    Object? betaUser = freezed,
  }) {
    return _then(_$AccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      monthlySpendLimit: freezed == monthlySpendLimit
          ? _value.monthlySpendLimit
          : monthlySpendLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      userCode: freezed == userCode
          ? _value.userCode
          : userCode // ignore: cast_nullable_to_non_nullable
              as String?,
      firebaseId: freezed == firebaseId
          ? _value.firebaseId
          : firebaseId // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuperuser: freezed == isSuperuser
          ? _value.isSuperuser
          : isSuperuser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      betaUser: freezed == betaUser
          ? _value.betaUser
          : betaUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl with DiagnosticableTreeMixin implements _Account {
  const _$AccountImpl(
      {required this.id,
      this.name,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'monthly_spend_limit') this.monthlySpendLimit,
      @JsonKey(name: 'user_code') this.userCode,
      @JsonKey(name: 'firebase_id') this.firebaseId,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'is_superuser') this.isSuperuser,
      @JsonKey(name: 'is_verified') this.isVerified,
      @JsonKey(name: 'beta_user') this.betaUser});

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'monthly_spend_limit')
  final double? monthlySpendLimit;
  @override
  @JsonKey(name: 'user_code')
  final String? userCode;
  @override
  @JsonKey(name: 'firebase_id')
  final String? firebaseId;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'is_superuser')
  final bool? isSuperuser;
  @override
  @JsonKey(name: 'is_verified')
  final bool? isVerified;
  @override
  @JsonKey(name: 'beta_user')
  final bool? betaUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Account(id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, monthlySpendLimit: $monthlySpendLimit, userCode: $userCode, firebaseId: $firebaseId, isActive: $isActive, isSuperuser: $isSuperuser, isVerified: $isVerified, betaUser: $betaUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Account'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('monthlySpendLimit', monthlySpendLimit))
      ..add(DiagnosticsProperty('userCode', userCode))
      ..add(DiagnosticsProperty('firebaseId', firebaseId))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('isSuperuser', isSuperuser))
      ..add(DiagnosticsProperty('isVerified', isVerified))
      ..add(DiagnosticsProperty('betaUser', betaUser));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.monthlySpendLimit, monthlySpendLimit) ||
                other.monthlySpendLimit == monthlySpendLimit) &&
            (identical(other.userCode, userCode) ||
                other.userCode == userCode) &&
            (identical(other.firebaseId, firebaseId) ||
                other.firebaseId == firebaseId) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSuperuser, isSuperuser) ||
                other.isSuperuser == isSuperuser) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.betaUser, betaUser) ||
                other.betaUser == betaUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      createdAt,
      updatedAt,
      monthlySpendLimit,
      userCode,
      firebaseId,
      isActive,
      isSuperuser,
      isVerified,
      betaUser);

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account implements Account {
  const factory _Account(
      {required final int id,
      final String? name,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'monthly_spend_limit') final double? monthlySpendLimit,
      @JsonKey(name: 'user_code') final String? userCode,
      @JsonKey(name: 'firebase_id') final String? firebaseId,
      @JsonKey(name: 'is_active') final bool? isActive,
      @JsonKey(name: 'is_superuser') final bool? isSuperuser,
      @JsonKey(name: 'is_verified') final bool? isVerified,
      @JsonKey(name: 'beta_user') final bool? betaUser}) = _$AccountImpl;

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'monthly_spend_limit')
  double? get monthlySpendLimit;
  @override
  @JsonKey(name: 'user_code')
  String? get userCode;
  @override
  @JsonKey(name: 'firebase_id')
  String? get firebaseId;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'is_superuser')
  bool? get isSuperuser;
  @override
  @JsonKey(name: 'is_verified')
  bool? get isVerified;
  @override
  @JsonKey(name: 'beta_user')
  bool? get betaUser;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountUpdateRequest _$AccountUpdateRequestFromJson(Map<String, dynamic> json) {
  return _AccountUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$AccountUpdateRequest {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this AccountUpdateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountUpdateRequestCopyWith<AccountUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountUpdateRequestCopyWith<$Res> {
  factory $AccountUpdateRequestCopyWith(AccountUpdateRequest value,
          $Res Function(AccountUpdateRequest) then) =
      _$AccountUpdateRequestCopyWithImpl<$Res, AccountUpdateRequest>;
  @useResult
  $Res call({int id, String? name});
}

/// @nodoc
class _$AccountUpdateRequestCopyWithImpl<$Res,
        $Val extends AccountUpdateRequest>
    implements $AccountUpdateRequestCopyWith<$Res> {
  _$AccountUpdateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountUpdateRequestImplCopyWith<$Res>
    implements $AccountUpdateRequestCopyWith<$Res> {
  factory _$$AccountUpdateRequestImplCopyWith(_$AccountUpdateRequestImpl value,
          $Res Function(_$AccountUpdateRequestImpl) then) =
      __$$AccountUpdateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name});
}

/// @nodoc
class __$$AccountUpdateRequestImplCopyWithImpl<$Res>
    extends _$AccountUpdateRequestCopyWithImpl<$Res, _$AccountUpdateRequestImpl>
    implements _$$AccountUpdateRequestImplCopyWith<$Res> {
  __$$AccountUpdateRequestImplCopyWithImpl(_$AccountUpdateRequestImpl _value,
      $Res Function(_$AccountUpdateRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_$AccountUpdateRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountUpdateRequestImpl
    with DiagnosticableTreeMixin
    implements _AccountUpdateRequest {
  const _$AccountUpdateRequestImpl({required this.id, this.name});

  factory _$AccountUpdateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountUpdateRequestImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountUpdateRequest(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountUpdateRequest'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountUpdateRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  /// Create a copy of AccountUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountUpdateRequestImplCopyWith<_$AccountUpdateRequestImpl>
      get copyWith =>
          __$$AccountUpdateRequestImplCopyWithImpl<_$AccountUpdateRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountUpdateRequestImplToJson(
      this,
    );
  }
}

abstract class _AccountUpdateRequest implements AccountUpdateRequest {
  const factory _AccountUpdateRequest(
      {required final int id, final String? name}) = _$AccountUpdateRequestImpl;

  factory _AccountUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$AccountUpdateRequestImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;

  /// Create a copy of AccountUpdateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountUpdateRequestImplCopyWith<_$AccountUpdateRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
