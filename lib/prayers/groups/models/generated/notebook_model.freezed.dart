// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../notebook_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CursorPagination _$CursorPaginationFromJson(Map<String, dynamic> json) {
  return _CursorPagination.fromJson(json);
}

/// @nodoc
mixin _$CursorPagination {
  int get limit => throw _privateConstructorUsedError;
  String? get cursor => throw _privateConstructorUsedError;

  /// Serializes this CursorPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CursorPaginationCopyWith<CursorPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CursorPaginationCopyWith<$Res> {
  factory $CursorPaginationCopyWith(
          CursorPagination value, $Res Function(CursorPagination) then) =
      _$CursorPaginationCopyWithImpl<$Res, CursorPagination>;
  @useResult
  $Res call({int limit, String? cursor});
}

/// @nodoc
class _$CursorPaginationCopyWithImpl<$Res, $Val extends CursorPagination>
    implements $CursorPaginationCopyWith<$Res> {
  _$CursorPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? cursor = freezed,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CursorPaginationImplCopyWith<$Res>
    implements $CursorPaginationCopyWith<$Res> {
  factory _$$CursorPaginationImplCopyWith(_$CursorPaginationImpl value,
          $Res Function(_$CursorPaginationImpl) then) =
      __$$CursorPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, String? cursor});
}

/// @nodoc
class __$$CursorPaginationImplCopyWithImpl<$Res>
    extends _$CursorPaginationCopyWithImpl<$Res, _$CursorPaginationImpl>
    implements _$$CursorPaginationImplCopyWith<$Res> {
  __$$CursorPaginationImplCopyWithImpl(_$CursorPaginationImpl _value,
      $Res Function(_$CursorPaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? cursor = freezed,
  }) {
    return _then(_$CursorPaginationImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CursorPaginationImpl
    with DiagnosticableTreeMixin
    implements _CursorPagination {
  const _$CursorPaginationImpl({required this.limit, required this.cursor});

  factory _$CursorPaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CursorPaginationImplFromJson(json);

  @override
  final int limit;
  @override
  final String? cursor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CursorPagination(limit: $limit, cursor: $cursor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CursorPagination'))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('cursor', cursor));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CursorPaginationImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.cursor, cursor) || other.cursor == cursor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, cursor);

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CursorPaginationImplCopyWith<_$CursorPaginationImpl> get copyWith =>
      __$$CursorPaginationImplCopyWithImpl<_$CursorPaginationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CursorPaginationImplToJson(
      this,
    );
  }
}

abstract class _CursorPagination implements CursorPagination {
  const factory _CursorPagination(
      {required final int limit,
      required final String? cursor}) = _$CursorPaginationImpl;

  factory _CursorPagination.fromJson(Map<String, dynamic> json) =
      _$CursorPaginationImpl.fromJson;

  @override
  int get limit;
  @override
  String? get cursor;

  /// Create a copy of CursorPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CursorPaginationImplCopyWith<_$CursorPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedPrayerRequests _$PaginatedPrayerRequestsFromJson(
    Map<String, dynamic> json) {
  return _PaginatedPrayerRequests.fromJson(json);
}

/// @nodoc
mixin _$PaginatedPrayerRequests {
  @JsonKey(name: 'has_next')
  bool get hasNext => throw _privateConstructorUsedError;
  @JsonKey(name: 'prayer_requests')
  List<PrayerRequest> get prayerRequests => throw _privateConstructorUsedError;
  CursorPagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this PaginatedPrayerRequests to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedPrayerRequests
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedPrayerRequestsCopyWith<PaginatedPrayerRequests> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedPrayerRequestsCopyWith<$Res> {
  factory $PaginatedPrayerRequestsCopyWith(PaginatedPrayerRequests value,
          $Res Function(PaginatedPrayerRequests) then) =
      _$PaginatedPrayerRequestsCopyWithImpl<$Res, PaginatedPrayerRequests>;
  @useResult
  $Res call(
      {@JsonKey(name: 'has_next') bool hasNext,
      @JsonKey(name: 'prayer_requests') List<PrayerRequest> prayerRequests,
      CursorPagination pagination});

  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$PaginatedPrayerRequestsCopyWithImpl<$Res,
        $Val extends PaginatedPrayerRequests>
    implements $PaginatedPrayerRequestsCopyWith<$Res> {
  _$PaginatedPrayerRequestsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedPrayerRequests
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNext = null,
    Object? prayerRequests = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      prayerRequests: null == prayerRequests
          ? _value.prayerRequests
          : prayerRequests // ignore: cast_nullable_to_non_nullable
              as List<PrayerRequest>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as CursorPagination,
    ) as $Val);
  }

  /// Create a copy of PaginatedPrayerRequests
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
abstract class _$$PaginatedPrayerRequestsImplCopyWith<$Res>
    implements $PaginatedPrayerRequestsCopyWith<$Res> {
  factory _$$PaginatedPrayerRequestsImplCopyWith(
          _$PaginatedPrayerRequestsImpl value,
          $Res Function(_$PaginatedPrayerRequestsImpl) then) =
      __$$PaginatedPrayerRequestsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'has_next') bool hasNext,
      @JsonKey(name: 'prayer_requests') List<PrayerRequest> prayerRequests,
      CursorPagination pagination});

  @override
  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$PaginatedPrayerRequestsImplCopyWithImpl<$Res>
    extends _$PaginatedPrayerRequestsCopyWithImpl<$Res,
        _$PaginatedPrayerRequestsImpl>
    implements _$$PaginatedPrayerRequestsImplCopyWith<$Res> {
  __$$PaginatedPrayerRequestsImplCopyWithImpl(
      _$PaginatedPrayerRequestsImpl _value,
      $Res Function(_$PaginatedPrayerRequestsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedPrayerRequests
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNext = null,
    Object? prayerRequests = null,
    Object? pagination = null,
  }) {
    return _then(_$PaginatedPrayerRequestsImpl(
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      prayerRequests: null == prayerRequests
          ? _value._prayerRequests
          : prayerRequests // ignore: cast_nullable_to_non_nullable
              as List<PrayerRequest>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as CursorPagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedPrayerRequestsImpl
    with DiagnosticableTreeMixin
    implements _PaginatedPrayerRequests {
  const _$PaginatedPrayerRequestsImpl(
      {@JsonKey(name: 'has_next') required this.hasNext,
      @JsonKey(name: 'prayer_requests')
      required final List<PrayerRequest> prayerRequests,
      required this.pagination})
      : _prayerRequests = prayerRequests;

  factory _$PaginatedPrayerRequestsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedPrayerRequestsImplFromJson(json);

  @override
  @JsonKey(name: 'has_next')
  final bool hasNext;
  final List<PrayerRequest> _prayerRequests;
  @override
  @JsonKey(name: 'prayer_requests')
  List<PrayerRequest> get prayerRequests {
    if (_prayerRequests is EqualUnmodifiableListView) return _prayerRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prayerRequests);
  }

  @override
  final CursorPagination pagination;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginatedPrayerRequests(hasNext: $hasNext, prayerRequests: $prayerRequests, pagination: $pagination)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginatedPrayerRequests'))
      ..add(DiagnosticsProperty('hasNext', hasNext))
      ..add(DiagnosticsProperty('prayerRequests', prayerRequests))
      ..add(DiagnosticsProperty('pagination', pagination));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedPrayerRequestsImpl &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            const DeepCollectionEquality()
                .equals(other._prayerRequests, _prayerRequests) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasNext,
      const DeepCollectionEquality().hash(_prayerRequests), pagination);

  /// Create a copy of PaginatedPrayerRequests
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedPrayerRequestsImplCopyWith<_$PaginatedPrayerRequestsImpl>
      get copyWith => __$$PaginatedPrayerRequestsImplCopyWithImpl<
          _$PaginatedPrayerRequestsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedPrayerRequestsImplToJson(
      this,
    );
  }
}

abstract class _PaginatedPrayerRequests implements PaginatedPrayerRequests {
  const factory _PaginatedPrayerRequests(
          {@JsonKey(name: 'has_next') required final bool hasNext,
          @JsonKey(name: 'prayer_requests')
          required final List<PrayerRequest> prayerRequests,
          required final CursorPagination pagination}) =
      _$PaginatedPrayerRequestsImpl;

  factory _PaginatedPrayerRequests.fromJson(Map<String, dynamic> json) =
      _$PaginatedPrayerRequestsImpl.fromJson;

  @override
  @JsonKey(name: 'has_next')
  bool get hasNext;
  @override
  @JsonKey(name: 'prayer_requests')
  List<PrayerRequest> get prayerRequests;
  @override
  CursorPagination get pagination;

  /// Create a copy of PaginatedPrayerRequests
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedPrayerRequestsImplCopyWith<_$PaginatedPrayerRequestsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaginatedCollections _$PaginatedCollectionsFromJson(Map<String, dynamic> json) {
  return _PaginatedCollections.fromJson(json);
}

/// @nodoc
mixin _$PaginatedCollections {
  @JsonKey(name: 'has_next')
  bool get hasNext => throw _privateConstructorUsedError;
  @JsonKey(name: 'collections')
  List<Collection> get collections => throw _privateConstructorUsedError;
  CursorPagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this PaginatedCollections to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedCollections
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedCollectionsCopyWith<PaginatedCollections> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedCollectionsCopyWith<$Res> {
  factory $PaginatedCollectionsCopyWith(PaginatedCollections value,
          $Res Function(PaginatedCollections) then) =
      _$PaginatedCollectionsCopyWithImpl<$Res, PaginatedCollections>;
  @useResult
  $Res call(
      {@JsonKey(name: 'has_next') bool hasNext,
      @JsonKey(name: 'collections') List<Collection> collections,
      CursorPagination pagination});

  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$PaginatedCollectionsCopyWithImpl<$Res,
        $Val extends PaginatedCollections>
    implements $PaginatedCollectionsCopyWith<$Res> {
  _$PaginatedCollectionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedCollections
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNext = null,
    Object? collections = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as CursorPagination,
    ) as $Val);
  }

  /// Create a copy of PaginatedCollections
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
abstract class _$$PaginatedCollectionsImplCopyWith<$Res>
    implements $PaginatedCollectionsCopyWith<$Res> {
  factory _$$PaginatedCollectionsImplCopyWith(_$PaginatedCollectionsImpl value,
          $Res Function(_$PaginatedCollectionsImpl) then) =
      __$$PaginatedCollectionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'has_next') bool hasNext,
      @JsonKey(name: 'collections') List<Collection> collections,
      CursorPagination pagination});

  @override
  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$PaginatedCollectionsImplCopyWithImpl<$Res>
    extends _$PaginatedCollectionsCopyWithImpl<$Res, _$PaginatedCollectionsImpl>
    implements _$$PaginatedCollectionsImplCopyWith<$Res> {
  __$$PaginatedCollectionsImplCopyWithImpl(_$PaginatedCollectionsImpl _value,
      $Res Function(_$PaginatedCollectionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedCollections
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasNext = null,
    Object? collections = null,
    Object? pagination = null,
  }) {
    return _then(_$PaginatedCollectionsImpl(
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      collections: null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as CursorPagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedCollectionsImpl
    with DiagnosticableTreeMixin
    implements _PaginatedCollections {
  const _$PaginatedCollectionsImpl(
      {@JsonKey(name: 'has_next') required this.hasNext,
      @JsonKey(name: 'collections') required final List<Collection> collections,
      required this.pagination})
      : _collections = collections;

  factory _$PaginatedCollectionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedCollectionsImplFromJson(json);

  @override
  @JsonKey(name: 'has_next')
  final bool hasNext;
  final List<Collection> _collections;
  @override
  @JsonKey(name: 'collections')
  List<Collection> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  @override
  final CursorPagination pagination;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginatedCollections(hasNext: $hasNext, collections: $collections, pagination: $pagination)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginatedCollections'))
      ..add(DiagnosticsProperty('hasNext', hasNext))
      ..add(DiagnosticsProperty('collections', collections))
      ..add(DiagnosticsProperty('pagination', pagination));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedCollectionsImpl &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasNext,
      const DeepCollectionEquality().hash(_collections), pagination);

  /// Create a copy of PaginatedCollections
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedCollectionsImplCopyWith<_$PaginatedCollectionsImpl>
      get copyWith =>
          __$$PaginatedCollectionsImplCopyWithImpl<_$PaginatedCollectionsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedCollectionsImplToJson(
      this,
    );
  }
}

abstract class _PaginatedCollections implements PaginatedCollections {
  const factory _PaginatedCollections(
      {@JsonKey(name: 'has_next') required final bool hasNext,
      @JsonKey(name: 'collections') required final List<Collection> collections,
      required final CursorPagination pagination}) = _$PaginatedCollectionsImpl;

  factory _PaginatedCollections.fromJson(Map<String, dynamic> json) =
      _$PaginatedCollectionsImpl.fromJson;

  @override
  @JsonKey(name: 'has_next')
  bool get hasNext;
  @override
  @JsonKey(name: 'collections')
  List<Collection> get collections;
  @override
  CursorPagination get pagination;

  /// Create a copy of PaginatedCollections
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedCollectionsImplCopyWith<_$PaginatedCollectionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
