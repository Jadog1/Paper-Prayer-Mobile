// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../usage_cost_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UsageCostSummary _$UsageCostSummaryFromJson(Map<String, dynamic> json) {
  return _UsageCostSummary.fromJson(json);
}

/// @nodoc
mixin _$UsageCostSummary {
  @JsonKey(name: 'total_cost')
  double get totalCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_requests')
  int get totalRequests => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tokens')
  int get totalTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String get endDate => throw _privateConstructorUsedError;
  List<UsageCostBreakdown> get breakdown => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_spend_limit')
  int get monthlySpendLimit => throw _privateConstructorUsedError;

  /// Serializes this UsageCostSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsageCostSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsageCostSummaryCopyWith<UsageCostSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCostSummaryCopyWith<$Res> {
  factory $UsageCostSummaryCopyWith(
          UsageCostSummary value, $Res Function(UsageCostSummary) then) =
      _$UsageCostSummaryCopyWithImpl<$Res, UsageCostSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_cost') double totalCost,
      @JsonKey(name: 'total_requests') int totalRequests,
      @JsonKey(name: 'total_tokens') int totalTokens,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      List<UsageCostBreakdown> breakdown,
      @JsonKey(name: 'monthly_spend_limit') int monthlySpendLimit});
}

/// @nodoc
class _$UsageCostSummaryCopyWithImpl<$Res, $Val extends UsageCostSummary>
    implements $UsageCostSummaryCopyWith<$Res> {
  _$UsageCostSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsageCostSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCost = null,
    Object? totalRequests = null,
    Object? totalTokens = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? breakdown = null,
    Object? monthlySpendLimit = null,
  }) {
    return _then(_value.copyWith(
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalRequests: null == totalRequests
          ? _value.totalRequests
          : totalRequests // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      breakdown: null == breakdown
          ? _value.breakdown
          : breakdown // ignore: cast_nullable_to_non_nullable
              as List<UsageCostBreakdown>,
      monthlySpendLimit: null == monthlySpendLimit
          ? _value.monthlySpendLimit
          : monthlySpendLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageCostSummaryImplCopyWith<$Res>
    implements $UsageCostSummaryCopyWith<$Res> {
  factory _$$UsageCostSummaryImplCopyWith(_$UsageCostSummaryImpl value,
          $Res Function(_$UsageCostSummaryImpl) then) =
      __$$UsageCostSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_cost') double totalCost,
      @JsonKey(name: 'total_requests') int totalRequests,
      @JsonKey(name: 'total_tokens') int totalTokens,
      @JsonKey(name: 'start_date') String startDate,
      @JsonKey(name: 'end_date') String endDate,
      List<UsageCostBreakdown> breakdown,
      @JsonKey(name: 'monthly_spend_limit') int monthlySpendLimit});
}

/// @nodoc
class __$$UsageCostSummaryImplCopyWithImpl<$Res>
    extends _$UsageCostSummaryCopyWithImpl<$Res, _$UsageCostSummaryImpl>
    implements _$$UsageCostSummaryImplCopyWith<$Res> {
  __$$UsageCostSummaryImplCopyWithImpl(_$UsageCostSummaryImpl _value,
      $Res Function(_$UsageCostSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsageCostSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCost = null,
    Object? totalRequests = null,
    Object? totalTokens = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? breakdown = null,
    Object? monthlySpendLimit = null,
  }) {
    return _then(_$UsageCostSummaryImpl(
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      totalRequests: null == totalRequests
          ? _value.totalRequests
          : totalRequests // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      breakdown: null == breakdown
          ? _value._breakdown
          : breakdown // ignore: cast_nullable_to_non_nullable
              as List<UsageCostBreakdown>,
      monthlySpendLimit: null == monthlySpendLimit
          ? _value.monthlySpendLimit
          : monthlySpendLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsageCostSummaryImpl
    with DiagnosticableTreeMixin
    implements _UsageCostSummary {
  const _$UsageCostSummaryImpl(
      {@JsonKey(name: 'total_cost') required this.totalCost,
      @JsonKey(name: 'total_requests') required this.totalRequests,
      @JsonKey(name: 'total_tokens') required this.totalTokens,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      required final List<UsageCostBreakdown> breakdown,
      @JsonKey(name: 'monthly_spend_limit') required this.monthlySpendLimit})
      : _breakdown = breakdown;

  factory _$UsageCostSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsageCostSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'total_cost')
  final double totalCost;
  @override
  @JsonKey(name: 'total_requests')
  final int totalRequests;
  @override
  @JsonKey(name: 'total_tokens')
  final int totalTokens;
  @override
  @JsonKey(name: 'start_date')
  final String startDate;
  @override
  @JsonKey(name: 'end_date')
  final String endDate;
  final List<UsageCostBreakdown> _breakdown;
  @override
  List<UsageCostBreakdown> get breakdown {
    if (_breakdown is EqualUnmodifiableListView) return _breakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breakdown);
  }

  @override
  @JsonKey(name: 'monthly_spend_limit')
  final int monthlySpendLimit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UsageCostSummary(totalCost: $totalCost, totalRequests: $totalRequests, totalTokens: $totalTokens, startDate: $startDate, endDate: $endDate, breakdown: $breakdown, monthlySpendLimit: $monthlySpendLimit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UsageCostSummary'))
      ..add(DiagnosticsProperty('totalCost', totalCost))
      ..add(DiagnosticsProperty('totalRequests', totalRequests))
      ..add(DiagnosticsProperty('totalTokens', totalTokens))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate))
      ..add(DiagnosticsProperty('breakdown', breakdown))
      ..add(DiagnosticsProperty('monthlySpendLimit', monthlySpendLimit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageCostSummaryImpl &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.totalRequests, totalRequests) ||
                other.totalRequests == totalRequests) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            const DeepCollectionEquality()
                .equals(other._breakdown, _breakdown) &&
            (identical(other.monthlySpendLimit, monthlySpendLimit) ||
                other.monthlySpendLimit == monthlySpendLimit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalCost,
      totalRequests,
      totalTokens,
      startDate,
      endDate,
      const DeepCollectionEquality().hash(_breakdown),
      monthlySpendLimit);

  /// Create a copy of UsageCostSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageCostSummaryImplCopyWith<_$UsageCostSummaryImpl> get copyWith =>
      __$$UsageCostSummaryImplCopyWithImpl<_$UsageCostSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsageCostSummaryImplToJson(
      this,
    );
  }
}

abstract class _UsageCostSummary implements UsageCostSummary {
  const factory _UsageCostSummary(
      {@JsonKey(name: 'total_cost') required final double totalCost,
      @JsonKey(name: 'total_requests') required final int totalRequests,
      @JsonKey(name: 'total_tokens') required final int totalTokens,
      @JsonKey(name: 'start_date') required final String startDate,
      @JsonKey(name: 'end_date') required final String endDate,
      required final List<UsageCostBreakdown> breakdown,
      @JsonKey(name: 'monthly_spend_limit')
      required final int monthlySpendLimit}) = _$UsageCostSummaryImpl;

  factory _UsageCostSummary.fromJson(Map<String, dynamic> json) =
      _$UsageCostSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'total_cost')
  double get totalCost;
  @override
  @JsonKey(name: 'total_requests')
  int get totalRequests;
  @override
  @JsonKey(name: 'total_tokens')
  int get totalTokens;
  @override
  @JsonKey(name: 'start_date')
  String get startDate;
  @override
  @JsonKey(name: 'end_date')
  String get endDate;
  @override
  List<UsageCostBreakdown> get breakdown;
  @override
  @JsonKey(name: 'monthly_spend_limit')
  int get monthlySpendLimit;

  /// Create a copy of UsageCostSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsageCostSummaryImplCopyWith<_$UsageCostSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UsageCostBreakdown _$UsageCostBreakdownFromJson(Map<String, dynamic> json) {
  return _UsageCostBreakdown.fromJson(json);
}

/// @nodoc
mixin _$UsageCostBreakdown {
  String get model => throw _privateConstructorUsedError;
  String get caller => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_requests')
  int get totalRequests => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tokens')
  int get totalTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'prompt_tokens')
  int get promptTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_tokens')
  int get completionTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'cached_tokens')
  int get cachedTokens => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cost')
  double get totalCost => throw _privateConstructorUsedError;

  /// Serializes this UsageCostBreakdown to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UsageCostBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsageCostBreakdownCopyWith<UsageCostBreakdown> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageCostBreakdownCopyWith<$Res> {
  factory $UsageCostBreakdownCopyWith(
          UsageCostBreakdown value, $Res Function(UsageCostBreakdown) then) =
      _$UsageCostBreakdownCopyWithImpl<$Res, UsageCostBreakdown>;
  @useResult
  $Res call(
      {String model,
      String caller,
      @JsonKey(name: 'total_requests') int totalRequests,
      @JsonKey(name: 'total_tokens') int totalTokens,
      @JsonKey(name: 'prompt_tokens') int promptTokens,
      @JsonKey(name: 'completion_tokens') int completionTokens,
      @JsonKey(name: 'cached_tokens') int cachedTokens,
      @JsonKey(name: 'total_cost') double totalCost});
}

/// @nodoc
class _$UsageCostBreakdownCopyWithImpl<$Res, $Val extends UsageCostBreakdown>
    implements $UsageCostBreakdownCopyWith<$Res> {
  _$UsageCostBreakdownCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsageCostBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? caller = null,
    Object? totalRequests = null,
    Object? totalTokens = null,
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? cachedTokens = null,
    Object? totalCost = null,
  }) {
    return _then(_value.copyWith(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      caller: null == caller
          ? _value.caller
          : caller // ignore: cast_nullable_to_non_nullable
              as String,
      totalRequests: null == totalRequests
          ? _value.totalRequests
          : totalRequests // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      cachedTokens: null == cachedTokens
          ? _value.cachedTokens
          : cachedTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsageCostBreakdownImplCopyWith<$Res>
    implements $UsageCostBreakdownCopyWith<$Res> {
  factory _$$UsageCostBreakdownImplCopyWith(_$UsageCostBreakdownImpl value,
          $Res Function(_$UsageCostBreakdownImpl) then) =
      __$$UsageCostBreakdownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String model,
      String caller,
      @JsonKey(name: 'total_requests') int totalRequests,
      @JsonKey(name: 'total_tokens') int totalTokens,
      @JsonKey(name: 'prompt_tokens') int promptTokens,
      @JsonKey(name: 'completion_tokens') int completionTokens,
      @JsonKey(name: 'cached_tokens') int cachedTokens,
      @JsonKey(name: 'total_cost') double totalCost});
}

/// @nodoc
class __$$UsageCostBreakdownImplCopyWithImpl<$Res>
    extends _$UsageCostBreakdownCopyWithImpl<$Res, _$UsageCostBreakdownImpl>
    implements _$$UsageCostBreakdownImplCopyWith<$Res> {
  __$$UsageCostBreakdownImplCopyWithImpl(_$UsageCostBreakdownImpl _value,
      $Res Function(_$UsageCostBreakdownImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsageCostBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
    Object? caller = null,
    Object? totalRequests = null,
    Object? totalTokens = null,
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? cachedTokens = null,
    Object? totalCost = null,
  }) {
    return _then(_$UsageCostBreakdownImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      caller: null == caller
          ? _value.caller
          : caller // ignore: cast_nullable_to_non_nullable
              as String,
      totalRequests: null == totalRequests
          ? _value.totalRequests
          : totalRequests // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      cachedTokens: null == cachedTokens
          ? _value.cachedTokens
          : cachedTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UsageCostBreakdownImpl
    with DiagnosticableTreeMixin
    implements _UsageCostBreakdown {
  const _$UsageCostBreakdownImpl(
      {required this.model,
      required this.caller,
      @JsonKey(name: 'total_requests') required this.totalRequests,
      @JsonKey(name: 'total_tokens') required this.totalTokens,
      @JsonKey(name: 'prompt_tokens') required this.promptTokens,
      @JsonKey(name: 'completion_tokens') required this.completionTokens,
      @JsonKey(name: 'cached_tokens') required this.cachedTokens,
      @JsonKey(name: 'total_cost') required this.totalCost});

  factory _$UsageCostBreakdownImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsageCostBreakdownImplFromJson(json);

  @override
  final String model;
  @override
  final String caller;
  @override
  @JsonKey(name: 'total_requests')
  final int totalRequests;
  @override
  @JsonKey(name: 'total_tokens')
  final int totalTokens;
  @override
  @JsonKey(name: 'prompt_tokens')
  final int promptTokens;
  @override
  @JsonKey(name: 'completion_tokens')
  final int completionTokens;
  @override
  @JsonKey(name: 'cached_tokens')
  final int cachedTokens;
  @override
  @JsonKey(name: 'total_cost')
  final double totalCost;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UsageCostBreakdown(model: $model, caller: $caller, totalRequests: $totalRequests, totalTokens: $totalTokens, promptTokens: $promptTokens, completionTokens: $completionTokens, cachedTokens: $cachedTokens, totalCost: $totalCost)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UsageCostBreakdown'))
      ..add(DiagnosticsProperty('model', model))
      ..add(DiagnosticsProperty('caller', caller))
      ..add(DiagnosticsProperty('totalRequests', totalRequests))
      ..add(DiagnosticsProperty('totalTokens', totalTokens))
      ..add(DiagnosticsProperty('promptTokens', promptTokens))
      ..add(DiagnosticsProperty('completionTokens', completionTokens))
      ..add(DiagnosticsProperty('cachedTokens', cachedTokens))
      ..add(DiagnosticsProperty('totalCost', totalCost));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsageCostBreakdownImpl &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.caller, caller) || other.caller == caller) &&
            (identical(other.totalRequests, totalRequests) ||
                other.totalRequests == totalRequests) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens) &&
            (identical(other.promptTokens, promptTokens) ||
                other.promptTokens == promptTokens) &&
            (identical(other.completionTokens, completionTokens) ||
                other.completionTokens == completionTokens) &&
            (identical(other.cachedTokens, cachedTokens) ||
                other.cachedTokens == cachedTokens) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, model, caller, totalRequests,
      totalTokens, promptTokens, completionTokens, cachedTokens, totalCost);

  /// Create a copy of UsageCostBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsageCostBreakdownImplCopyWith<_$UsageCostBreakdownImpl> get copyWith =>
      __$$UsageCostBreakdownImplCopyWithImpl<_$UsageCostBreakdownImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UsageCostBreakdownImplToJson(
      this,
    );
  }
}

abstract class _UsageCostBreakdown implements UsageCostBreakdown {
  const factory _UsageCostBreakdown(
      {required final String model,
      required final String caller,
      @JsonKey(name: 'total_requests') required final int totalRequests,
      @JsonKey(name: 'total_tokens') required final int totalTokens,
      @JsonKey(name: 'prompt_tokens') required final int promptTokens,
      @JsonKey(name: 'completion_tokens') required final int completionTokens,
      @JsonKey(name: 'cached_tokens') required final int cachedTokens,
      @JsonKey(name: 'total_cost')
      required final double totalCost}) = _$UsageCostBreakdownImpl;

  factory _UsageCostBreakdown.fromJson(Map<String, dynamic> json) =
      _$UsageCostBreakdownImpl.fromJson;

  @override
  String get model;
  @override
  String get caller;
  @override
  @JsonKey(name: 'total_requests')
  int get totalRequests;
  @override
  @JsonKey(name: 'total_tokens')
  int get totalTokens;
  @override
  @JsonKey(name: 'prompt_tokens')
  int get promptTokens;
  @override
  @JsonKey(name: 'completion_tokens')
  int get completionTokens;
  @override
  @JsonKey(name: 'cached_tokens')
  int get cachedTokens;
  @override
  @JsonKey(name: 'total_cost')
  double get totalCost;

  /// Create a copy of UsageCostBreakdown
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsageCostBreakdownImplCopyWith<_$UsageCostBreakdownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
