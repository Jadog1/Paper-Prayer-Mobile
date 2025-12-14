// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupWithPermissions _$GroupWithPermissionsFromJson(Map<String, dynamic> json) {
  return _GroupWithPermissions.fromJson(json);
}

/// @nodoc
mixin _$GroupWithPermissions {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description =>
      throw _privateConstructorUsedError; // The permissions that the current user has for this group
  List<String> get permissions => throw _privateConstructorUsedError;

  /// Serializes this GroupWithPermissions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GroupWithPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GroupWithPermissionsCopyWith<GroupWithPermissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupWithPermissionsCopyWith<$Res> {
  factory $GroupWithPermissionsCopyWith(GroupWithPermissions value,
          $Res Function(GroupWithPermissions) then) =
      _$GroupWithPermissionsCopyWithImpl<$Res, GroupWithPermissions>;
  @useResult
  $Res call(
      {int id, String name, String? description, List<String> permissions});
}

/// @nodoc
class _$GroupWithPermissionsCopyWithImpl<$Res,
        $Val extends GroupWithPermissions>
    implements $GroupWithPermissionsCopyWith<$Res> {
  _$GroupWithPermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupWithPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? permissions = null,
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
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupWithPermissionsImplCopyWith<$Res>
    implements $GroupWithPermissionsCopyWith<$Res> {
  factory _$$GroupWithPermissionsImplCopyWith(_$GroupWithPermissionsImpl value,
          $Res Function(_$GroupWithPermissionsImpl) then) =
      __$$GroupWithPermissionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, String? description, List<String> permissions});
}

/// @nodoc
class __$$GroupWithPermissionsImplCopyWithImpl<$Res>
    extends _$GroupWithPermissionsCopyWithImpl<$Res, _$GroupWithPermissionsImpl>
    implements _$$GroupWithPermissionsImplCopyWith<$Res> {
  __$$GroupWithPermissionsImplCopyWithImpl(_$GroupWithPermissionsImpl _value,
      $Res Function(_$GroupWithPermissionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GroupWithPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? permissions = null,
  }) {
    return _then(_$GroupWithPermissionsImpl(
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
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GroupWithPermissionsImpl
    with DiagnosticableTreeMixin
    implements _GroupWithPermissions {
  const _$GroupWithPermissionsImpl(
      {this.id = 0,
      required this.name,
      this.description = "",
      final List<String> permissions = const []})
      : _permissions = permissions;

  factory _$GroupWithPermissionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GroupWithPermissionsImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final String? description;
// The permissions that the current user has for this group
  final List<String> _permissions;
// The permissions that the current user has for this group
  @override
  @JsonKey()
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GroupWithPermissions(id: $id, name: $name, description: $description, permissions: $permissions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GroupWithPermissions'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('permissions', permissions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupWithPermissionsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description,
      const DeepCollectionEquality().hash(_permissions));

  /// Create a copy of GroupWithPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupWithPermissionsImplCopyWith<_$GroupWithPermissionsImpl>
      get copyWith =>
          __$$GroupWithPermissionsImplCopyWithImpl<_$GroupWithPermissionsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupWithPermissionsImplToJson(
      this,
    );
  }
}

abstract class _GroupWithPermissions implements GroupWithPermissions {
  const factory _GroupWithPermissions(
      {final int id,
      required final String name,
      final String? description,
      final List<String> permissions}) = _$GroupWithPermissionsImpl;

  factory _GroupWithPermissions.fromJson(Map<String, dynamic> json) =
      _$GroupWithPermissionsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String?
      get description; // The permissions that the current user has for this group
  @override
  List<String> get permissions;

  /// Create a copy of GroupWithPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupWithPermissionsImplCopyWith<_$GroupWithPermissionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
