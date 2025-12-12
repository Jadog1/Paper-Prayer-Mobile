// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pipeline_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PipelineStepDTO _$PipelineStepDTOFromJson(Map<String, dynamic> json) {
  return _PipelineStepDTO.fromJson(json);
}

/// @nodoc
mixin _$PipelineStepDTO {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'step_type')
  PipelineStepType get stepType => throw _privateConstructorUsedError;
  PipelineStepStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'attempt_count')
  int get attemptCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  String? get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  String? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_message')
  String? get errorMessage => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PipelineStepDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PipelineStepDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PipelineStepDTOCopyWith<PipelineStepDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PipelineStepDTOCopyWith<$Res> {
  factory $PipelineStepDTOCopyWith(
          PipelineStepDTO value, $Res Function(PipelineStepDTO) then) =
      _$PipelineStepDTOCopyWithImpl<$Res, PipelineStepDTO>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'step_type') PipelineStepType stepType,
      PipelineStepStatus status,
      @JsonKey(name: 'attempt_count') int attemptCount,
      @JsonKey(name: 'started_at') String? startedAt,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'error_message') String? errorMessage,
      Map<String, dynamic>? metadata,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class _$PipelineStepDTOCopyWithImpl<$Res, $Val extends PipelineStepDTO>
    implements $PipelineStepDTOCopyWith<$Res> {
  _$PipelineStepDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PipelineStepDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stepType = null,
    Object? status = null,
    Object? attemptCount = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? errorMessage = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      stepType: null == stepType
          ? _value.stepType
          : stepType // ignore: cast_nullable_to_non_nullable
              as PipelineStepType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PipelineStepStatus,
      attemptCount: null == attemptCount
          ? _value.attemptCount
          : attemptCount // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PipelineStepDTOImplCopyWith<$Res>
    implements $PipelineStepDTOCopyWith<$Res> {
  factory _$$PipelineStepDTOImplCopyWith(_$PipelineStepDTOImpl value,
          $Res Function(_$PipelineStepDTOImpl) then) =
      __$$PipelineStepDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'step_type') PipelineStepType stepType,
      PipelineStepStatus status,
      @JsonKey(name: 'attempt_count') int attemptCount,
      @JsonKey(name: 'started_at') String? startedAt,
      @JsonKey(name: 'completed_at') String? completedAt,
      @JsonKey(name: 'error_message') String? errorMessage,
      Map<String, dynamic>? metadata,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class __$$PipelineStepDTOImplCopyWithImpl<$Res>
    extends _$PipelineStepDTOCopyWithImpl<$Res, _$PipelineStepDTOImpl>
    implements _$$PipelineStepDTOImplCopyWith<$Res> {
  __$$PipelineStepDTOImplCopyWithImpl(
      _$PipelineStepDTOImpl _value, $Res Function(_$PipelineStepDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PipelineStepDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stepType = null,
    Object? status = null,
    Object? attemptCount = null,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
    Object? errorMessage = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PipelineStepDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      stepType: null == stepType
          ? _value.stepType
          : stepType // ignore: cast_nullable_to_non_nullable
              as PipelineStepType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PipelineStepStatus,
      attemptCount: null == attemptCount
          ? _value.attemptCount
          : attemptCount // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PipelineStepDTOImpl implements _PipelineStepDTO {
  const _$PipelineStepDTOImpl(
      {required this.id,
      @JsonKey(name: 'step_type') required this.stepType,
      required this.status,
      @JsonKey(name: 'attempt_count') required this.attemptCount,
      @JsonKey(name: 'started_at') this.startedAt,
      @JsonKey(name: 'completed_at') this.completedAt,
      @JsonKey(name: 'error_message') this.errorMessage,
      final Map<String, dynamic>? metadata,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _metadata = metadata;

  factory _$PipelineStepDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PipelineStepDTOImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'step_type')
  final PipelineStepType stepType;
  @override
  final PipelineStepStatus status;
  @override
  @JsonKey(name: 'attempt_count')
  final int attemptCount;
  @override
  @JsonKey(name: 'started_at')
  final String? startedAt;
  @override
  @JsonKey(name: 'completed_at')
  final String? completedAt;
  @override
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'PipelineStepDTO(id: $id, stepType: $stepType, status: $status, attemptCount: $attemptCount, startedAt: $startedAt, completedAt: $completedAt, errorMessage: $errorMessage, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PipelineStepDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stepType, stepType) ||
                other.stepType == stepType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.attemptCount, attemptCount) ||
                other.attemptCount == attemptCount) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      stepType,
      status,
      attemptCount,
      startedAt,
      completedAt,
      errorMessage,
      const DeepCollectionEquality().hash(_metadata),
      createdAt,
      updatedAt);

  /// Create a copy of PipelineStepDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PipelineStepDTOImplCopyWith<_$PipelineStepDTOImpl> get copyWith =>
      __$$PipelineStepDTOImplCopyWithImpl<_$PipelineStepDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PipelineStepDTOImplToJson(
      this,
    );
  }
}

abstract class _PipelineStepDTO implements PipelineStepDTO {
  const factory _PipelineStepDTO(
          {required final int id,
          @JsonKey(name: 'step_type') required final PipelineStepType stepType,
          required final PipelineStepStatus status,
          @JsonKey(name: 'attempt_count') required final int attemptCount,
          @JsonKey(name: 'started_at') final String? startedAt,
          @JsonKey(name: 'completed_at') final String? completedAt,
          @JsonKey(name: 'error_message') final String? errorMessage,
          final Map<String, dynamic>? metadata,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'updated_at') required final String updatedAt}) =
      _$PipelineStepDTOImpl;

  factory _PipelineStepDTO.fromJson(Map<String, dynamic> json) =
      _$PipelineStepDTOImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'step_type')
  PipelineStepType get stepType;
  @override
  PipelineStepStatus get status;
  @override
  @JsonKey(name: 'attempt_count')
  int get attemptCount;
  @override
  @JsonKey(name: 'started_at')
  String? get startedAt;
  @override
  @JsonKey(name: 'completed_at')
  String? get completedAt;
  @override
  @JsonKey(name: 'error_message')
  String? get errorMessage;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;

  /// Create a copy of PipelineStepDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PipelineStepDTOImplCopyWith<_$PipelineStepDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PipelineRunDTO _$PipelineRunDTOFromJson(Map<String, dynamic> json) {
  return _PipelineRunDTO.fromJson(json);
}

/// @nodoc
mixin _$PipelineRunDTO {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'prayer_request_id')
  int get prayerRequestId => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_id')
  int get accountId => throw _privateConstructorUsedError;
  @JsonKey(name: 'enforced_collection_id')
  int? get enforcedCollectionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  String get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  String? get completedAt => throw _privateConstructorUsedError;
  PipelineStepStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  List<PipelineStepDTO> get steps => throw _privateConstructorUsedError;

  /// Serializes this PipelineRunDTO to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PipelineRunDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PipelineRunDTOCopyWith<PipelineRunDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PipelineRunDTOCopyWith<$Res> {
  factory $PipelineRunDTOCopyWith(
          PipelineRunDTO value, $Res Function(PipelineRunDTO) then) =
      _$PipelineRunDTOCopyWithImpl<$Res, PipelineRunDTO>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'prayer_request_id') int prayerRequestId,
      @JsonKey(name: 'account_id') int accountId,
      @JsonKey(name: 'enforced_collection_id') int? enforcedCollectionId,
      @JsonKey(name: 'started_at') String startedAt,
      @JsonKey(name: 'completed_at') String? completedAt,
      PipelineStepStatus status,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      List<PipelineStepDTO> steps});
}

/// @nodoc
class _$PipelineRunDTOCopyWithImpl<$Res, $Val extends PipelineRunDTO>
    implements $PipelineRunDTOCopyWith<$Res> {
  _$PipelineRunDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PipelineRunDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prayerRequestId = null,
    Object? accountId = null,
    Object? enforcedCollectionId = freezed,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? steps = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      prayerRequestId: null == prayerRequestId
          ? _value.prayerRequestId
          : prayerRequestId // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      enforcedCollectionId: freezed == enforcedCollectionId
          ? _value.enforcedCollectionId
          : enforcedCollectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PipelineStepStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<PipelineStepDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PipelineRunDTOImplCopyWith<$Res>
    implements $PipelineRunDTOCopyWith<$Res> {
  factory _$$PipelineRunDTOImplCopyWith(_$PipelineRunDTOImpl value,
          $Res Function(_$PipelineRunDTOImpl) then) =
      __$$PipelineRunDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'prayer_request_id') int prayerRequestId,
      @JsonKey(name: 'account_id') int accountId,
      @JsonKey(name: 'enforced_collection_id') int? enforcedCollectionId,
      @JsonKey(name: 'started_at') String startedAt,
      @JsonKey(name: 'completed_at') String? completedAt,
      PipelineStepStatus status,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      List<PipelineStepDTO> steps});
}

/// @nodoc
class __$$PipelineRunDTOImplCopyWithImpl<$Res>
    extends _$PipelineRunDTOCopyWithImpl<$Res, _$PipelineRunDTOImpl>
    implements _$$PipelineRunDTOImplCopyWith<$Res> {
  __$$PipelineRunDTOImplCopyWithImpl(
      _$PipelineRunDTOImpl _value, $Res Function(_$PipelineRunDTOImpl) _then)
      : super(_value, _then);

  /// Create a copy of PipelineRunDTO
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prayerRequestId = null,
    Object? accountId = null,
    Object? enforcedCollectionId = freezed,
    Object? startedAt = null,
    Object? completedAt = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? steps = null,
  }) {
    return _then(_$PipelineRunDTOImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      prayerRequestId: null == prayerRequestId
          ? _value.prayerRequestId
          : prayerRequestId // ignore: cast_nullable_to_non_nullable
              as int,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      enforcedCollectionId: freezed == enforcedCollectionId
          ? _value.enforcedCollectionId
          : enforcedCollectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PipelineStepStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      steps: null == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<PipelineStepDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PipelineRunDTOImpl implements _PipelineRunDTO {
  const _$PipelineRunDTOImpl(
      {required this.id,
      @JsonKey(name: 'prayer_request_id') required this.prayerRequestId,
      @JsonKey(name: 'account_id') required this.accountId,
      @JsonKey(name: 'enforced_collection_id') this.enforcedCollectionId,
      @JsonKey(name: 'started_at') required this.startedAt,
      @JsonKey(name: 'completed_at') this.completedAt,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required final List<PipelineStepDTO> steps})
      : _steps = steps;

  factory _$PipelineRunDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PipelineRunDTOImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'prayer_request_id')
  final int prayerRequestId;
  @override
  @JsonKey(name: 'account_id')
  final int accountId;
  @override
  @JsonKey(name: 'enforced_collection_id')
  final int? enforcedCollectionId;
  @override
  @JsonKey(name: 'started_at')
  final String startedAt;
  @override
  @JsonKey(name: 'completed_at')
  final String? completedAt;
  @override
  final PipelineStepStatus status;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final List<PipelineStepDTO> _steps;
  @override
  List<PipelineStepDTO> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  String toString() {
    return 'PipelineRunDTO(id: $id, prayerRequestId: $prayerRequestId, accountId: $accountId, enforcedCollectionId: $enforcedCollectionId, startedAt: $startedAt, completedAt: $completedAt, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PipelineRunDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prayerRequestId, prayerRequestId) ||
                other.prayerRequestId == prayerRequestId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.enforcedCollectionId, enforcedCollectionId) ||
                other.enforcedCollectionId == enforcedCollectionId) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      prayerRequestId,
      accountId,
      enforcedCollectionId,
      startedAt,
      completedAt,
      status,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_steps));

  /// Create a copy of PipelineRunDTO
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PipelineRunDTOImplCopyWith<_$PipelineRunDTOImpl> get copyWith =>
      __$$PipelineRunDTOImplCopyWithImpl<_$PipelineRunDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PipelineRunDTOImplToJson(
      this,
    );
  }
}

abstract class _PipelineRunDTO implements PipelineRunDTO {
  const factory _PipelineRunDTO(
      {required final String id,
      @JsonKey(name: 'prayer_request_id') required final int prayerRequestId,
      @JsonKey(name: 'account_id') required final int accountId,
      @JsonKey(name: 'enforced_collection_id') final int? enforcedCollectionId,
      @JsonKey(name: 'started_at') required final String startedAt,
      @JsonKey(name: 'completed_at') final String? completedAt,
      required final PipelineStepStatus status,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      required final List<PipelineStepDTO> steps}) = _$PipelineRunDTOImpl;

  factory _PipelineRunDTO.fromJson(Map<String, dynamic> json) =
      _$PipelineRunDTOImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'prayer_request_id')
  int get prayerRequestId;
  @override
  @JsonKey(name: 'account_id')
  int get accountId;
  @override
  @JsonKey(name: 'enforced_collection_id')
  int? get enforcedCollectionId;
  @override
  @JsonKey(name: 'started_at')
  String get startedAt;
  @override
  @JsonKey(name: 'completed_at')
  String? get completedAt;
  @override
  PipelineStepStatus get status;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  List<PipelineStepDTO> get steps;

  /// Create a copy of PipelineRunDTO
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PipelineRunDTOImplCopyWith<_$PipelineRunDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
