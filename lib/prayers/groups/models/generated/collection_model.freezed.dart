// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Collection _$CollectionFromJson(Map<String, dynamic> json) {
  return _Collection.fromJson(json);
}

/// @nodoc
mixin _$Collection {
  int get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'related_contact_ids')
  List<int> get relatedContactIds => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact')
  Contact get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_group')
  ContactGroupPairs get group => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'follow_up_rank_label')
  String get followUpRankLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_range_of_event_date')
  String? get startRangeOfEventDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_range_of_event_date')
  String? get endRangeOfEventDate => throw _privateConstructorUsedError;
  double? get score => throw _privateConstructorUsedError;

  /// Serializes this Collection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Collection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionCopyWith<Collection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionCopyWith<$Res> {
  factory $CollectionCopyWith(
          Collection value, $Res Function(Collection) then) =
      _$CollectionCopyWithImpl<$Res, Collection>;
  @useResult
  $Res call(
      {int id,
      String? title,
      @JsonKey(name: 'summary') String? description,
      @JsonKey(name: 'related_contact_ids') List<int> relatedContactIds,
      @JsonKey(name: 'contact') Contact user,
      @JsonKey(name: 'contact_group') ContactGroupPairs group,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'follow_up_rank_label') String followUpRankLabel,
      @JsonKey(name: 'start_range_of_event_date') String? startRangeOfEventDate,
      @JsonKey(name: 'end_range_of_event_date') String? endRangeOfEventDate,
      double? score});

  $ContactCopyWith<$Res> get user;
  $ContactGroupPairsCopyWith<$Res> get group;
}

/// @nodoc
class _$CollectionCopyWithImpl<$Res, $Val extends Collection>
    implements $CollectionCopyWith<$Res> {
  _$CollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Collection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? relatedContactIds = null,
    Object? user = null,
    Object? group = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? followUpRankLabel = null,
    Object? startRangeOfEventDate = freezed,
    Object? endRangeOfEventDate = freezed,
    Object? score = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedContactIds: null == relatedContactIds
          ? _value.relatedContactIds
          : relatedContactIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Contact,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ContactGroupPairs,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      followUpRankLabel: null == followUpRankLabel
          ? _value.followUpRankLabel
          : followUpRankLabel // ignore: cast_nullable_to_non_nullable
              as String,
      startRangeOfEventDate: freezed == startRangeOfEventDate
          ? _value.startRangeOfEventDate
          : startRangeOfEventDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endRangeOfEventDate: freezed == endRangeOfEventDate
          ? _value.endRangeOfEventDate
          : endRangeOfEventDate // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of Collection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res> get user {
    return $ContactCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  /// Create a copy of Collection
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
abstract class _$$CollectionImplCopyWith<$Res>
    implements $CollectionCopyWith<$Res> {
  factory _$$CollectionImplCopyWith(
          _$CollectionImpl value, $Res Function(_$CollectionImpl) then) =
      __$$CollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? title,
      @JsonKey(name: 'summary') String? description,
      @JsonKey(name: 'related_contact_ids') List<int> relatedContactIds,
      @JsonKey(name: 'contact') Contact user,
      @JsonKey(name: 'contact_group') ContactGroupPairs group,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'follow_up_rank_label') String followUpRankLabel,
      @JsonKey(name: 'start_range_of_event_date') String? startRangeOfEventDate,
      @JsonKey(name: 'end_range_of_event_date') String? endRangeOfEventDate,
      double? score});

  @override
  $ContactCopyWith<$Res> get user;
  @override
  $ContactGroupPairsCopyWith<$Res> get group;
}

/// @nodoc
class __$$CollectionImplCopyWithImpl<$Res>
    extends _$CollectionCopyWithImpl<$Res, _$CollectionImpl>
    implements _$$CollectionImplCopyWith<$Res> {
  __$$CollectionImplCopyWithImpl(
      _$CollectionImpl _value, $Res Function(_$CollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Collection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? description = freezed,
    Object? relatedContactIds = null,
    Object? user = null,
    Object? group = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? followUpRankLabel = null,
    Object? startRangeOfEventDate = freezed,
    Object? endRangeOfEventDate = freezed,
    Object? score = freezed,
  }) {
    return _then(_$CollectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      relatedContactIds: null == relatedContactIds
          ? _value._relatedContactIds
          : relatedContactIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Contact,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as ContactGroupPairs,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      followUpRankLabel: null == followUpRankLabel
          ? _value.followUpRankLabel
          : followUpRankLabel // ignore: cast_nullable_to_non_nullable
              as String,
      startRangeOfEventDate: freezed == startRangeOfEventDate
          ? _value.startRangeOfEventDate
          : startRangeOfEventDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endRangeOfEventDate: freezed == endRangeOfEventDate
          ? _value.endRangeOfEventDate
          : endRangeOfEventDate // ignore: cast_nullable_to_non_nullable
              as String?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionImpl with DiagnosticableTreeMixin implements _Collection {
  const _$CollectionImpl(
      {required this.id,
      this.title = "",
      @JsonKey(name: 'summary') this.description = "",
      @JsonKey(name: 'related_contact_ids')
      final List<int> relatedContactIds = const [],
      @JsonKey(name: 'contact') required this.user,
      @JsonKey(name: 'contact_group') required this.group,
      @JsonKey(name: 'created_at') this.createdAt = "",
      @JsonKey(name: 'updated_at') this.updatedAt = "",
      @JsonKey(name: 'follow_up_rank_label') this.followUpRankLabel = "",
      @JsonKey(name: 'start_range_of_event_date') this.startRangeOfEventDate,
      @JsonKey(name: 'end_range_of_event_date') this.endRangeOfEventDate,
      this.score})
      : _relatedContactIds = relatedContactIds;

  factory _$CollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey(name: 'summary')
  final String? description;
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
  @JsonKey(name: 'contact')
  final Contact user;
  @override
  @JsonKey(name: 'contact_group')
  final ContactGroupPairs group;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'follow_up_rank_label')
  final String followUpRankLabel;
  @override
  @JsonKey(name: 'start_range_of_event_date')
  final String? startRangeOfEventDate;
  @override
  @JsonKey(name: 'end_range_of_event_date')
  final String? endRangeOfEventDate;
  @override
  final double? score;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Collection(id: $id, title: $title, description: $description, relatedContactIds: $relatedContactIds, user: $user, group: $group, createdAt: $createdAt, updatedAt: $updatedAt, followUpRankLabel: $followUpRankLabel, startRangeOfEventDate: $startRangeOfEventDate, endRangeOfEventDate: $endRangeOfEventDate, score: $score)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Collection'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('relatedContactIds', relatedContactIds))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('group', group))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('followUpRankLabel', followUpRankLabel))
      ..add(DiagnosticsProperty('startRangeOfEventDate', startRangeOfEventDate))
      ..add(DiagnosticsProperty('endRangeOfEventDate', endRangeOfEventDate))
      ..add(DiagnosticsProperty('score', score));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._relatedContactIds, _relatedContactIds) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.followUpRankLabel, followUpRankLabel) ||
                other.followUpRankLabel == followUpRankLabel) &&
            (identical(other.startRangeOfEventDate, startRangeOfEventDate) ||
                other.startRangeOfEventDate == startRangeOfEventDate) &&
            (identical(other.endRangeOfEventDate, endRangeOfEventDate) ||
                other.endRangeOfEventDate == endRangeOfEventDate) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      const DeepCollectionEquality().hash(_relatedContactIds),
      user,
      group,
      createdAt,
      updatedAt,
      followUpRankLabel,
      startRangeOfEventDate,
      endRangeOfEventDate,
      score);

  /// Create a copy of Collection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionImplCopyWith<_$CollectionImpl> get copyWith =>
      __$$CollectionImplCopyWithImpl<_$CollectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionImplToJson(
      this,
    );
  }
}

abstract class _Collection implements Collection {
  const factory _Collection(
      {required final int id,
      final String? title,
      @JsonKey(name: 'summary') final String? description,
      @JsonKey(name: 'related_contact_ids') final List<int> relatedContactIds,
      @JsonKey(name: 'contact') required final Contact user,
      @JsonKey(name: 'contact_group') required final ContactGroupPairs group,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(name: 'updated_at') final String updatedAt,
      @JsonKey(name: 'follow_up_rank_label') final String followUpRankLabel,
      @JsonKey(name: 'start_range_of_event_date')
      final String? startRangeOfEventDate,
      @JsonKey(name: 'end_range_of_event_date')
      final String? endRangeOfEventDate,
      final double? score}) = _$CollectionImpl;

  factory _Collection.fromJson(Map<String, dynamic> json) =
      _$CollectionImpl.fromJson;

  @override
  int get id;
  @override
  String? get title;
  @override
  @JsonKey(name: 'summary')
  String? get description;
  @override
  @JsonKey(name: 'related_contact_ids')
  List<int> get relatedContactIds;
  @override
  @JsonKey(name: 'contact')
  Contact get user;
  @override
  @JsonKey(name: 'contact_group')
  ContactGroupPairs get group;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'follow_up_rank_label')
  String get followUpRankLabel;
  @override
  @JsonKey(name: 'start_range_of_event_date')
  String? get startRangeOfEventDate;
  @override
  @JsonKey(name: 'end_range_of_event_date')
  String? get endRangeOfEventDate;
  @override
  double? get score;

  /// Create a copy of Collection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionImplCopyWith<_$CollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
