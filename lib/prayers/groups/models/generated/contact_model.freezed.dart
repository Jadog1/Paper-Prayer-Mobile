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
  int? get id => throw _privateConstructorUsedError;
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
      {int? id,
      @JsonKey(name: 'contact_id') int contactId,
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
    Object? id = freezed,
    Object? contactId = null,
    Object? groupId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {int? id,
      @JsonKey(name: 'contact_id') int contactId,
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
    Object? id = freezed,
    Object? contactId = null,
    Object? groupId = null,
    Object? createdAt = null,
  }) {
    return _then(_$ContactGroupPairsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {this.id = 0,
      @JsonKey(name: 'contact_id') required this.contactId,
      @JsonKey(name: 'group_id') required this.groupId,
      @JsonKey(name: 'created_at') required this.createdAt});

  factory _$ContactGroupPairsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactGroupPairsImplFromJson(json);

  @override
  @JsonKey()
  final int? id;
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
    return 'ContactGroupPairs(id: $id, contactId: $contactId, groupId: $groupId, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ContactGroupPairs'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('contactId', contactId))
      ..add(DiagnosticsProperty('groupId', groupId))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactGroupPairsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, contactId, groupId, createdAt);

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
          {final int? id,
          @JsonKey(name: 'contact_id') required final int contactId,
          @JsonKey(name: 'group_id') required final int groupId,
          @JsonKey(name: 'created_at') required final String createdAt}) =
      _$ContactGroupPairsImpl;

  factory _ContactGroupPairs.fromJson(Map<String, dynamic> json) =
      _$ContactGroupPairsImpl.fromJson;

  @override
  int? get id;
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

RelatedContact _$RelatedContactFromJson(Map<String, dynamic> json) {
  return _RelatedContact.fromJson(json);
}

/// @nodoc
mixin _$RelatedContact {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_id')
  int get contactId => throw _privateConstructorUsedError;
  @JsonKey(name: 'related_contact_id')
  int? get relatedContactId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  int get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'high_level_relationship')
  String? get highLevelRelationship => throw _privateConstructorUsedError;
  @JsonKey(name: 'low_level_relationship')
  String? get lowLevelRelationship => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  /// Serializes this RelatedContact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RelatedContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RelatedContactCopyWith<RelatedContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatedContactCopyWith<$Res> {
  factory $RelatedContactCopyWith(
          RelatedContact value, $Res Function(RelatedContact) then) =
      _$RelatedContactCopyWithImpl<$Res, RelatedContact>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'contact_id') int contactId,
      @JsonKey(name: 'related_contact_id') int? relatedContactId,
      @JsonKey(name: 'created_at') String createdAt,
      int accountId,
      @JsonKey(name: 'high_level_relationship') String? highLevelRelationship,
      @JsonKey(name: 'low_level_relationship') String? lowLevelRelationship,
      String name,
      String label});
}

/// @nodoc
class _$RelatedContactCopyWithImpl<$Res, $Val extends RelatedContact>
    implements $RelatedContactCopyWith<$Res> {
  _$RelatedContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RelatedContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contactId = null,
    Object? relatedContactId = freezed,
    Object? createdAt = null,
    Object? accountId = null,
    Object? highLevelRelationship = freezed,
    Object? lowLevelRelationship = freezed,
    Object? name = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as int,
      relatedContactId: freezed == relatedContactId
          ? _value.relatedContactId
          : relatedContactId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      highLevelRelationship: freezed == highLevelRelationship
          ? _value.highLevelRelationship
          : highLevelRelationship // ignore: cast_nullable_to_non_nullable
              as String?,
      lowLevelRelationship: freezed == lowLevelRelationship
          ? _value.lowLevelRelationship
          : lowLevelRelationship // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RelatedContactImplCopyWith<$Res>
    implements $RelatedContactCopyWith<$Res> {
  factory _$$RelatedContactImplCopyWith(_$RelatedContactImpl value,
          $Res Function(_$RelatedContactImpl) then) =
      __$$RelatedContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'contact_id') int contactId,
      @JsonKey(name: 'related_contact_id') int? relatedContactId,
      @JsonKey(name: 'created_at') String createdAt,
      int accountId,
      @JsonKey(name: 'high_level_relationship') String? highLevelRelationship,
      @JsonKey(name: 'low_level_relationship') String? lowLevelRelationship,
      String name,
      String label});
}

/// @nodoc
class __$$RelatedContactImplCopyWithImpl<$Res>
    extends _$RelatedContactCopyWithImpl<$Res, _$RelatedContactImpl>
    implements _$$RelatedContactImplCopyWith<$Res> {
  __$$RelatedContactImplCopyWithImpl(
      _$RelatedContactImpl _value, $Res Function(_$RelatedContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of RelatedContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contactId = null,
    Object? relatedContactId = freezed,
    Object? createdAt = null,
    Object? accountId = null,
    Object? highLevelRelationship = freezed,
    Object? lowLevelRelationship = freezed,
    Object? name = null,
    Object? label = null,
  }) {
    return _then(_$RelatedContactImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contactId: null == contactId
          ? _value.contactId
          : contactId // ignore: cast_nullable_to_non_nullable
              as int,
      relatedContactId: freezed == relatedContactId
          ? _value.relatedContactId
          : relatedContactId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      highLevelRelationship: freezed == highLevelRelationship
          ? _value.highLevelRelationship
          : highLevelRelationship // ignore: cast_nullable_to_non_nullable
              as String?,
      lowLevelRelationship: freezed == lowLevelRelationship
          ? _value.lowLevelRelationship
          : lowLevelRelationship // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RelatedContactImpl
    with DiagnosticableTreeMixin
    implements _RelatedContact {
  const _$RelatedContactImpl(
      {this.id = 0,
      @JsonKey(name: 'contact_id') required this.contactId,
      @JsonKey(name: 'related_contact_id') this.relatedContactId,
      @JsonKey(name: 'created_at') required this.createdAt,
      this.accountId = 0,
      @JsonKey(name: 'high_level_relationship') this.highLevelRelationship,
      @JsonKey(name: 'low_level_relationship') this.lowLevelRelationship,
      required this.name,
      required this.label});

  factory _$RelatedContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$RelatedContactImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'contact_id')
  final int contactId;
  @override
  @JsonKey(name: 'related_contact_id')
  final int? relatedContactId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey()
  final int accountId;
  @override
  @JsonKey(name: 'high_level_relationship')
  final String? highLevelRelationship;
  @override
  @JsonKey(name: 'low_level_relationship')
  final String? lowLevelRelationship;
  @override
  final String name;
  @override
  final String label;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RelatedContact(id: $id, contactId: $contactId, relatedContactId: $relatedContactId, createdAt: $createdAt, accountId: $accountId, highLevelRelationship: $highLevelRelationship, lowLevelRelationship: $lowLevelRelationship, name: $name, label: $label)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RelatedContact'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('contactId', contactId))
      ..add(DiagnosticsProperty('relatedContactId', relatedContactId))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('accountId', accountId))
      ..add(DiagnosticsProperty('highLevelRelationship', highLevelRelationship))
      ..add(DiagnosticsProperty('lowLevelRelationship', lowLevelRelationship))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('label', label));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RelatedContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contactId, contactId) ||
                other.contactId == contactId) &&
            (identical(other.relatedContactId, relatedContactId) ||
                other.relatedContactId == relatedContactId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.highLevelRelationship, highLevelRelationship) ||
                other.highLevelRelationship == highLevelRelationship) &&
            (identical(other.lowLevelRelationship, lowLevelRelationship) ||
                other.lowLevelRelationship == lowLevelRelationship) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      contactId,
      relatedContactId,
      createdAt,
      accountId,
      highLevelRelationship,
      lowLevelRelationship,
      name,
      label);

  /// Create a copy of RelatedContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RelatedContactImplCopyWith<_$RelatedContactImpl> get copyWith =>
      __$$RelatedContactImplCopyWithImpl<_$RelatedContactImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RelatedContactImplToJson(
      this,
    );
  }
}

abstract class _RelatedContact implements RelatedContact {
  const factory _RelatedContact(
      {final int id,
      @JsonKey(name: 'contact_id') required final int contactId,
      @JsonKey(name: 'related_contact_id') final int? relatedContactId,
      @JsonKey(name: 'created_at') required final String createdAt,
      final int accountId,
      @JsonKey(name: 'high_level_relationship')
      final String? highLevelRelationship,
      @JsonKey(name: 'low_level_relationship')
      final String? lowLevelRelationship,
      required final String name,
      required final String label}) = _$RelatedContactImpl;

  factory _RelatedContact.fromJson(Map<String, dynamic> json) =
      _$RelatedContactImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'contact_id')
  int get contactId;
  @override
  @JsonKey(name: 'related_contact_id')
  int? get relatedContactId;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  int get accountId;
  @override
  @JsonKey(name: 'high_level_relationship')
  String? get highLevelRelationship;
  @override
  @JsonKey(name: 'low_level_relationship')
  String? get lowLevelRelationship;
  @override
  String get name;
  @override
  String get label;

  /// Create a copy of RelatedContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RelatedContactImplCopyWith<_$RelatedContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
