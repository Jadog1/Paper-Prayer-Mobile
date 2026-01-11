// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../usage_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedGenAIUsageHistory _$PaginatedGenAIUsageHistoryFromJson(
    Map<String, dynamic> json) {
  return _PaginatedGenAIUsageHistory.fromJson(json);
}

/// @nodoc
mixin _$PaginatedGenAIUsageHistory {
  List<GenAIUsageHistoryItem> get items => throw _privateConstructorUsedError;
  GenAIUsageHistoryPagination get pagination =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'has_next')
  bool get hasNext => throw _privateConstructorUsedError;

  /// Serializes this PaginatedGenAIUsageHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedGenAIUsageHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedGenAIUsageHistoryCopyWith<PaginatedGenAIUsageHistory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedGenAIUsageHistoryCopyWith<$Res> {
  factory $PaginatedGenAIUsageHistoryCopyWith(PaginatedGenAIUsageHistory value,
          $Res Function(PaginatedGenAIUsageHistory) then) =
      _$PaginatedGenAIUsageHistoryCopyWithImpl<$Res,
          PaginatedGenAIUsageHistory>;
  @useResult
  $Res call(
      {List<GenAIUsageHistoryItem> items,
      GenAIUsageHistoryPagination pagination,
      @JsonKey(name: 'has_next') bool hasNext});

  $GenAIUsageHistoryPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$PaginatedGenAIUsageHistoryCopyWithImpl<$Res,
        $Val extends PaginatedGenAIUsageHistory>
    implements $PaginatedGenAIUsageHistoryCopyWith<$Res> {
  _$PaginatedGenAIUsageHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedGenAIUsageHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? pagination = null,
    Object? hasNext = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GenAIUsageHistoryItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as GenAIUsageHistoryPagination,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of PaginatedGenAIUsageHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenAIUsageHistoryPaginationCopyWith<$Res> get pagination {
    return $GenAIUsageHistoryPaginationCopyWith<$Res>(_value.pagination,
        (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaginatedGenAIUsageHistoryImplCopyWith<$Res>
    implements $PaginatedGenAIUsageHistoryCopyWith<$Res> {
  factory _$$PaginatedGenAIUsageHistoryImplCopyWith(
          _$PaginatedGenAIUsageHistoryImpl value,
          $Res Function(_$PaginatedGenAIUsageHistoryImpl) then) =
      __$$PaginatedGenAIUsageHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<GenAIUsageHistoryItem> items,
      GenAIUsageHistoryPagination pagination,
      @JsonKey(name: 'has_next') bool hasNext});

  @override
  $GenAIUsageHistoryPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$PaginatedGenAIUsageHistoryImplCopyWithImpl<$Res>
    extends _$PaginatedGenAIUsageHistoryCopyWithImpl<$Res,
        _$PaginatedGenAIUsageHistoryImpl>
    implements _$$PaginatedGenAIUsageHistoryImplCopyWith<$Res> {
  __$$PaginatedGenAIUsageHistoryImplCopyWithImpl(
      _$PaginatedGenAIUsageHistoryImpl _value,
      $Res Function(_$PaginatedGenAIUsageHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedGenAIUsageHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? pagination = null,
    Object? hasNext = null,
  }) {
    return _then(_$PaginatedGenAIUsageHistoryImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<GenAIUsageHistoryItem>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as GenAIUsageHistoryPagination,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginatedGenAIUsageHistoryImpl
    with DiagnosticableTreeMixin
    implements _PaginatedGenAIUsageHistory {
  const _$PaginatedGenAIUsageHistoryImpl(
      {required final List<GenAIUsageHistoryItem> items,
      required this.pagination,
      @JsonKey(name: 'has_next') required this.hasNext})
      : _items = items;

  factory _$PaginatedGenAIUsageHistoryImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PaginatedGenAIUsageHistoryImplFromJson(json);

  final List<GenAIUsageHistoryItem> _items;
  @override
  List<GenAIUsageHistoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final GenAIUsageHistoryPagination pagination;
  @override
  @JsonKey(name: 'has_next')
  final bool hasNext;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginatedGenAIUsageHistory(items: $items, pagination: $pagination, hasNext: $hasNext)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginatedGenAIUsageHistory'))
      ..add(DiagnosticsProperty('items', items))
      ..add(DiagnosticsProperty('pagination', pagination))
      ..add(DiagnosticsProperty('hasNext', hasNext));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedGenAIUsageHistoryImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_items), pagination, hasNext);

  /// Create a copy of PaginatedGenAIUsageHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedGenAIUsageHistoryImplCopyWith<_$PaginatedGenAIUsageHistoryImpl>
      get copyWith => __$$PaginatedGenAIUsageHistoryImplCopyWithImpl<
          _$PaginatedGenAIUsageHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedGenAIUsageHistoryImplToJson(
      this,
    );
  }
}

abstract class _PaginatedGenAIUsageHistory
    implements PaginatedGenAIUsageHistory {
  const factory _PaginatedGenAIUsageHistory(
          {required final List<GenAIUsageHistoryItem> items,
          required final GenAIUsageHistoryPagination pagination,
          @JsonKey(name: 'has_next') required final bool hasNext}) =
      _$PaginatedGenAIUsageHistoryImpl;

  factory _PaginatedGenAIUsageHistory.fromJson(Map<String, dynamic> json) =
      _$PaginatedGenAIUsageHistoryImpl.fromJson;

  @override
  List<GenAIUsageHistoryItem> get items;
  @override
  GenAIUsageHistoryPagination get pagination;
  @override
  @JsonKey(name: 'has_next')
  bool get hasNext;

  /// Create a copy of PaginatedGenAIUsageHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedGenAIUsageHistoryImplCopyWith<_$PaginatedGenAIUsageHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GenAIUsageHistoryPagination _$GenAIUsageHistoryPaginationFromJson(
    Map<String, dynamic> json) {
  return _GenAIUsageHistoryPagination.fromJson(json);
}

/// @nodoc
mixin _$GenAIUsageHistoryPagination {
  String? get cursor => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Serializes this GenAIUsageHistoryPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenAIUsageHistoryPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenAIUsageHistoryPaginationCopyWith<GenAIUsageHistoryPagination>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenAIUsageHistoryPaginationCopyWith<$Res> {
  factory $GenAIUsageHistoryPaginationCopyWith(
          GenAIUsageHistoryPagination value,
          $Res Function(GenAIUsageHistoryPagination) then) =
      _$GenAIUsageHistoryPaginationCopyWithImpl<$Res,
          GenAIUsageHistoryPagination>;
  @useResult
  $Res call({String? cursor, int limit});
}

/// @nodoc
class _$GenAIUsageHistoryPaginationCopyWithImpl<$Res,
        $Val extends GenAIUsageHistoryPagination>
    implements $GenAIUsageHistoryPaginationCopyWith<$Res> {
  _$GenAIUsageHistoryPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenAIUsageHistoryPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenAIUsageHistoryPaginationImplCopyWith<$Res>
    implements $GenAIUsageHistoryPaginationCopyWith<$Res> {
  factory _$$GenAIUsageHistoryPaginationImplCopyWith(
          _$GenAIUsageHistoryPaginationImpl value,
          $Res Function(_$GenAIUsageHistoryPaginationImpl) then) =
      __$$GenAIUsageHistoryPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? cursor, int limit});
}

/// @nodoc
class __$$GenAIUsageHistoryPaginationImplCopyWithImpl<$Res>
    extends _$GenAIUsageHistoryPaginationCopyWithImpl<$Res,
        _$GenAIUsageHistoryPaginationImpl>
    implements _$$GenAIUsageHistoryPaginationImplCopyWith<$Res> {
  __$$GenAIUsageHistoryPaginationImplCopyWithImpl(
      _$GenAIUsageHistoryPaginationImpl _value,
      $Res Function(_$GenAIUsageHistoryPaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenAIUsageHistoryPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cursor = freezed,
    Object? limit = null,
  }) {
    return _then(_$GenAIUsageHistoryPaginationImpl(
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenAIUsageHistoryPaginationImpl
    with DiagnosticableTreeMixin
    implements _GenAIUsageHistoryPagination {
  const _$GenAIUsageHistoryPaginationImpl({this.cursor, required this.limit});

  factory _$GenAIUsageHistoryPaginationImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GenAIUsageHistoryPaginationImplFromJson(json);

  @override
  final String? cursor;
  @override
  final int limit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenAIUsageHistoryPagination(cursor: $cursor, limit: $limit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GenAIUsageHistoryPagination'))
      ..add(DiagnosticsProperty('cursor', cursor))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenAIUsageHistoryPaginationImpl &&
            (identical(other.cursor, cursor) || other.cursor == cursor) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cursor, limit);

  /// Create a copy of GenAIUsageHistoryPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenAIUsageHistoryPaginationImplCopyWith<_$GenAIUsageHistoryPaginationImpl>
      get copyWith => __$$GenAIUsageHistoryPaginationImplCopyWithImpl<
          _$GenAIUsageHistoryPaginationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenAIUsageHistoryPaginationImplToJson(
      this,
    );
  }
}

abstract class _GenAIUsageHistoryPagination
    implements GenAIUsageHistoryPagination {
  const factory _GenAIUsageHistoryPagination(
      {final String? cursor,
      required final int limit}) = _$GenAIUsageHistoryPaginationImpl;

  factory _GenAIUsageHistoryPagination.fromJson(Map<String, dynamic> json) =
      _$GenAIUsageHistoryPaginationImpl.fromJson;

  @override
  String? get cursor;
  @override
  int get limit;

  /// Create a copy of GenAIUsageHistoryPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenAIUsageHistoryPaginationImplCopyWith<_$GenAIUsageHistoryPaginationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GenAIUsageHistoryItem _$GenAIUsageHistoryItemFromJson(
    Map<String, dynamic> json) {
  return _GenAIUsageHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$GenAIUsageHistoryItem {
  GenAIUsage get usage => throw _privateConstructorUsedError;
  @JsonKey(name: 'prayer_request')
  PrayerRequest? get prayerRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'paper_study_title')
  String? get paperStudyTitle => throw _privateConstructorUsedError;
  UsageCostDetail? get cost => throw _privateConstructorUsedError;

  /// Serializes this GenAIUsageHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenAIUsageHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenAIUsageHistoryItemCopyWith<GenAIUsageHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenAIUsageHistoryItemCopyWith<$Res> {
  factory $GenAIUsageHistoryItemCopyWith(GenAIUsageHistoryItem value,
          $Res Function(GenAIUsageHistoryItem) then) =
      _$GenAIUsageHistoryItemCopyWithImpl<$Res, GenAIUsageHistoryItem>;
  @useResult
  $Res call(
      {GenAIUsage usage,
      @JsonKey(name: 'prayer_request') PrayerRequest? prayerRequest,
      @JsonKey(name: 'paper_study_title') String? paperStudyTitle,
      UsageCostDetail? cost});

  $GenAIUsageCopyWith<$Res> get usage;
  $PrayerRequestCopyWith<$Res>? get prayerRequest;
  $UsageCostDetailCopyWith<$Res>? get cost;
}

/// @nodoc
class _$GenAIUsageHistoryItemCopyWithImpl<$Res,
        $Val extends GenAIUsageHistoryItem>
    implements $GenAIUsageHistoryItemCopyWith<$Res> {
  _$GenAIUsageHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenAIUsageHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usage = null,
    Object? prayerRequest = freezed,
    Object? paperStudyTitle = freezed,
    Object? cost = freezed,
  }) {
    return _then(_value.copyWith(
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as GenAIUsage,
      prayerRequest: freezed == prayerRequest
          ? _value.prayerRequest
          : prayerRequest // ignore: cast_nullable_to_non_nullable
              as PrayerRequest?,
      paperStudyTitle: freezed == paperStudyTitle
          ? _value.paperStudyTitle
          : paperStudyTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as UsageCostDetail?,
    ) as $Val);
  }

  /// Create a copy of GenAIUsageHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenAIUsageCopyWith<$Res> get usage {
    return $GenAIUsageCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }

  /// Create a copy of GenAIUsageHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrayerRequestCopyWith<$Res>? get prayerRequest {
    if (_value.prayerRequest == null) {
      return null;
    }

    return $PrayerRequestCopyWith<$Res>(_value.prayerRequest!, (value) {
      return _then(_value.copyWith(prayerRequest: value) as $Val);
    });
  }

  /// Create a copy of GenAIUsageHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UsageCostDetailCopyWith<$Res>? get cost {
    if (_value.cost == null) {
      return null;
    }

    return $UsageCostDetailCopyWith<$Res>(_value.cost!, (value) {
      return _then(_value.copyWith(cost: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenAIUsageHistoryItemImplCopyWith<$Res>
    implements $GenAIUsageHistoryItemCopyWith<$Res> {
  factory _$$GenAIUsageHistoryItemImplCopyWith(
          _$GenAIUsageHistoryItemImpl value,
          $Res Function(_$GenAIUsageHistoryItemImpl) then) =
      __$$GenAIUsageHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GenAIUsage usage,
      @JsonKey(name: 'prayer_request') PrayerRequest? prayerRequest,
      @JsonKey(name: 'paper_study_title') String? paperStudyTitle,
      UsageCostDetail? cost});

  @override
  $GenAIUsageCopyWith<$Res> get usage;
  @override
  $PrayerRequestCopyWith<$Res>? get prayerRequest;
  @override
  $UsageCostDetailCopyWith<$Res>? get cost;
}

/// @nodoc
class __$$GenAIUsageHistoryItemImplCopyWithImpl<$Res>
    extends _$GenAIUsageHistoryItemCopyWithImpl<$Res,
        _$GenAIUsageHistoryItemImpl>
    implements _$$GenAIUsageHistoryItemImplCopyWith<$Res> {
  __$$GenAIUsageHistoryItemImplCopyWithImpl(_$GenAIUsageHistoryItemImpl _value,
      $Res Function(_$GenAIUsageHistoryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenAIUsageHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usage = null,
    Object? prayerRequest = freezed,
    Object? paperStudyTitle = freezed,
    Object? cost = freezed,
  }) {
    return _then(_$GenAIUsageHistoryItemImpl(
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as GenAIUsage,
      prayerRequest: freezed == prayerRequest
          ? _value.prayerRequest
          : prayerRequest // ignore: cast_nullable_to_non_nullable
              as PrayerRequest?,
      paperStudyTitle: freezed == paperStudyTitle
          ? _value.paperStudyTitle
          : paperStudyTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      cost: freezed == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as UsageCostDetail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenAIUsageHistoryItemImpl
    with DiagnosticableTreeMixin
    implements _GenAIUsageHistoryItem {
  const _$GenAIUsageHistoryItemImpl(
      {required this.usage,
      @JsonKey(name: 'prayer_request') this.prayerRequest,
      @JsonKey(name: 'paper_study_title') this.paperStudyTitle,
      this.cost});

  factory _$GenAIUsageHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenAIUsageHistoryItemImplFromJson(json);

  @override
  final GenAIUsage usage;
  @override
  @JsonKey(name: 'prayer_request')
  final PrayerRequest? prayerRequest;
  @override
  @JsonKey(name: 'paper_study_title')
  final String? paperStudyTitle;
  @override
  final UsageCostDetail? cost;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenAIUsageHistoryItem(usage: $usage, prayerRequest: $prayerRequest, paperStudyTitle: $paperStudyTitle, cost: $cost)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GenAIUsageHistoryItem'))
      ..add(DiagnosticsProperty('usage', usage))
      ..add(DiagnosticsProperty('prayerRequest', prayerRequest))
      ..add(DiagnosticsProperty('paperStudyTitle', paperStudyTitle))
      ..add(DiagnosticsProperty('cost', cost));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenAIUsageHistoryItemImpl &&
            (identical(other.usage, usage) || other.usage == usage) &&
            (identical(other.prayerRequest, prayerRequest) ||
                other.prayerRequest == prayerRequest) &&
            (identical(other.paperStudyTitle, paperStudyTitle) ||
                other.paperStudyTitle == paperStudyTitle) &&
            (identical(other.cost, cost) || other.cost == cost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, usage, prayerRequest, paperStudyTitle, cost);

  /// Create a copy of GenAIUsageHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenAIUsageHistoryItemImplCopyWith<_$GenAIUsageHistoryItemImpl>
      get copyWith => __$$GenAIUsageHistoryItemImplCopyWithImpl<
          _$GenAIUsageHistoryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenAIUsageHistoryItemImplToJson(
      this,
    );
  }
}

abstract class _GenAIUsageHistoryItem implements GenAIUsageHistoryItem {
  const factory _GenAIUsageHistoryItem(
      {required final GenAIUsage usage,
      @JsonKey(name: 'prayer_request') final PrayerRequest? prayerRequest,
      @JsonKey(name: 'paper_study_title') final String? paperStudyTitle,
      final UsageCostDetail? cost}) = _$GenAIUsageHistoryItemImpl;

  factory _GenAIUsageHistoryItem.fromJson(Map<String, dynamic> json) =
      _$GenAIUsageHistoryItemImpl.fromJson;

  @override
  GenAIUsage get usage;
  @override
  @JsonKey(name: 'prayer_request')
  PrayerRequest? get prayerRequest;
  @override
  @JsonKey(name: 'paper_study_title')
  String? get paperStudyTitle;
  @override
  UsageCostDetail? get cost;

  /// Create a copy of GenAIUsageHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenAIUsageHistoryItemImplCopyWith<_$GenAIUsageHistoryItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}

GenAIUsage _$GenAIUsageFromJson(Map<String, dynamic> json) {
  return _GenAIUsage.fromJson(json);
}

/// @nodoc
mixin _$GenAIUsage {
  int get id => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'tokens_used')
  int? get tokensUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'prompt_tokens')
  int? get promptTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_tokens')
  int? get completionTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'cached_tokens')
  int? get cachedTokens => throw _privateConstructorUsedError;
  String get caller => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  int get accountId => throw _privateConstructorUsedError;
  String get endpoint => throw _privateConstructorUsedError;
  @JsonKey(name: 'request_metadata')
  Map<String, dynamic> get requestMetadata =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'prayer_request_pipeline_step_id')
  int? get prayerRequestPipelineStepId => throw _privateConstructorUsedError;
  @JsonKey(name: 'paper_study_pipeline_step_id')
  int? get paperStudyPipelineStepId => throw _privateConstructorUsedError;

  /// Serializes this GenAIUsage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenAIUsage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenAIUsageCopyWith<GenAIUsage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenAIUsageCopyWith<$Res> {
  factory $GenAIUsageCopyWith(
          GenAIUsage value, $Res Function(GenAIUsage) then) =
      _$GenAIUsageCopyWithImpl<$Res, GenAIUsage>;
  @useResult
  $Res call(
      {int id,
      String model,
      @JsonKey(name: 'tokens_used') int? tokensUsed,
      @JsonKey(name: 'prompt_tokens') int? promptTokens,
      @JsonKey(name: 'completion_tokens') int? completionTokens,
      @JsonKey(name: 'cached_tokens') int? cachedTokens,
      String caller,
      @JsonKey(name: 'account_id') int accountId,
      String endpoint,
      @JsonKey(name: 'request_metadata') Map<String, dynamic> requestMetadata,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'prayer_request_pipeline_step_id')
      int? prayerRequestPipelineStepId,
      @JsonKey(name: 'paper_study_pipeline_step_id')
      int? paperStudyPipelineStepId});
}

/// @nodoc
class _$GenAIUsageCopyWithImpl<$Res, $Val extends GenAIUsage>
    implements $GenAIUsageCopyWith<$Res> {
  _$GenAIUsageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenAIUsage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? model = null,
    Object? tokensUsed = freezed,
    Object? promptTokens = freezed,
    Object? completionTokens = freezed,
    Object? cachedTokens = freezed,
    Object? caller = null,
    Object? accountId = null,
    Object? endpoint = null,
    Object? requestMetadata = null,
    Object? createdAt = null,
    Object? prayerRequestPipelineStepId = freezed,
    Object? paperStudyPipelineStepId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      tokensUsed: freezed == tokensUsed
          ? _value.tokensUsed
          : tokensUsed // ignore: cast_nullable_to_non_nullable
              as int?,
      promptTokens: freezed == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      completionTokens: freezed == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      cachedTokens: freezed == cachedTokens
          ? _value.cachedTokens
          : cachedTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      caller: null == caller
          ? _value.caller
          : caller // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      requestMetadata: null == requestMetadata
          ? _value.requestMetadata
          : requestMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      prayerRequestPipelineStepId: freezed == prayerRequestPipelineStepId
          ? _value.prayerRequestPipelineStepId
          : prayerRequestPipelineStepId // ignore: cast_nullable_to_non_nullable
              as int?,
      paperStudyPipelineStepId: freezed == paperStudyPipelineStepId
          ? _value.paperStudyPipelineStepId
          : paperStudyPipelineStepId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenAIUsageImplCopyWith<$Res>
    implements $GenAIUsageCopyWith<$Res> {
  factory _$$GenAIUsageImplCopyWith(
          _$GenAIUsageImpl value, $Res Function(_$GenAIUsageImpl) then) =
      __$$GenAIUsageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String model,
      @JsonKey(name: 'tokens_used') int? tokensUsed,
      @JsonKey(name: 'prompt_tokens') int? promptTokens,
      @JsonKey(name: 'completion_tokens') int? completionTokens,
      @JsonKey(name: 'cached_tokens') int? cachedTokens,
      String caller,
      @JsonKey(name: 'account_id') int accountId,
      String endpoint,
      @JsonKey(name: 'request_metadata') Map<String, dynamic> requestMetadata,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'prayer_request_pipeline_step_id')
      int? prayerRequestPipelineStepId,
      @JsonKey(name: 'paper_study_pipeline_step_id')
      int? paperStudyPipelineStepId});
}

/// @nodoc
class __$$GenAIUsageImplCopyWithImpl<$Res>
    extends _$GenAIUsageCopyWithImpl<$Res, _$GenAIUsageImpl>
    implements _$$GenAIUsageImplCopyWith<$Res> {
  __$$GenAIUsageImplCopyWithImpl(
      _$GenAIUsageImpl _value, $Res Function(_$GenAIUsageImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenAIUsage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? model = null,
    Object? tokensUsed = freezed,
    Object? promptTokens = freezed,
    Object? completionTokens = freezed,
    Object? cachedTokens = freezed,
    Object? caller = null,
    Object? accountId = null,
    Object? endpoint = null,
    Object? requestMetadata = null,
    Object? createdAt = null,
    Object? prayerRequestPipelineStepId = freezed,
    Object? paperStudyPipelineStepId = freezed,
  }) {
    return _then(_$GenAIUsageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      tokensUsed: freezed == tokensUsed
          ? _value.tokensUsed
          : tokensUsed // ignore: cast_nullable_to_non_nullable
              as int?,
      promptTokens: freezed == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      completionTokens: freezed == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      cachedTokens: freezed == cachedTokens
          ? _value.cachedTokens
          : cachedTokens // ignore: cast_nullable_to_non_nullable
              as int?,
      caller: null == caller
          ? _value.caller
          : caller // ignore: cast_nullable_to_non_nullable
              as String,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      endpoint: null == endpoint
          ? _value.endpoint
          : endpoint // ignore: cast_nullable_to_non_nullable
              as String,
      requestMetadata: null == requestMetadata
          ? _value._requestMetadata
          : requestMetadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      prayerRequestPipelineStepId: freezed == prayerRequestPipelineStepId
          ? _value.prayerRequestPipelineStepId
          : prayerRequestPipelineStepId // ignore: cast_nullable_to_non_nullable
              as int?,
      paperStudyPipelineStepId: freezed == paperStudyPipelineStepId
          ? _value.paperStudyPipelineStepId
          : paperStudyPipelineStepId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenAIUsageImpl with DiagnosticableTreeMixin implements _GenAIUsage {
  const _$GenAIUsageImpl(
      {required this.id,
      required this.model,
      @JsonKey(name: 'tokens_used') this.tokensUsed,
      @JsonKey(name: 'prompt_tokens') this.promptTokens,
      @JsonKey(name: 'completion_tokens') this.completionTokens,
      @JsonKey(name: 'cached_tokens') this.cachedTokens,
      required this.caller,
      @JsonKey(name: 'account_id') required this.accountId,
      required this.endpoint,
      @JsonKey(name: 'request_metadata')
      final Map<String, dynamic> requestMetadata = const {},
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'prayer_request_pipeline_step_id')
      this.prayerRequestPipelineStepId,
      @JsonKey(name: 'paper_study_pipeline_step_id')
      this.paperStudyPipelineStepId})
      : _requestMetadata = requestMetadata;

  factory _$GenAIUsageImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenAIUsageImplFromJson(json);

  @override
  final int id;
  @override
  final String model;
  @override
  @JsonKey(name: 'tokens_used')
  final int? tokensUsed;
  @override
  @JsonKey(name: 'prompt_tokens')
  final int? promptTokens;
  @override
  @JsonKey(name: 'completion_tokens')
  final int? completionTokens;
  @override
  @JsonKey(name: 'cached_tokens')
  final int? cachedTokens;
  @override
  final String caller;
  @override
  @JsonKey(name: 'account_id')
  final int accountId;
  @override
  final String endpoint;
  final Map<String, dynamic> _requestMetadata;
  @override
  @JsonKey(name: 'request_metadata')
  Map<String, dynamic> get requestMetadata {
    if (_requestMetadata is EqualUnmodifiableMapView) return _requestMetadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_requestMetadata);
  }

  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'prayer_request_pipeline_step_id')
  final int? prayerRequestPipelineStepId;
  @override
  @JsonKey(name: 'paper_study_pipeline_step_id')
  final int? paperStudyPipelineStepId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenAIUsage(id: $id, model: $model, tokensUsed: $tokensUsed, promptTokens: $promptTokens, completionTokens: $completionTokens, cachedTokens: $cachedTokens, caller: $caller, accountId: $accountId, endpoint: $endpoint, requestMetadata: $requestMetadata, createdAt: $createdAt, prayerRequestPipelineStepId: $prayerRequestPipelineStepId, paperStudyPipelineStepId: $paperStudyPipelineStepId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GenAIUsage'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('model', model))
      ..add(DiagnosticsProperty('tokensUsed', tokensUsed))
      ..add(DiagnosticsProperty('promptTokens', promptTokens))
      ..add(DiagnosticsProperty('completionTokens', completionTokens))
      ..add(DiagnosticsProperty('cachedTokens', cachedTokens))
      ..add(DiagnosticsProperty('caller', caller))
      ..add(DiagnosticsProperty('accountId', accountId))
      ..add(DiagnosticsProperty('endpoint', endpoint))
      ..add(DiagnosticsProperty('requestMetadata', requestMetadata))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty(
          'prayerRequestPipelineStepId', prayerRequestPipelineStepId))
      ..add(DiagnosticsProperty(
          'paperStudyPipelineStepId', paperStudyPipelineStepId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenAIUsageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.tokensUsed, tokensUsed) ||
                other.tokensUsed == tokensUsed) &&
            (identical(other.promptTokens, promptTokens) ||
                other.promptTokens == promptTokens) &&
            (identical(other.completionTokens, completionTokens) ||
                other.completionTokens == completionTokens) &&
            (identical(other.cachedTokens, cachedTokens) ||
                other.cachedTokens == cachedTokens) &&
            (identical(other.caller, caller) || other.caller == caller) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.endpoint, endpoint) ||
                other.endpoint == endpoint) &&
            const DeepCollectionEquality()
                .equals(other._requestMetadata, _requestMetadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.prayerRequestPipelineStepId,
                    prayerRequestPipelineStepId) ||
                other.prayerRequestPipelineStepId ==
                    prayerRequestPipelineStepId) &&
            (identical(
                    other.paperStudyPipelineStepId, paperStudyPipelineStepId) ||
                other.paperStudyPipelineStepId == paperStudyPipelineStepId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      model,
      tokensUsed,
      promptTokens,
      completionTokens,
      cachedTokens,
      caller,
      accountId,
      endpoint,
      const DeepCollectionEquality().hash(_requestMetadata),
      createdAt,
      prayerRequestPipelineStepId,
      paperStudyPipelineStepId);

  /// Create a copy of GenAIUsage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenAIUsageImplCopyWith<_$GenAIUsageImpl> get copyWith =>
      __$$GenAIUsageImplCopyWithImpl<_$GenAIUsageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenAIUsageImplToJson(
      this,
    );
  }
}

abstract class _GenAIUsage implements GenAIUsage {
  const factory _GenAIUsage(
      {required final int id,
      required final String model,
      @JsonKey(name: 'tokens_used') final int? tokensUsed,
      @JsonKey(name: 'prompt_tokens') final int? promptTokens,
      @JsonKey(name: 'completion_tokens') final int? completionTokens,
      @JsonKey(name: 'cached_tokens') final int? cachedTokens,
      required final String caller,
      @JsonKey(name: 'account_id') required final int accountId,
      required final String endpoint,
      @JsonKey(name: 'request_metadata')
      final Map<String, dynamic> requestMetadata,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'prayer_request_pipeline_step_id')
      final int? prayerRequestPipelineStepId,
      @JsonKey(name: 'paper_study_pipeline_step_id')
      final int? paperStudyPipelineStepId}) = _$GenAIUsageImpl;

  factory _GenAIUsage.fromJson(Map<String, dynamic> json) =
      _$GenAIUsageImpl.fromJson;

  @override
  int get id;
  @override
  String get model;
  @override
  @JsonKey(name: 'tokens_used')
  int? get tokensUsed;
  @override
  @JsonKey(name: 'prompt_tokens')
  int? get promptTokens;
  @override
  @JsonKey(name: 'completion_tokens')
  int? get completionTokens;
  @override
  @JsonKey(name: 'cached_tokens')
  int? get cachedTokens;
  @override
  String get caller;
  @override
  @JsonKey(name: 'account_id')
  int get accountId;
  @override
  String get endpoint;
  @override
  @JsonKey(name: 'request_metadata')
  Map<String, dynamic> get requestMetadata;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'prayer_request_pipeline_step_id')
  int? get prayerRequestPipelineStepId;
  @override
  @JsonKey(name: 'paper_study_pipeline_step_id')
  int? get paperStudyPipelineStepId;

  /// Create a copy of GenAIUsage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenAIUsageImplCopyWith<_$GenAIUsageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UsageCostDetail _$UsageCostDetailFromJson(Map<String, dynamic> json) {
  return _UsageCostDetail.fromJson(json);
}

/// @nodoc
mixin _$UsageCostDetail {
  @JsonKey(name: 'prompt_cost')
  double get promptCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_cost')
  double get completionCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'cached_cost')
  double get cachedCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cost')
  double get totalCost => throw _privateConstructorUsedError;

  /// Serializes this UsageCostDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsageCostDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsageCostDetailCopyWith<UsageCostDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCostDetailCopyWith<$Res> {
  factory $UsageCostDetailCopyWith(
          UsageCostDetail value, $Res Function(UsageCostDetail) then) =
      _$UsageCostDetailCopyWithImpl<$Res, UsageCostDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'prompt_cost') double promptCost,
      @JsonKey(name: 'completion_cost') double completionCost,
      @JsonKey(name: 'cached_cost') double cachedCost,
      @JsonKey(name: 'total_cost') double totalCost});
}

/// @nodoc
class _$UsageCostDetailCopyWithImpl<$Res, $Val extends UsageCostDetail>
    implements $UsageCostDetailCopyWith<$Res> {
  _$UsageCostDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsageCostDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptCost = null,
    Object? completionCost = null,
    Object? cachedCost = null,
    Object? totalCost = null,
  }) {
    return _then(_value.copyWith(
      promptCost: null == promptCost
          ? _value.promptCost
          : promptCost // ignore: cast_nullable_to_non_nullable
              as double,
      completionCost: null == completionCost
          ? _value.completionCost
          : completionCost // ignore: cast_nullable_to_non_nullable
              as double,
      cachedCost: null == cachedCost
          ? _value.cachedCost
          : cachedCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageCostDetailImplCopyWith<$Res>
    implements $UsageCostDetailCopyWith<$Res> {
  factory _$$UsageCostDetailImplCopyWith(_$UsageCostDetailImpl value,
          $Res Function(_$UsageCostDetailImpl) then) =
      __$$UsageCostDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'prompt_cost') double promptCost,
      @JsonKey(name: 'completion_cost') double completionCost,
      @JsonKey(name: 'cached_cost') double cachedCost,
      @JsonKey(name: 'total_cost') double totalCost});
}

/// @nodoc
class __$$UsageCostDetailImplCopyWithImpl<$Res>
    extends _$UsageCostDetailCopyWithImpl<$Res, _$UsageCostDetailImpl>
    implements _$$UsageCostDetailImplCopyWith<$Res> {
  __$$UsageCostDetailImplCopyWithImpl(
      _$UsageCostDetailImpl _value, $Res Function(_$UsageCostDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsageCostDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptCost = null,
    Object? completionCost = null,
    Object? cachedCost = null,
    Object? totalCost = null,
  }) {
    return _then(_$UsageCostDetailImpl(
      promptCost: null == promptCost
          ? _value.promptCost
          : promptCost // ignore: cast_nullable_to_non_nullable
              as double,
      completionCost: null == completionCost
          ? _value.completionCost
          : completionCost // ignore: cast_nullable_to_non_nullable
              as double,
      cachedCost: null == cachedCost
          ? _value.cachedCost
          : cachedCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsageCostDetailImpl
    with DiagnosticableTreeMixin
    implements _UsageCostDetail {
  const _$UsageCostDetailImpl(
      {@JsonKey(name: 'prompt_cost') required this.promptCost,
      @JsonKey(name: 'completion_cost') required this.completionCost,
      @JsonKey(name: 'cached_cost') required this.cachedCost,
      @JsonKey(name: 'total_cost') required this.totalCost});

  factory _$UsageCostDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsageCostDetailImplFromJson(json);

  @override
  @JsonKey(name: 'prompt_cost')
  final double promptCost;
  @override
  @JsonKey(name: 'completion_cost')
  final double completionCost;
  @override
  @JsonKey(name: 'cached_cost')
  final double cachedCost;
  @override
  @JsonKey(name: 'total_cost')
  final double totalCost;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UsageCostDetail(promptCost: $promptCost, completionCost: $completionCost, cachedCost: $cachedCost, totalCost: $totalCost)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UsageCostDetail'))
      ..add(DiagnosticsProperty('promptCost', promptCost))
      ..add(DiagnosticsProperty('completionCost', completionCost))
      ..add(DiagnosticsProperty('cachedCost', cachedCost))
      ..add(DiagnosticsProperty('totalCost', totalCost));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageCostDetailImpl &&
            (identical(other.promptCost, promptCost) ||
                other.promptCost == promptCost) &&
            (identical(other.completionCost, completionCost) ||
                other.completionCost == completionCost) &&
            (identical(other.cachedCost, cachedCost) ||
                other.cachedCost == cachedCost) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, promptCost, completionCost, cachedCost, totalCost);

  /// Create a copy of UsageCostDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageCostDetailImplCopyWith<_$UsageCostDetailImpl> get copyWith =>
      __$$UsageCostDetailImplCopyWithImpl<_$UsageCostDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsageCostDetailImplToJson(
      this,
    );
  }
}

abstract class _UsageCostDetail implements UsageCostDetail {
  const factory _UsageCostDetail(
      {@JsonKey(name: 'prompt_cost') required final double promptCost,
      @JsonKey(name: 'completion_cost') required final double completionCost,
      @JsonKey(name: 'cached_cost') required final double cachedCost,
      @JsonKey(name: 'total_cost')
      required final double totalCost}) = _$UsageCostDetailImpl;

  factory _UsageCostDetail.fromJson(Map<String, dynamic> json) =
      _$UsageCostDetailImpl.fromJson;

  @override
  @JsonKey(name: 'prompt_cost')
  double get promptCost;
  @override
  @JsonKey(name: 'completion_cost')
  double get completionCost;
  @override
  @JsonKey(name: 'cached_cost')
  double get cachedCost;
  @override
  @JsonKey(name: 'total_cost')
  double get totalCost;

  /// Create a copy of UsageCostDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsageCostDetailImplCopyWith<_$UsageCostDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
