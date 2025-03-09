// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../reminder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReminderGroups _$ReminderGroupsFromJson(Map<String, dynamic> json) {
  return _ReminderGroups.fromJson(json);
}

/// @nodoc
mixin _$ReminderGroups {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: "max_created_at")
  String get maxCreatedAt => throw _privateConstructorUsedError;

  /// Serializes this ReminderGroups to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderGroups
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderGroupsCopyWith<ReminderGroups> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderGroupsCopyWith<$Res> {
  factory $ReminderGroupsCopyWith(
          ReminderGroups value, $Res Function(ReminderGroups) then) =
      _$ReminderGroupsCopyWithImpl<$Res, ReminderGroups>;
  @useResult
  $Res call(
      {int id,
      String name,
      int count,
      String type,
      @JsonKey(name: "max_created_at") String maxCreatedAt});
}

/// @nodoc
class _$ReminderGroupsCopyWithImpl<$Res, $Val extends ReminderGroups>
    implements $ReminderGroupsCopyWith<$Res> {
  _$ReminderGroupsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderGroups
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
    Object? type = null,
    Object? maxCreatedAt = null,
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
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      maxCreatedAt: null == maxCreatedAt
          ? _value.maxCreatedAt
          : maxCreatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderGroupsImplCopyWith<$Res>
    implements $ReminderGroupsCopyWith<$Res> {
  factory _$$ReminderGroupsImplCopyWith(_$ReminderGroupsImpl value,
          $Res Function(_$ReminderGroupsImpl) then) =
      __$$ReminderGroupsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int count,
      String type,
      @JsonKey(name: "max_created_at") String maxCreatedAt});
}

/// @nodoc
class __$$ReminderGroupsImplCopyWithImpl<$Res>
    extends _$ReminderGroupsCopyWithImpl<$Res, _$ReminderGroupsImpl>
    implements _$$ReminderGroupsImplCopyWith<$Res> {
  __$$ReminderGroupsImplCopyWithImpl(
      _$ReminderGroupsImpl _value, $Res Function(_$ReminderGroupsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReminderGroups
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
    Object? type = null,
    Object? maxCreatedAt = null,
  }) {
    return _then(_$ReminderGroupsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      maxCreatedAt: null == maxCreatedAt
          ? _value.maxCreatedAt
          : maxCreatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderGroupsImpl
    with DiagnosticableTreeMixin
    implements _ReminderGroups {
  const _$ReminderGroupsImpl(
      {required this.id,
      required this.name,
      required this.count,
      required this.type,
      @JsonKey(name: "max_created_at") required this.maxCreatedAt});

  factory _$ReminderGroupsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderGroupsImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int count;
  @override
  final String type;
  @override
  @JsonKey(name: "max_created_at")
  final String maxCreatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReminderGroups(id: $id, name: $name, count: $count, type: $type, maxCreatedAt: $maxCreatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReminderGroups'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('maxCreatedAt', maxCreatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderGroupsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.maxCreatedAt, maxCreatedAt) ||
                other.maxCreatedAt == maxCreatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, count, type, maxCreatedAt);

  /// Create a copy of ReminderGroups
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderGroupsImplCopyWith<_$ReminderGroupsImpl> get copyWith =>
      __$$ReminderGroupsImplCopyWithImpl<_$ReminderGroupsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderGroupsImplToJson(
      this,
    );
  }
}

abstract class _ReminderGroups implements ReminderGroups {
  const factory _ReminderGroups(
      {required final int id,
      required final String name,
      required final int count,
      required final String type,
      @JsonKey(name: "max_created_at")
      required final String maxCreatedAt}) = _$ReminderGroupsImpl;

  factory _ReminderGroups.fromJson(Map<String, dynamic> json) =
      _$ReminderGroupsImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get count;
  @override
  String get type;
  @override
  @JsonKey(name: "max_created_at")
  String get maxCreatedAt;

  /// Create a copy of ReminderGroups
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderGroupsImplCopyWith<_$ReminderGroupsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RemindersForGroup _$RemindersForGroupFromJson(Map<String, dynamic> json) {
  return _RemindersForGroup.fromJson(json);
}

/// @nodoc
mixin _$RemindersForGroup {
  List<PrayerRequest> get reminders => throw _privateConstructorUsedError;
  ReminderGroups get group => throw _privateConstructorUsedError;

  /// Serializes this RemindersForGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemindersForGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemindersForGroupCopyWith<RemindersForGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemindersForGroupCopyWith<$Res> {
  factory $RemindersForGroupCopyWith(
          RemindersForGroup value, $Res Function(RemindersForGroup) then) =
      _$RemindersForGroupCopyWithImpl<$Res, RemindersForGroup>;
  @useResult
  $Res call({List<PrayerRequest> reminders, ReminderGroups group});

  $ReminderGroupsCopyWith<$Res> get group;
}

/// @nodoc
class _$RemindersForGroupCopyWithImpl<$Res, $Val extends RemindersForGroup>
    implements $RemindersForGroupCopyWith<$Res> {
  _$RemindersForGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemindersForGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reminders = null,
    Object? group = null,
  }) {
    return _then(_value.copyWith(
      reminders: null == reminders
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<PrayerRequest>,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ReminderGroups,
    ) as $Val);
  }

  /// Create a copy of RemindersForGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReminderGroupsCopyWith<$Res> get group {
    return $ReminderGroupsCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RemindersForGroupImplCopyWith<$Res>
    implements $RemindersForGroupCopyWith<$Res> {
  factory _$$RemindersForGroupImplCopyWith(_$RemindersForGroupImpl value,
          $Res Function(_$RemindersForGroupImpl) then) =
      __$$RemindersForGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PrayerRequest> reminders, ReminderGroups group});

  @override
  $ReminderGroupsCopyWith<$Res> get group;
}

/// @nodoc
class __$$RemindersForGroupImplCopyWithImpl<$Res>
    extends _$RemindersForGroupCopyWithImpl<$Res, _$RemindersForGroupImpl>
    implements _$$RemindersForGroupImplCopyWith<$Res> {
  __$$RemindersForGroupImplCopyWithImpl(_$RemindersForGroupImpl _value,
      $Res Function(_$RemindersForGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemindersForGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reminders = null,
    Object? group = null,
  }) {
    return _then(_$RemindersForGroupImpl(
      reminders: null == reminders
          ? _value._reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as List<PrayerRequest>,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ReminderGroups,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemindersForGroupImpl
    with DiagnosticableTreeMixin
    implements _RemindersForGroup {
  const _$RemindersForGroupImpl(
      {required final List<PrayerRequest> reminders, required this.group})
      : _reminders = reminders;

  factory _$RemindersForGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemindersForGroupImplFromJson(json);

  final List<PrayerRequest> _reminders;
  @override
  List<PrayerRequest> get reminders {
    if (_reminders is EqualUnmodifiableListView) return _reminders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminders);
  }

  @override
  final ReminderGroups group;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RemindersForGroup(reminders: $reminders, group: $group)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RemindersForGroup'))
      ..add(DiagnosticsProperty('reminders', reminders))
      ..add(DiagnosticsProperty('group', group));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemindersForGroupImpl &&
            const DeepCollectionEquality()
                .equals(other._reminders, _reminders) &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reminders), group);

  /// Create a copy of RemindersForGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemindersForGroupImplCopyWith<_$RemindersForGroupImpl> get copyWith =>
      __$$RemindersForGroupImplCopyWithImpl<_$RemindersForGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemindersForGroupImplToJson(
      this,
    );
  }
}

abstract class _RemindersForGroup implements RemindersForGroup {
  const factory _RemindersForGroup(
      {required final List<PrayerRequest> reminders,
      required final ReminderGroups group}) = _$RemindersForGroupImpl;

  factory _RemindersForGroup.fromJson(Map<String, dynamic> json) =
      _$RemindersForGroupImpl.fromJson;

  @override
  List<PrayerRequest> get reminders;
  @override
  ReminderGroups get group;

  /// Create a copy of RemindersForGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemindersForGroupImplCopyWith<_$RemindersForGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Reminder _$ReminderFromJson(Map<String, dynamic> json) {
  return _Reminder.fromJson(json);
}

/// @nodoc
mixin _$Reminder {
  @JsonKey(name: "reminder_label")
  String get reminderLabel => throw _privateConstructorUsedError;
  Group get group => throw _privateConstructorUsedError;
  @JsonKey(name: "prayer_collection")
  Collection get prayerCollection => throw _privateConstructorUsedError;

  /// Serializes this Reminder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderCopyWith<Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res, Reminder>;
  @useResult
  $Res call(
      {@JsonKey(name: "reminder_label") String reminderLabel,
      Group group,
      @JsonKey(name: "prayer_collection") Collection prayerCollection});

  $GroupCopyWith<$Res> get group;
  $CollectionCopyWith<$Res> get prayerCollection;
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res, $Val extends Reminder>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reminderLabel = null,
    Object? group = null,
    Object? prayerCollection = null,
  }) {
    return _then(_value.copyWith(
      reminderLabel: null == reminderLabel
          ? _value.reminderLabel
          : reminderLabel // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      prayerCollection: null == prayerCollection
          ? _value.prayerCollection
          : prayerCollection // ignore: cast_nullable_to_non_nullable
              as Collection,
    ) as $Val);
  }

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res> get group {
    return $GroupCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }

  /// Create a copy of Reminder
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
abstract class _$$ReminderImplCopyWith<$Res>
    implements $ReminderCopyWith<$Res> {
  factory _$$ReminderImplCopyWith(
          _$ReminderImpl value, $Res Function(_$ReminderImpl) then) =
      __$$ReminderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "reminder_label") String reminderLabel,
      Group group,
      @JsonKey(name: "prayer_collection") Collection prayerCollection});

  @override
  $GroupCopyWith<$Res> get group;
  @override
  $CollectionCopyWith<$Res> get prayerCollection;
}

/// @nodoc
class __$$ReminderImplCopyWithImpl<$Res>
    extends _$ReminderCopyWithImpl<$Res, _$ReminderImpl>
    implements _$$ReminderImplCopyWith<$Res> {
  __$$ReminderImplCopyWithImpl(
      _$ReminderImpl _value, $Res Function(_$ReminderImpl) _then)
      : super(_value, _then);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reminderLabel = null,
    Object? group = null,
    Object? prayerCollection = null,
  }) {
    return _then(_$ReminderImpl(
      reminderLabel: null == reminderLabel
          ? _value.reminderLabel
          : reminderLabel // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      prayerCollection: null == prayerCollection
          ? _value.prayerCollection
          : prayerCollection // ignore: cast_nullable_to_non_nullable
              as Collection,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderImpl with DiagnosticableTreeMixin implements _Reminder {
  const _$ReminderImpl(
      {@JsonKey(name: "reminder_label") required this.reminderLabel,
      required this.group,
      @JsonKey(name: "prayer_collection") required this.prayerCollection});

  factory _$ReminderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderImplFromJson(json);

  @override
  @JsonKey(name: "reminder_label")
  final String reminderLabel;
  @override
  final Group group;
  @override
  @JsonKey(name: "prayer_collection")
  final Collection prayerCollection;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Reminder(reminderLabel: $reminderLabel, group: $group, prayerCollection: $prayerCollection)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Reminder'))
      ..add(DiagnosticsProperty('reminderLabel', reminderLabel))
      ..add(DiagnosticsProperty('group', group))
      ..add(DiagnosticsProperty('prayerCollection', prayerCollection));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderImpl &&
            (identical(other.reminderLabel, reminderLabel) ||
                other.reminderLabel == reminderLabel) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.prayerCollection, prayerCollection) ||
                other.prayerCollection == prayerCollection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, reminderLabel, group, prayerCollection);

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      __$$ReminderImplCopyWithImpl<_$ReminderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderImplToJson(
      this,
    );
  }
}

abstract class _Reminder implements Reminder {
  const factory _Reminder(
      {@JsonKey(name: "reminder_label") required final String reminderLabel,
      required final Group group,
      @JsonKey(name: "prayer_collection")
      required final Collection prayerCollection}) = _$ReminderImpl;

  factory _Reminder.fromJson(Map<String, dynamic> json) =
      _$ReminderImpl.fromJson;

  @override
  @JsonKey(name: "reminder_label")
  String get reminderLabel;
  @override
  Group get group;
  @override
  @JsonKey(name: "prayer_collection")
  Collection get prayerCollection;

  /// Create a copy of Reminder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderImplCopyWith<_$ReminderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
