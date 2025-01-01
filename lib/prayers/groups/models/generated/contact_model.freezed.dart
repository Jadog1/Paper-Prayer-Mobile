// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(defaultValue: '') String? description,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactImplCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$ContactImplCopyWith(
          _$ContactImpl value, $Res Function(_$ContactImpl) then) =
      __$$ContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(defaultValue: '') String? description,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class __$$ContactImplCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$ContactImpl>
    implements _$$ContactImplCopyWith<$Res> {
  __$$ContactImplCopyWithImpl(
      _$ContactImpl _value, $Res Function(_$ContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$ContactImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
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
class _$ContactImpl with DiagnosticableTreeMixin implements _Contact {
  const _$ContactImpl(
      {required this.id,
      required this.name,
      @JsonKey(defaultValue: '') this.description,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$ContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(defaultValue: '')
  final String? description;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Contact(id: $id, name: $name, description: $description, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Contact'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, createdAt);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      __$$ContactImplCopyWithImpl<_$ContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactImplToJson(
      this,
    );
  }
}

abstract class _Contact implements Contact {
  const factory _Contact(
          {required final int id,
          required final String name,
          @JsonKey(defaultValue: '') final String? description,
          @JsonKey(name: 'created_at') required final String createdAt}) =
      _$ContactImpl;

  factory _Contact.fromJson(Map<String, dynamic> json) = _$ContactImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(defaultValue: '')
  String? get description;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactGroupPairs _$ContactGroupPairsFromJson(Map<String, dynamic> json) {
  return _ContactGroupPairs.fromJson(json);
}

/// @nodoc
mixin _$ContactGroupPairs {
// The actual name of contactId is contact_id, but I want to use camelCase
  @JsonKey(name: 'contact_id')
  int get contactId => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_id')
  int get groupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ContactGroupPairs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactGroupPairs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactGroupPairsCopyWith<ContactGroupPairs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactGroupPairsCopyWith<$Res> {
  factory $ContactGroupPairsCopyWith(
          ContactGroupPairs value, $Res Function(ContactGroupPairs) then) =
      _$ContactGroupPairsCopyWithImpl<$Res, ContactGroupPairs>;
  @useResult
  $Res call(
      {@JsonKey(name: 'contact_id') int contactId,
      @JsonKey(name: 'group_id') int groupId,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class _$ContactGroupPairsCopyWithImpl<$Res, $Val extends ContactGroupPairs>
    implements $ContactGroupPairsCopyWith<$Res> {
  _$ContactGroupPairsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactGroupPairs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactId = null,
    Object? groupId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactGroupPairsImplCopyWith<$Res>
    implements $ContactGroupPairsCopyWith<$Res> {
  factory _$$ContactGroupPairsImplCopyWith(_$ContactGroupPairsImpl value,
          $Res Function(_$ContactGroupPairsImpl) then) =
      __$$ContactGroupPairsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'contact_id') int contactId,
      @JsonKey(name: 'group_id') int groupId,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class __$$ContactGroupPairsImplCopyWithImpl<$Res>
    extends _$ContactGroupPairsCopyWithImpl<$Res, _$ContactGroupPairsImpl>
    implements _$$ContactGroupPairsImplCopyWith<$Res> {
  __$$ContactGroupPairsImplCopyWithImpl(_$ContactGroupPairsImpl _value,
      $Res Function(_$ContactGroupPairsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactGroupPairs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contactId = null,
    Object? groupId = null,
    Object? createdAt = null,
  }) {
    return _then(_$ContactGroupPairsImpl(
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactGroupPairsImpl
    with DiagnosticableTreeMixin
    implements _ContactGroupPairs {
  const _$ContactGroupPairsImpl(
      {@JsonKey(name: 'contact_id') required this.contactId,
      @JsonKey(name: 'group_id') required this.groupId,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$ContactGroupPairsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactGroupPairsImplFromJson(json);

// The actual name of contactId is contact_id, but I want to use camelCase
  @override
  @JsonKey(name: 'contact_id')
  final int contactId;
  @override
  @JsonKey(name: 'group_id')
  final int groupId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ContactGroupPairs(contactId: $contactId, groupId: $groupId, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContactGroupPairs'))
      ..add(DiagnosticsProperty('contactId', contactId))
      ..add(DiagnosticsProperty('groupId', groupId))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactGroupPairsImpl &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, contactId, groupId, createdAt);

  /// Create a copy of ContactGroupPairs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactGroupPairsImplCopyWith<_$ContactGroupPairsImpl> get copyWith =>
      __$$ContactGroupPairsImplCopyWithImpl<_$ContactGroupPairsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactGroupPairsImplToJson(
      this,
    );
  }
}

abstract class _ContactGroupPairs implements ContactGroupPairs {
  const factory _ContactGroupPairs(
          {@JsonKey(name: 'contact_id') required final int contactId,
          @JsonKey(name: 'group_id') required final int groupId,
          @JsonKey(name: 'created_at') required final String createdAt}) =
      _$ContactGroupPairsImpl;

  factory _ContactGroupPairs.fromJson(Map<String, dynamic> json) =
      _$ContactGroupPairsImpl.fromJson;

// The actual name of contactId is contact_id, but I want to use camelCase
  @override
  @JsonKey(name: 'contact_id')
  int get contactId;
  @override
  @JsonKey(name: 'group_id')
  int get groupId;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;

  /// Create a copy of ContactGroupPairs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactGroupPairsImplCopyWith<_$ContactGroupPairsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
