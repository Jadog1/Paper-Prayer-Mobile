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

RecommendationGroup _$RecommendationGroupFromJson(Map<String, dynamic> json) {
  return _RecommendationGroup.fromJson(json);
}

/// @nodoc
mixin _$RecommendationGroup {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: "group_type")
  String get groupType => throw _privateConstructorUsedError;
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "counts")
  List<DescriptiveCount> get counts => throw _privateConstructorUsedError;

  /// Serializes this RecommendationGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecommendationGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendationGroupCopyWith<RecommendationGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationGroupCopyWith<$Res> {
  factory $RecommendationGroupCopyWith(
          RecommendationGroup value, $Res Function(RecommendationGroup) then) =
      _$RecommendationGroupCopyWithImpl<$Res, RecommendationGroup>;
  @useResult
  $Res call(
      {String title,
      String description,
      String icon,
      @JsonKey(name: "group_type") String groupType,
      @JsonKey(name: "id") int? id,
      @JsonKey(name: "counts") List<DescriptiveCount> counts});
}

/// @nodoc
class _$RecommendationGroupCopyWithImpl<$Res, $Val extends RecommendationGroup>
    implements $RecommendationGroupCopyWith<$Res> {
  _$RecommendationGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendationGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? icon = null,
    Object? groupType = null,
    Object? id = freezed,
    Object? counts = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      groupType: null == groupType
          ? _value.groupType
          : groupType // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      counts: null == counts
          ? _value.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as List<DescriptiveCount>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendationGroupImplCopyWith<$Res>
    implements $RecommendationGroupCopyWith<$Res> {
  factory _$$RecommendationGroupImplCopyWith(_$RecommendationGroupImpl value,
          $Res Function(_$RecommendationGroupImpl) then) =
      __$$RecommendationGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String icon,
      @JsonKey(name: "group_type") String groupType,
      @JsonKey(name: "id") int? id,
      @JsonKey(name: "counts") List<DescriptiveCount> counts});
}

/// @nodoc
class __$$RecommendationGroupImplCopyWithImpl<$Res>
    extends _$RecommendationGroupCopyWithImpl<$Res, _$RecommendationGroupImpl>
    implements _$$RecommendationGroupImplCopyWith<$Res> {
  __$$RecommendationGroupImplCopyWithImpl(_$RecommendationGroupImpl _value,
      $Res Function(_$RecommendationGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecommendationGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? icon = null,
    Object? groupType = null,
    Object? id = freezed,
    Object? counts = null,
  }) {
    return _then(_$RecommendationGroupImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      groupType: null == groupType
          ? _value.groupType
          : groupType // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      counts: null == counts
          ? _value._counts
          : counts // ignore: cast_nullable_to_non_nullable
              as List<DescriptiveCount>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecommendationGroupImpl
    with DiagnosticableTreeMixin
    implements _RecommendationGroup {
  const _$RecommendationGroupImpl(
      {required this.title,
      required this.description,
      required this.icon,
      @JsonKey(name: "group_type") required this.groupType,
      @JsonKey(name: "id") this.id,
      @JsonKey(name: "counts") required final List<DescriptiveCount> counts})
      : _counts = counts;

  factory _$RecommendationGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecommendationGroupImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String icon;
  @override
  @JsonKey(name: "group_type")
  final String groupType;
  @override
  @JsonKey(name: "id")
  final int? id;
  final List<DescriptiveCount> _counts;
  @override
  @JsonKey(name: "counts")
  List<DescriptiveCount> get counts {
    if (_counts is EqualUnmodifiableListView) return _counts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_counts);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecommendationGroup(title: $title, description: $description, icon: $icon, groupType: $groupType, id: $id, counts: $counts)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecommendationGroup'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('groupType', groupType))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('counts', counts));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendationGroupImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.groupType, groupType) ||
                other.groupType == groupType) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._counts, _counts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, icon,
      groupType, id, const DeepCollectionEquality().hash(_counts));

  /// Create a copy of RecommendationGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendationGroupImplCopyWith<_$RecommendationGroupImpl> get copyWith =>
      __$$RecommendationGroupImplCopyWithImpl<_$RecommendationGroupImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecommendationGroupImplToJson(
      this,
    );
  }
}

abstract class _RecommendationGroup implements RecommendationGroup {
  const factory _RecommendationGroup(
          {required final String title,
          required final String description,
          required final String icon,
          @JsonKey(name: "group_type") required final String groupType,
          @JsonKey(name: "id") final int? id,
          @JsonKey(name: "counts")
          required final List<DescriptiveCount> counts}) =
      _$RecommendationGroupImpl;

  factory _RecommendationGroup.fromJson(Map<String, dynamic> json) =
      _$RecommendationGroupImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get icon;
  @override
  @JsonKey(name: "group_type")
  String get groupType;
  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "counts")
  List<DescriptiveCount> get counts;

  /// Create a copy of RecommendationGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendationGroupImplCopyWith<_$RecommendationGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DescriptiveCount _$DescriptiveCountFromJson(Map<String, dynamic> json) {
  return _DescriptiveCount.fromJson(json);
}

/// @nodoc
mixin _$DescriptiveCount {
  int get count => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this DescriptiveCount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DescriptiveCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DescriptiveCountCopyWith<DescriptiveCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DescriptiveCountCopyWith<$Res> {
  factory $DescriptiveCountCopyWith(
          DescriptiveCount value, $Res Function(DescriptiveCount) then) =
      _$DescriptiveCountCopyWithImpl<$Res, DescriptiveCount>;
  @useResult
  $Res call({int count, String description});
}

/// @nodoc
class _$DescriptiveCountCopyWithImpl<$Res, $Val extends DescriptiveCount>
    implements $DescriptiveCountCopyWith<$Res> {
  _$DescriptiveCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DescriptiveCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DescriptiveCountImplCopyWith<$Res>
    implements $DescriptiveCountCopyWith<$Res> {
  factory _$$DescriptiveCountImplCopyWith(_$DescriptiveCountImpl value,
          $Res Function(_$DescriptiveCountImpl) then) =
      __$$DescriptiveCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, String description});
}

/// @nodoc
class __$$DescriptiveCountImplCopyWithImpl<$Res>
    extends _$DescriptiveCountCopyWithImpl<$Res, _$DescriptiveCountImpl>
    implements _$$DescriptiveCountImplCopyWith<$Res> {
  __$$DescriptiveCountImplCopyWithImpl(_$DescriptiveCountImpl _value,
      $Res Function(_$DescriptiveCountImpl) _then)
      : super(_value, _then);

  /// Create a copy of DescriptiveCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? description = null,
  }) {
    return _then(_$DescriptiveCountImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DescriptiveCountImpl
    with DiagnosticableTreeMixin
    implements _DescriptiveCount {
  const _$DescriptiveCountImpl(
      {required this.count, required this.description});

  factory _$DescriptiveCountImpl.fromJson(Map<String, dynamic> json) =>
      _$$DescriptiveCountImplFromJson(json);

  @override
  final int count;
  @override
  final String description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DescriptiveCount(count: $count, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DescriptiveCount'))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DescriptiveCountImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, description);

  /// Create a copy of DescriptiveCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DescriptiveCountImplCopyWith<_$DescriptiveCountImpl> get copyWith =>
      __$$DescriptiveCountImplCopyWithImpl<_$DescriptiveCountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DescriptiveCountImplToJson(
      this,
    );
  }
}

abstract class _DescriptiveCount implements DescriptiveCount {
  const factory _DescriptiveCount(
      {required final int count,
      required final String description}) = _$DescriptiveCountImpl;

  factory _DescriptiveCount.fromJson(Map<String, dynamic> json) =
      _$DescriptiveCountImpl.fromJson;

  @override
  int get count;
  @override
  String get description;

  /// Create a copy of DescriptiveCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DescriptiveCountImplCopyWith<_$DescriptiveCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedCollectionRecommendation _$PaginatedCollectionRecommendationFromJson(
    Map<String, dynamic> json) {
  return _PaginatedCollectionRecommendation.fromJson(json);
}

/// @nodoc
mixin _$PaginatedCollectionRecommendation {
  List<CollectionRecommendation> get collections =>
      throw _privateConstructorUsedError;
  CursorPagination get pagination => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;

  /// Serializes this PaginatedCollectionRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedCollectionRecommendationCopyWith<PaginatedCollectionRecommendation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedCollectionRecommendationCopyWith<$Res> {
  factory $PaginatedCollectionRecommendationCopyWith(
          PaginatedCollectionRecommendation value,
          $Res Function(PaginatedCollectionRecommendation) then) =
      _$PaginatedCollectionRecommendationCopyWithImpl<$Res,
          PaginatedCollectionRecommendation>;
  @useResult
  $Res call(
      {List<CollectionRecommendation> collections,
      CursorPagination pagination,
      bool hasNext});

  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$PaginatedCollectionRecommendationCopyWithImpl<$Res,
        $Val extends PaginatedCollectionRecommendation>
    implements $PaginatedCollectionRecommendationCopyWith<$Res> {
  _$PaginatedCollectionRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? pagination = null,
    Object? hasNext = null,
  }) {
    return _then(_value.copyWith(
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionRecommendation>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as CursorPagination,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PaginatedCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CursorPaginationCopyWith<$Res> get pagination {
    return $CursorPaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedCollectionRecommendationImplCopyWith<$Res>
    implements $PaginatedCollectionRecommendationCopyWith<$Res> {
  factory _$$PaginatedCollectionRecommendationImplCopyWith(
          _$PaginatedCollectionRecommendationImpl value,
          $Res Function(_$PaginatedCollectionRecommendationImpl) then) =
      __$$PaginatedCollectionRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CollectionRecommendation> collections,
      CursorPagination pagination,
      bool hasNext});

  @override
  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$PaginatedCollectionRecommendationImplCopyWithImpl<$Res>
    extends _$PaginatedCollectionRecommendationCopyWithImpl<$Res,
        _$PaginatedCollectionRecommendationImpl>
    implements _$$PaginatedCollectionRecommendationImplCopyWith<$Res> {
  __$$PaginatedCollectionRecommendationImplCopyWithImpl(
      _$PaginatedCollectionRecommendationImpl _value,
      $Res Function(_$PaginatedCollectionRecommendationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? pagination = null,
    Object? hasNext = null,
  }) {
    return _then(_$PaginatedCollectionRecommendationImpl(
      collections: null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<CollectionRecommendation>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as CursorPagination,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedCollectionRecommendationImpl
    with DiagnosticableTreeMixin
    implements _PaginatedCollectionRecommendation {
  const _$PaginatedCollectionRecommendationImpl(
      {required final List<CollectionRecommendation> collections,
      required this.pagination,
      this.hasNext = false})
      : _collections = collections;

  factory _$PaginatedCollectionRecommendationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaginatedCollectionRecommendationImplFromJson(json);

  final List<CollectionRecommendation> _collections;
  @override
  List<CollectionRecommendation> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  @override
  final CursorPagination pagination;
  @override
  @JsonKey()
  final bool hasNext;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginatedCollectionRecommendation(collections: $collections, pagination: $pagination, hasNext: $hasNext)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginatedCollectionRecommendation'))
      ..add(DiagnosticsProperty('collections', collections))
      ..add(DiagnosticsProperty('pagination', pagination))
      ..add(DiagnosticsProperty('hasNext', hasNext));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedCollectionRecommendationImpl &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_collections), pagination, hasNext);

  /// Create a copy of PaginatedCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedCollectionRecommendationImplCopyWith<
          _$PaginatedCollectionRecommendationImpl>
      get copyWith => __$$PaginatedCollectionRecommendationImplCopyWithImpl<
          _$PaginatedCollectionRecommendationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedCollectionRecommendationImplToJson(
      this,
    );
  }
}

abstract class _PaginatedCollectionRecommendation
    implements PaginatedCollectionRecommendation {
  const factory _PaginatedCollectionRecommendation(
      {required final List<CollectionRecommendation> collections,
      required final CursorPagination pagination,
      final bool hasNext}) = _$PaginatedCollectionRecommendationImpl;

  factory _PaginatedCollectionRecommendation.fromJson(
          Map<String, dynamic> json) =
      _$PaginatedCollectionRecommendationImpl.fromJson;

  @override
  List<CollectionRecommendation> get collections;
  @override
  CursorPagination get pagination;
  @override
  bool get hasNext;

  /// Create a copy of PaginatedCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedCollectionRecommendationImplCopyWith<
          _$PaginatedCollectionRecommendationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CollectionRecommendation _$CollectionRecommendationFromJson(
    Map<String, dynamic> json) {
  return _CollectionRecommendation.fromJson(json);
}

/// @nodoc
mixin _$CollectionRecommendation {
  Collection get collection => throw _privateConstructorUsedError;
  @JsonKey(name: "recommendation_type")
  String get recommendationType => throw _privateConstructorUsedError;

  /// Serializes this CollectionRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionRecommendationCopyWith<CollectionRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionRecommendationCopyWith<$Res> {
  factory $CollectionRecommendationCopyWith(CollectionRecommendation value,
          $Res Function(CollectionRecommendation) then) =
      _$CollectionRecommendationCopyWithImpl<$Res, CollectionRecommendation>;
  @useResult
  $Res call(
      {Collection collection,
      @JsonKey(name: "recommendation_type") String recommendationType});

  $CollectionCopyWith<$Res> get collection;
}

/// @nodoc
class _$CollectionRecommendationCopyWithImpl<$Res,
        $Val extends CollectionRecommendation>
    implements $CollectionRecommendationCopyWith<$Res> {
  _$CollectionRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? recommendationType = null,
  }) {
    return _then(_value.copyWith(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection,
      recommendationType: null == recommendationType
          ? _value.recommendationType
          : recommendationType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of CollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CollectionCopyWith<$Res> get collection {
    return $CollectionCopyWith<$Res>(_value.collection, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CollectionRecommendationImplCopyWith<$Res>
    implements $CollectionRecommendationCopyWith<$Res> {
  factory _$$CollectionRecommendationImplCopyWith(
          _$CollectionRecommendationImpl value,
          $Res Function(_$CollectionRecommendationImpl) then) =
      __$$CollectionRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Collection collection,
      @JsonKey(name: "recommendation_type") String recommendationType});

  @override
  $CollectionCopyWith<$Res> get collection;
}

/// @nodoc
class __$$CollectionRecommendationImplCopyWithImpl<$Res>
    extends _$CollectionRecommendationCopyWithImpl<$Res,
        _$CollectionRecommendationImpl>
    implements _$$CollectionRecommendationImplCopyWith<$Res> {
  __$$CollectionRecommendationImplCopyWithImpl(
      _$CollectionRecommendationImpl _value,
      $Res Function(_$CollectionRecommendationImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? recommendationType = null,
  }) {
    return _then(_$CollectionRecommendationImpl(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection,
      recommendationType: null == recommendationType
          ? _value.recommendationType
          : recommendationType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollectionRecommendationImpl
    with DiagnosticableTreeMixin
    implements _CollectionRecommendation {
  const _$CollectionRecommendationImpl(
      {required this.collection,
      @JsonKey(name: "recommendation_type") required this.recommendationType});

  factory _$CollectionRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollectionRecommendationImplFromJson(json);

  @override
  final Collection collection;
  @override
  @JsonKey(name: "recommendation_type")
  final String recommendationType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CollectionRecommendation(collection: $collection, recommendationType: $recommendationType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CollectionRecommendation'))
      ..add(DiagnosticsProperty('collection', collection))
      ..add(DiagnosticsProperty('recommendationType', recommendationType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionRecommendationImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.recommendationType, recommendationType) ||
                other.recommendationType == recommendationType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, collection, recommendationType);

  /// Create a copy of CollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionRecommendationImplCopyWith<_$CollectionRecommendationImpl>
      get copyWith => __$$CollectionRecommendationImplCopyWithImpl<
          _$CollectionRecommendationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollectionRecommendationImplToJson(
      this,
    );
  }
}

abstract class _CollectionRecommendation implements CollectionRecommendation {
  const factory _CollectionRecommendation(
          {required final Collection collection,
          @JsonKey(name: "recommendation_type")
          required final String recommendationType}) =
      _$CollectionRecommendationImpl;

  factory _CollectionRecommendation.fromJson(Map<String, dynamic> json) =
      _$CollectionRecommendationImpl.fromJson;

  @override
  Collection get collection;
  @override
  @JsonKey(name: "recommendation_type")
  String get recommendationType;

  /// Create a copy of CollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionRecommendationImplCopyWith<_$CollectionRecommendationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

HistoricalCollectionRecommendation _$HistoricalCollectionRecommendationFromJson(
    Map<String, dynamic> json) {
  return _HistoricalCollectionRecommendation.fromJson(json);
}

/// @nodoc
mixin _$HistoricalCollectionRecommendation {
  Collection get collection => throw _privateConstructorUsedError;
  @JsonKey(name: "recommendation_type")
  String get recommendationType => throw _privateConstructorUsedError;
  @JsonKey(name: "for_date")
  String get forDate => throw _privateConstructorUsedError;

  /// Serializes this HistoricalCollectionRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoricalCollectionRecommendationCopyWith<
          HistoricalCollectionRecommendation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoricalCollectionRecommendationCopyWith<$Res> {
  factory $HistoricalCollectionRecommendationCopyWith(
          HistoricalCollectionRecommendation value,
          $Res Function(HistoricalCollectionRecommendation) then) =
      _$HistoricalCollectionRecommendationCopyWithImpl<$Res,
          HistoricalCollectionRecommendation>;
  @useResult
  $Res call(
      {Collection collection,
      @JsonKey(name: "recommendation_type") String recommendationType,
      @JsonKey(name: "for_date") String forDate});

  $CollectionCopyWith<$Res> get collection;
}

/// @nodoc
class _$HistoricalCollectionRecommendationCopyWithImpl<$Res,
        $Val extends HistoricalCollectionRecommendation>
    implements $HistoricalCollectionRecommendationCopyWith<$Res> {
  _$HistoricalCollectionRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? recommendationType = null,
    Object? forDate = null,
  }) {
    return _then(_value.copyWith(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection,
      recommendationType: null == recommendationType
          ? _value.recommendationType
          : recommendationType // ignore: cast_nullable_to_non_nullable
              as String,
      forDate: null == forDate
          ? _value.forDate
          : forDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of HistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CollectionCopyWith<$Res> get collection {
    return $CollectionCopyWith<$Res>(_value.collection, (value) {
      return _then(_value.copyWith(collection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HistoricalCollectionRecommendationImplCopyWith<$Res>
    implements $HistoricalCollectionRecommendationCopyWith<$Res> {
  factory _$$HistoricalCollectionRecommendationImplCopyWith(
          _$HistoricalCollectionRecommendationImpl value,
          $Res Function(_$HistoricalCollectionRecommendationImpl) then) =
      __$$HistoricalCollectionRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Collection collection,
      @JsonKey(name: "recommendation_type") String recommendationType,
      @JsonKey(name: "for_date") String forDate});

  @override
  $CollectionCopyWith<$Res> get collection;
}

/// @nodoc
class __$$HistoricalCollectionRecommendationImplCopyWithImpl<$Res>
    extends _$HistoricalCollectionRecommendationCopyWithImpl<$Res,
        _$HistoricalCollectionRecommendationImpl>
    implements _$$HistoricalCollectionRecommendationImplCopyWith<$Res> {
  __$$HistoricalCollectionRecommendationImplCopyWithImpl(
      _$HistoricalCollectionRecommendationImpl _value,
      $Res Function(_$HistoricalCollectionRecommendationImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? recommendationType = null,
    Object? forDate = null,
  }) {
    return _then(_$HistoricalCollectionRecommendationImpl(
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection,
      recommendationType: null == recommendationType
          ? _value.recommendationType
          : recommendationType // ignore: cast_nullable_to_non_nullable
              as String,
      forDate: null == forDate
          ? _value.forDate
          : forDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoricalCollectionRecommendationImpl
    with DiagnosticableTreeMixin
    implements _HistoricalCollectionRecommendation {
  const _$HistoricalCollectionRecommendationImpl(
      {required this.collection,
      @JsonKey(name: "recommendation_type") required this.recommendationType,
      @JsonKey(name: "for_date") required this.forDate});

  factory _$HistoricalCollectionRecommendationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$HistoricalCollectionRecommendationImplFromJson(json);

  @override
  final Collection collection;
  @override
  @JsonKey(name: "recommendation_type")
  final String recommendationType;
  @override
  @JsonKey(name: "for_date")
  final String forDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoricalCollectionRecommendation(collection: $collection, recommendationType: $recommendationType, forDate: $forDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoricalCollectionRecommendation'))
      ..add(DiagnosticsProperty('collection', collection))
      ..add(DiagnosticsProperty('recommendationType', recommendationType))
      ..add(DiagnosticsProperty('forDate', forDate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoricalCollectionRecommendationImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.recommendationType, recommendationType) ||
                other.recommendationType == recommendationType) &&
            (identical(other.forDate, forDate) || other.forDate == forDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, collection, recommendationType, forDate);

  /// Create a copy of HistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoricalCollectionRecommendationImplCopyWith<
          _$HistoricalCollectionRecommendationImpl>
      get copyWith => __$$HistoricalCollectionRecommendationImplCopyWithImpl<
          _$HistoricalCollectionRecommendationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoricalCollectionRecommendationImplToJson(
      this,
    );
  }
}

abstract class _HistoricalCollectionRecommendation
    implements HistoricalCollectionRecommendation {
  const factory _HistoricalCollectionRecommendation(
          {required final Collection collection,
          @JsonKey(name: "recommendation_type")
          required final String recommendationType,
          @JsonKey(name: "for_date") required final String forDate}) =
      _$HistoricalCollectionRecommendationImpl;

  factory _HistoricalCollectionRecommendation.fromJson(
          Map<String, dynamic> json) =
      _$HistoricalCollectionRecommendationImpl.fromJson;

  @override
  Collection get collection;
  @override
  @JsonKey(name: "recommendation_type")
  String get recommendationType;
  @override
  @JsonKey(name: "for_date")
  String get forDate;

  /// Create a copy of HistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoricalCollectionRecommendationImplCopyWith<
          _$HistoricalCollectionRecommendationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaginatedHistoricalCollectionRecommendation
    _$PaginatedHistoricalCollectionRecommendationFromJson(
        Map<String, dynamic> json) {
  return _PaginatedHistoricalCollectionRecommendation.fromJson(json);
}

/// @nodoc
mixin _$PaginatedHistoricalCollectionRecommendation {
  List<HistoricalCollectionRecommendation> get collections =>
      throw _privateConstructorUsedError;
  CursorPagination get pagination => throw _privateConstructorUsedError;
  @JsonKey(name: "has_next")
  bool get hasNext => throw _privateConstructorUsedError;

  /// Serializes this PaginatedHistoricalCollectionRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedHistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedHistoricalCollectionRecommendationCopyWith<
          PaginatedHistoricalCollectionRecommendation>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedHistoricalCollectionRecommendationCopyWith<$Res> {
  factory $PaginatedHistoricalCollectionRecommendationCopyWith(
          PaginatedHistoricalCollectionRecommendation value,
          $Res Function(PaginatedHistoricalCollectionRecommendation) then) =
      _$PaginatedHistoricalCollectionRecommendationCopyWithImpl<$Res,
          PaginatedHistoricalCollectionRecommendation>;
  @useResult
  $Res call(
      {List<HistoricalCollectionRecommendation> collections,
      CursorPagination pagination,
      @JsonKey(name: "has_next") bool hasNext});

  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$PaginatedHistoricalCollectionRecommendationCopyWithImpl<$Res,
        $Val extends PaginatedHistoricalCollectionRecommendation>
    implements $PaginatedHistoricalCollectionRecommendationCopyWith<$Res> {
  _$PaginatedHistoricalCollectionRecommendationCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedHistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? pagination = null,
    Object? hasNext = null,
  }) {
    return _then(_value.copyWith(
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<HistoricalCollectionRecommendation>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as CursorPagination,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PaginatedHistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CursorPaginationCopyWith<$Res> get pagination {
    return $CursorPaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedHistoricalCollectionRecommendationImplCopyWith<$Res>
    implements $PaginatedHistoricalCollectionRecommendationCopyWith<$Res> {
  factory _$$PaginatedHistoricalCollectionRecommendationImplCopyWith(
          _$PaginatedHistoricalCollectionRecommendationImpl value,
          $Res Function(_$PaginatedHistoricalCollectionRecommendationImpl)
              then) =
      __$$PaginatedHistoricalCollectionRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HistoricalCollectionRecommendation> collections,
      CursorPagination pagination,
      @JsonKey(name: "has_next") bool hasNext});

  @override
  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$PaginatedHistoricalCollectionRecommendationImplCopyWithImpl<$Res>
    extends _$PaginatedHistoricalCollectionRecommendationCopyWithImpl<$Res,
        _$PaginatedHistoricalCollectionRecommendationImpl>
    implements
        _$$PaginatedHistoricalCollectionRecommendationImplCopyWith<$Res> {
  __$$PaginatedHistoricalCollectionRecommendationImplCopyWithImpl(
      _$PaginatedHistoricalCollectionRecommendationImpl _value,
      $Res Function(_$PaginatedHistoricalCollectionRecommendationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedHistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? pagination = null,
    Object? hasNext = null,
  }) {
    return _then(_$PaginatedHistoricalCollectionRecommendationImpl(
      collections: null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<HistoricalCollectionRecommendation>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as CursorPagination,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedHistoricalCollectionRecommendationImpl
    with DiagnosticableTreeMixin
    implements _PaginatedHistoricalCollectionRecommendation {
  const _$PaginatedHistoricalCollectionRecommendationImpl(
      {required final List<HistoricalCollectionRecommendation> collections,
      required this.pagination,
      @JsonKey(name: "has_next") this.hasNext = false})
      : _collections = collections;

  factory _$PaginatedHistoricalCollectionRecommendationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaginatedHistoricalCollectionRecommendationImplFromJson(json);

  final List<HistoricalCollectionRecommendation> _collections;
  @override
  List<HistoricalCollectionRecommendation> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  @override
  final CursorPagination pagination;
  @override
  @JsonKey(name: "has_next")
  final bool hasNext;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginatedHistoricalCollectionRecommendation(collections: $collections, pagination: $pagination, hasNext: $hasNext)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PaginatedHistoricalCollectionRecommendation'))
      ..add(DiagnosticsProperty('collections', collections))
      ..add(DiagnosticsProperty('pagination', pagination))
      ..add(DiagnosticsProperty('hasNext', hasNext));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedHistoricalCollectionRecommendationImpl &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_collections), pagination, hasNext);

  /// Create a copy of PaginatedHistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedHistoricalCollectionRecommendationImplCopyWith<
          _$PaginatedHistoricalCollectionRecommendationImpl>
      get copyWith =>
          __$$PaginatedHistoricalCollectionRecommendationImplCopyWithImpl<
                  _$PaginatedHistoricalCollectionRecommendationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedHistoricalCollectionRecommendationImplToJson(
      this,
    );
  }
}

abstract class _PaginatedHistoricalCollectionRecommendation
    implements PaginatedHistoricalCollectionRecommendation {
  const factory _PaginatedHistoricalCollectionRecommendation(
          {required final List<HistoricalCollectionRecommendation> collections,
          required final CursorPagination pagination,
          @JsonKey(name: "has_next") final bool hasNext}) =
      _$PaginatedHistoricalCollectionRecommendationImpl;

  factory _PaginatedHistoricalCollectionRecommendation.fromJson(
          Map<String, dynamic> json) =
      _$PaginatedHistoricalCollectionRecommendationImpl.fromJson;

  @override
  List<HistoricalCollectionRecommendation> get collections;
  @override
  CursorPagination get pagination;
  @override
  @JsonKey(name: "has_next")
  bool get hasNext;

  /// Create a copy of PaginatedHistoricalCollectionRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedHistoricalCollectionRecommendationImplCopyWith<
          _$PaginatedHistoricalCollectionRecommendationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
