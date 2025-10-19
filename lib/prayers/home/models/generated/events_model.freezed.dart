// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../events_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrayerCollectionEvent _$PrayerCollectionEventFromJson(
    Map<String, dynamic> json) {
  return _PrayerCollectionEvent.fromJson(json);
}

/// @nodoc
mixin _$PrayerCollectionEvent {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "event_start")
  String get eventStart => throw _privateConstructorUsedError;
  @JsonKey(name: "event_end")
  String? get eventEnd => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;

  /// Serializes this PrayerCollectionEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrayerCollectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrayerCollectionEventCopyWith<PrayerCollectionEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerCollectionEventCopyWith<$Res> {
  factory $PrayerCollectionEventCopyWith(PrayerCollectionEvent value,
          $Res Function(PrayerCollectionEvent) then) =
      _$PrayerCollectionEventCopyWithImpl<$Res, PrayerCollectionEvent>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "event_start") String eventStart,
      @JsonKey(name: "event_end") String? eventEnd,
      String? summary});
}

/// @nodoc
class _$PrayerCollectionEventCopyWithImpl<$Res,
        $Val extends PrayerCollectionEvent>
    implements $PrayerCollectionEventCopyWith<$Res> {
  _$PrayerCollectionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrayerCollectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? eventStart = null,
    Object? eventEnd = freezed,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      eventStart: null == eventStart
          ? _value.eventStart
          : eventStart // ignore: cast_nullable_to_non_nullable
              as String,
      eventEnd: freezed == eventEnd
          ? _value.eventEnd
          : eventEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrayerCollectionEventImplCopyWith<$Res>
    implements $PrayerCollectionEventCopyWith<$Res> {
  factory _$$PrayerCollectionEventImplCopyWith(
          _$PrayerCollectionEventImpl value,
          $Res Function(_$PrayerCollectionEventImpl) then) =
      __$$PrayerCollectionEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt,
      @JsonKey(name: "event_start") String eventStart,
      @JsonKey(name: "event_end") String? eventEnd,
      String? summary});
}

/// @nodoc
class __$$PrayerCollectionEventImplCopyWithImpl<$Res>
    extends _$PrayerCollectionEventCopyWithImpl<$Res,
        _$PrayerCollectionEventImpl>
    implements _$$PrayerCollectionEventImplCopyWith<$Res> {
  __$$PrayerCollectionEventImplCopyWithImpl(_$PrayerCollectionEventImpl _value,
      $Res Function(_$PrayerCollectionEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerCollectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? eventStart = null,
    Object? eventEnd = freezed,
    Object? summary = freezed,
  }) {
    return _then(_$PrayerCollectionEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      eventStart: null == eventStart
          ? _value.eventStart
          : eventStart // ignore: cast_nullable_to_non_nullable
              as String,
      eventEnd: freezed == eventEnd
          ? _value.eventEnd
          : eventEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PrayerCollectionEventImpl
    with DiagnosticableTreeMixin
    implements _PrayerCollectionEvent {
  const _$PrayerCollectionEventImpl(
      {required this.id,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: "event_start") required this.eventStart,
      @JsonKey(name: "event_end") this.eventEnd,
      this.summary});

  factory _$PrayerCollectionEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrayerCollectionEventImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @override
  @JsonKey(name: "event_start")
  final String eventStart;
  @override
  @JsonKey(name: "event_end")
  final String? eventEnd;
  @override
  final String? summary;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerCollectionEvent(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, eventStart: $eventStart, eventEnd: $eventEnd, summary: $summary)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerCollectionEvent'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('eventStart', eventStart))
      ..add(DiagnosticsProperty('eventEnd', eventEnd))
      ..add(DiagnosticsProperty('summary', summary));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrayerCollectionEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.eventStart, eventStart) ||
                other.eventStart == eventStart) &&
            (identical(other.eventEnd, eventEnd) ||
                other.eventEnd == eventEnd) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updatedAt, eventStart, eventEnd, summary);

  /// Create a copy of PrayerCollectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrayerCollectionEventImplCopyWith<_$PrayerCollectionEventImpl>
      get copyWith => __$$PrayerCollectionEventImplCopyWithImpl<
          _$PrayerCollectionEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrayerCollectionEventImplToJson(
      this,
    );
  }
}

abstract class _PrayerCollectionEvent implements PrayerCollectionEvent {
  const factory _PrayerCollectionEvent(
      {required final int id,
      @JsonKey(name: "created_at") required final String createdAt,
      @JsonKey(name: "updated_at") required final String updatedAt,
      @JsonKey(name: "event_start") required final String eventStart,
      @JsonKey(name: "event_end") final String? eventEnd,
      final String? summary}) = _$PrayerCollectionEventImpl;

  factory _PrayerCollectionEvent.fromJson(Map<String, dynamic> json) =
      _$PrayerCollectionEventImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;
  @override
  @JsonKey(name: "event_start")
  String get eventStart;
  @override
  @JsonKey(name: "event_end")
  String? get eventEnd;
  @override
  String? get summary;

  /// Create a copy of PrayerCollectionEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerCollectionEventImplCopyWith<_$PrayerCollectionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PrayerCollectionEventLink _$PrayerCollectionEventLinkFromJson(
    Map<String, dynamic> json) {
  return _PrayerCollectionEventLink.fromJson(json);
}

/// @nodoc
mixin _$PrayerCollectionEventLink {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "prayer_request_id")
  int get prayerRequestId => throw _privateConstructorUsedError;
  @JsonKey(name: "prayer_collection_event_id")
  int get prayerCollectionEventId => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this PrayerCollectionEventLink to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrayerCollectionEventLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrayerCollectionEventLinkCopyWith<PrayerCollectionEventLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrayerCollectionEventLinkCopyWith<$Res> {
  factory $PrayerCollectionEventLinkCopyWith(PrayerCollectionEventLink value,
          $Res Function(PrayerCollectionEventLink) then) =
      _$PrayerCollectionEventLinkCopyWithImpl<$Res, PrayerCollectionEventLink>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "prayer_request_id") int prayerRequestId,
      @JsonKey(name: "prayer_collection_event_id") int prayerCollectionEventId,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt});
}

/// @nodoc
class _$PrayerCollectionEventLinkCopyWithImpl<$Res,
        $Val extends PrayerCollectionEventLink>
    implements $PrayerCollectionEventLinkCopyWith<$Res> {
  _$PrayerCollectionEventLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrayerCollectionEventLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prayerRequestId = null,
    Object? prayerCollectionEventId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      prayerRequestId: null == prayerRequestId
          ? _value.prayerRequestId
          : prayerRequestId // ignore: cast_nullable_to_non_nullable
              as int,
      prayerCollectionEventId: null == prayerCollectionEventId
          ? _value.prayerCollectionEventId
          : prayerCollectionEventId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$PrayerCollectionEventLinkImplCopyWith<$Res>
    implements $PrayerCollectionEventLinkCopyWith<$Res> {
  factory _$$PrayerCollectionEventLinkImplCopyWith(
          _$PrayerCollectionEventLinkImpl value,
          $Res Function(_$PrayerCollectionEventLinkImpl) then) =
      __$$PrayerCollectionEventLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: "prayer_request_id") int prayerRequestId,
      @JsonKey(name: "prayer_collection_event_id") int prayerCollectionEventId,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "updated_at") String updatedAt});
}

/// @nodoc
class __$$PrayerCollectionEventLinkImplCopyWithImpl<$Res>
    extends _$PrayerCollectionEventLinkCopyWithImpl<$Res,
        _$PrayerCollectionEventLinkImpl>
    implements _$$PrayerCollectionEventLinkImplCopyWith<$Res> {
  __$$PrayerCollectionEventLinkImplCopyWithImpl(
      _$PrayerCollectionEventLinkImpl _value,
      $Res Function(_$PrayerCollectionEventLinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrayerCollectionEventLink
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? prayerRequestId = null,
    Object? prayerCollectionEventId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PrayerCollectionEventLinkImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      prayerRequestId: null == prayerRequestId
          ? _value.prayerRequestId
          : prayerRequestId // ignore: cast_nullable_to_non_nullable
              as int,
      prayerCollectionEventId: null == prayerCollectionEventId
          ? _value.prayerCollectionEventId
          : prayerCollectionEventId // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$PrayerCollectionEventLinkImpl
    with DiagnosticableTreeMixin
    implements _PrayerCollectionEventLink {
  const _$PrayerCollectionEventLinkImpl(
      {required this.id,
      @JsonKey(name: "prayer_request_id") required this.prayerRequestId,
      @JsonKey(name: "prayer_collection_event_id")
      required this.prayerCollectionEventId,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt});

  factory _$PrayerCollectionEventLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrayerCollectionEventLinkImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: "prayer_request_id")
  final int prayerRequestId;
  @override
  @JsonKey(name: "prayer_collection_event_id")
  final int prayerCollectionEventId;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PrayerCollectionEventLink(id: $id, prayerRequestId: $prayerRequestId, prayerCollectionEventId: $prayerCollectionEventId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PrayerCollectionEventLink'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('prayerRequestId', prayerRequestId))
      ..add(DiagnosticsProperty(
          'prayerCollectionEventId', prayerCollectionEventId))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrayerCollectionEventLinkImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prayerRequestId, prayerRequestId) ||
                other.prayerRequestId == prayerRequestId) &&
            (identical(
                    other.prayerCollectionEventId, prayerCollectionEventId) ||
                other.prayerCollectionEventId == prayerCollectionEventId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, prayerRequestId,
      prayerCollectionEventId, createdAt, updatedAt);

  /// Create a copy of PrayerCollectionEventLink
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrayerCollectionEventLinkImplCopyWith<_$PrayerCollectionEventLinkImpl>
      get copyWith => __$$PrayerCollectionEventLinkImplCopyWithImpl<
          _$PrayerCollectionEventLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrayerCollectionEventLinkImplToJson(
      this,
    );
  }
}

abstract class _PrayerCollectionEventLink implements PrayerCollectionEventLink {
  const factory _PrayerCollectionEventLink(
      {required final int id,
      @JsonKey(name: "prayer_request_id") required final int prayerRequestId,
      @JsonKey(name: "prayer_collection_event_id")
      required final int prayerCollectionEventId,
      @JsonKey(name: "created_at") required final String createdAt,
      @JsonKey(name: "updated_at")
      required final String updatedAt}) = _$PrayerCollectionEventLinkImpl;

  factory _PrayerCollectionEventLink.fromJson(Map<String, dynamic> json) =
      _$PrayerCollectionEventLinkImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: "prayer_request_id")
  int get prayerRequestId;
  @override
  @JsonKey(name: "prayer_collection_event_id")
  int get prayerCollectionEventId;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String get updatedAt;

  /// Create a copy of PrayerCollectionEventLink
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrayerCollectionEventLinkImplCopyWith<_$PrayerCollectionEventLinkImpl>
      get copyWith => throw _privateConstructorUsedError;
}

EventWithCollection _$EventWithCollectionFromJson(Map<String, dynamic> json) {
  return _EventWithCollection.fromJson(json);
}

/// @nodoc
mixin _$EventWithCollection {
  PrayerCollectionEvent get event => throw _privateConstructorUsedError;
  Collection get collection => throw _privateConstructorUsedError;

  /// Serializes this EventWithCollection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventWithCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventWithCollectionCopyWith<EventWithCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventWithCollectionCopyWith<$Res> {
  factory $EventWithCollectionCopyWith(
          EventWithCollection value, $Res Function(EventWithCollection) then) =
      _$EventWithCollectionCopyWithImpl<$Res, EventWithCollection>;
  @useResult
  $Res call({PrayerCollectionEvent event, Collection collection});

  $PrayerCollectionEventCopyWith<$Res> get event;
  $CollectionCopyWith<$Res> get collection;
}

/// @nodoc
class _$EventWithCollectionCopyWithImpl<$Res, $Val extends EventWithCollection>
    implements $EventWithCollectionCopyWith<$Res> {
  _$EventWithCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventWithCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? collection = null,
  }) {
    return _then(_value.copyWith(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as PrayerCollectionEvent,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection,
    ) as $Val);
  }

  /// Create a copy of EventWithCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrayerCollectionEventCopyWith<$Res> get event {
    return $PrayerCollectionEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }

  /// Create a copy of EventWithCollection
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
abstract class _$$EventWithCollectionImplCopyWith<$Res>
    implements $EventWithCollectionCopyWith<$Res> {
  factory _$$EventWithCollectionImplCopyWith(_$EventWithCollectionImpl value,
          $Res Function(_$EventWithCollectionImpl) then) =
      __$$EventWithCollectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PrayerCollectionEvent event, Collection collection});

  @override
  $PrayerCollectionEventCopyWith<$Res> get event;
  @override
  $CollectionCopyWith<$Res> get collection;
}

/// @nodoc
class __$$EventWithCollectionImplCopyWithImpl<$Res>
    extends _$EventWithCollectionCopyWithImpl<$Res, _$EventWithCollectionImpl>
    implements _$$EventWithCollectionImplCopyWith<$Res> {
  __$$EventWithCollectionImplCopyWithImpl(_$EventWithCollectionImpl _value,
      $Res Function(_$EventWithCollectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventWithCollection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? collection = null,
  }) {
    return _then(_$EventWithCollectionImpl(
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as PrayerCollectionEvent,
      collection: null == collection
          ? _value.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventWithCollectionImpl
    with DiagnosticableTreeMixin
    implements _EventWithCollection {
  const _$EventWithCollectionImpl(
      {required this.event, required this.collection});

  factory _$EventWithCollectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventWithCollectionImplFromJson(json);

  @override
  final PrayerCollectionEvent event;
  @override
  final Collection collection;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventWithCollection(event: $event, collection: $collection)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventWithCollection'))
      ..add(DiagnosticsProperty('event', event))
      ..add(DiagnosticsProperty('collection', collection));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventWithCollectionImpl &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, event, collection);

  /// Create a copy of EventWithCollection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventWithCollectionImplCopyWith<_$EventWithCollectionImpl> get copyWith =>
      __$$EventWithCollectionImplCopyWithImpl<_$EventWithCollectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventWithCollectionImplToJson(
      this,
    );
  }
}

abstract class _EventWithCollection implements EventWithCollection {
  const factory _EventWithCollection(
      {required final PrayerCollectionEvent event,
      required final Collection collection}) = _$EventWithCollectionImpl;

  factory _EventWithCollection.fromJson(Map<String, dynamic> json) =
      _$EventWithCollectionImpl.fromJson;

  @override
  PrayerCollectionEvent get event;
  @override
  Collection get collection;

  /// Create a copy of EventWithCollection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventWithCollectionImplCopyWith<_$EventWithCollectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginatedEvents _$PaginatedEventsFromJson(Map<String, dynamic> json) {
  return _PaginatedEvents.fromJson(json);
}

/// @nodoc
mixin _$PaginatedEvents {
  List<EventWithCollection> get events => throw _privateConstructorUsedError;
  CursorPagination get pagination => throw _privateConstructorUsedError;
  @JsonKey(name: "has_next")
  bool get hasNext => throw _privateConstructorUsedError;

  /// Serializes this PaginatedEvents to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedEventsCopyWith<PaginatedEvents> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedEventsCopyWith<$Res> {
  factory $PaginatedEventsCopyWith(
          PaginatedEvents value, $Res Function(PaginatedEvents) then) =
      _$PaginatedEventsCopyWithImpl<$Res, PaginatedEvents>;
  @useResult
  $Res call(
      {List<EventWithCollection> events,
      CursorPagination pagination,
      @JsonKey(name: "has_next") bool hasNext});

  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$PaginatedEventsCopyWithImpl<$Res, $Val extends PaginatedEvents>
    implements $PaginatedEventsCopyWith<$Res> {
  _$PaginatedEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedEvents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? pagination = null,
    Object? hasNext = null,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventWithCollection>,
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

  /// Create a copy of PaginatedEvents
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
abstract class _$$PaginatedEventsImplCopyWith<$Res>
    implements $PaginatedEventsCopyWith<$Res> {
  factory _$$PaginatedEventsImplCopyWith(_$PaginatedEventsImpl value,
          $Res Function(_$PaginatedEventsImpl) then) =
      __$$PaginatedEventsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventWithCollection> events,
      CursorPagination pagination,
      @JsonKey(name: "has_next") bool hasNext});

  @override
  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$PaginatedEventsImplCopyWithImpl<$Res>
    extends _$PaginatedEventsCopyWithImpl<$Res, _$PaginatedEventsImpl>
    implements _$$PaginatedEventsImplCopyWith<$Res> {
  __$$PaginatedEventsImplCopyWithImpl(
      _$PaginatedEventsImpl _value, $Res Function(_$PaginatedEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedEvents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? pagination = null,
    Object? hasNext = null,
  }) {
    return _then(_$PaginatedEventsImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventWithCollection>,
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
class _$PaginatedEventsImpl
    with DiagnosticableTreeMixin
    implements _PaginatedEvents {
  const _$PaginatedEventsImpl(
      {required final List<EventWithCollection> events,
      required this.pagination,
      @JsonKey(name: "has_next") this.hasNext = false})
      : _events = events;

  factory _$PaginatedEventsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginatedEventsImplFromJson(json);

  final List<EventWithCollection> _events;
  @override
  List<EventWithCollection> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final CursorPagination pagination;
  @override
  @JsonKey(name: "has_next")
  final bool hasNext;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaginatedEvents(events: $events, pagination: $pagination, hasNext: $hasNext)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaginatedEvents'))
      ..add(DiagnosticsProperty('events', events))
      ..add(DiagnosticsProperty('pagination', pagination))
      ..add(DiagnosticsProperty('hasNext', hasNext));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedEventsImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_events), pagination, hasNext);

  /// Create a copy of PaginatedEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedEventsImplCopyWith<_$PaginatedEventsImpl> get copyWith =>
      __$$PaginatedEventsImplCopyWithImpl<_$PaginatedEventsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginatedEventsImplToJson(
      this,
    );
  }
}

abstract class _PaginatedEvents implements PaginatedEvents {
  const factory _PaginatedEvents(
      {required final List<EventWithCollection> events,
      required final CursorPagination pagination,
      @JsonKey(name: "has_next") final bool hasNext}) = _$PaginatedEventsImpl;

  factory _PaginatedEvents.fromJson(Map<String, dynamic> json) =
      _$PaginatedEventsImpl.fromJson;

  @override
  List<EventWithCollection> get events;
  @override
  CursorPagination get pagination;
  @override
  @JsonKey(name: "has_next")
  bool get hasNext;

  /// Create a copy of PaginatedEvents
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedEventsImplCopyWith<_$PaginatedEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetEventsRequest _$GetEventsRequestFromJson(Map<String, dynamic> json) {
  return _GetEventsRequest.fromJson(json);
}

/// @nodoc
mixin _$GetEventsRequest {
  @JsonKey(name: "start_date")
  String get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  String get endDate => throw _privateConstructorUsedError;
  CursorPagination get pagination => throw _privateConstructorUsedError;

  /// Serializes this GetEventsRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetEventsRequestCopyWith<GetEventsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetEventsRequestCopyWith<$Res> {
  factory $GetEventsRequestCopyWith(
          GetEventsRequest value, $Res Function(GetEventsRequest) then) =
      _$GetEventsRequestCopyWithImpl<$Res, GetEventsRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "start_date") String startDate,
      @JsonKey(name: "end_date") String endDate,
      CursorPagination pagination});

  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class _$GetEventsRequestCopyWithImpl<$Res, $Val extends GetEventsRequest>
    implements $GetEventsRequestCopyWith<$Res> {
  _$GetEventsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as CursorPagination,
    ) as $Val);
  }

  /// Create a copy of GetEventsRequest
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
abstract class _$$GetEventsRequestImplCopyWith<$Res>
    implements $GetEventsRequestCopyWith<$Res> {
  factory _$$GetEventsRequestImplCopyWith(_$GetEventsRequestImpl value,
          $Res Function(_$GetEventsRequestImpl) then) =
      __$$GetEventsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "start_date") String startDate,
      @JsonKey(name: "end_date") String endDate,
      CursorPagination pagination});

  @override
  $CursorPaginationCopyWith<$Res> get pagination;
}

/// @nodoc
class __$$GetEventsRequestImplCopyWithImpl<$Res>
    extends _$GetEventsRequestCopyWithImpl<$Res, _$GetEventsRequestImpl>
    implements _$$GetEventsRequestImplCopyWith<$Res> {
  __$$GetEventsRequestImplCopyWithImpl(_$GetEventsRequestImpl _value,
      $Res Function(_$GetEventsRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? pagination = null,
  }) {
    return _then(_$GetEventsRequestImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as CursorPagination,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetEventsRequestImpl
    with DiagnosticableTreeMixin
    implements _GetEventsRequest {
  const _$GetEventsRequestImpl(
      {@JsonKey(name: "start_date") required this.startDate,
      @JsonKey(name: "end_date") required this.endDate,
      required this.pagination});

  factory _$GetEventsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetEventsRequestImplFromJson(json);

  @override
  @JsonKey(name: "start_date")
  final String startDate;
  @override
  @JsonKey(name: "end_date")
  final String endDate;
  @override
  final CursorPagination pagination;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GetEventsRequest(startDate: $startDate, endDate: $endDate, pagination: $pagination)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GetEventsRequest'))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('endDate', endDate))
      ..add(DiagnosticsProperty('pagination', pagination));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetEventsRequestImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, pagination);

  /// Create a copy of GetEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetEventsRequestImplCopyWith<_$GetEventsRequestImpl> get copyWith =>
      __$$GetEventsRequestImplCopyWithImpl<_$GetEventsRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetEventsRequestImplToJson(
      this,
    );
  }
}

abstract class _GetEventsRequest implements GetEventsRequest {
  const factory _GetEventsRequest(
      {@JsonKey(name: "start_date") required final String startDate,
      @JsonKey(name: "end_date") required final String endDate,
      required final CursorPagination pagination}) = _$GetEventsRequestImpl;

  factory _GetEventsRequest.fromJson(Map<String, dynamic> json) =
      _$GetEventsRequestImpl.fromJson;

  @override
  @JsonKey(name: "start_date")
  String get startDate;
  @override
  @JsonKey(name: "end_date")
  String get endDate;
  @override
  CursorPagination get pagination;

  /// Create a copy of GetEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetEventsRequestImplCopyWith<_$GetEventsRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetFutureEventsRequest _$GetFutureEventsRequestFromJson(
    Map<String, dynamic> json) {
  return _GetFutureEventsRequest.fromJson(json);
}

/// @nodoc
mixin _$GetFutureEventsRequest {
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: "max_days")
  int get maxDays => throw _privateConstructorUsedError;

  /// Serializes this GetFutureEventsRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetFutureEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetFutureEventsRequestCopyWith<GetFutureEventsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFutureEventsRequestCopyWith<$Res> {
  factory $GetFutureEventsRequestCopyWith(GetFutureEventsRequest value,
          $Res Function(GetFutureEventsRequest) then) =
      _$GetFutureEventsRequestCopyWithImpl<$Res, GetFutureEventsRequest>;
  @useResult
  $Res call({int limit, @JsonKey(name: "max_days") int maxDays});
}

/// @nodoc
class _$GetFutureEventsRequestCopyWithImpl<$Res,
        $Val extends GetFutureEventsRequest>
    implements $GetFutureEventsRequestCopyWith<$Res> {
  _$GetFutureEventsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetFutureEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? maxDays = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      maxDays: null == maxDays
          ? _value.maxDays
          : maxDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetFutureEventsRequestImplCopyWith<$Res>
    implements $GetFutureEventsRequestCopyWith<$Res> {
  factory _$$GetFutureEventsRequestImplCopyWith(
          _$GetFutureEventsRequestImpl value,
          $Res Function(_$GetFutureEventsRequestImpl) then) =
      __$$GetFutureEventsRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, @JsonKey(name: "max_days") int maxDays});
}

/// @nodoc
class __$$GetFutureEventsRequestImplCopyWithImpl<$Res>
    extends _$GetFutureEventsRequestCopyWithImpl<$Res,
        _$GetFutureEventsRequestImpl>
    implements _$$GetFutureEventsRequestImplCopyWith<$Res> {
  __$$GetFutureEventsRequestImplCopyWithImpl(
      _$GetFutureEventsRequestImpl _value,
      $Res Function(_$GetFutureEventsRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetFutureEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? maxDays = null,
  }) {
    return _then(_$GetFutureEventsRequestImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      maxDays: null == maxDays
          ? _value.maxDays
          : maxDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetFutureEventsRequestImpl
    with DiagnosticableTreeMixin
    implements _GetFutureEventsRequest {
  const _$GetFutureEventsRequestImpl(
      {this.limit = 10, @JsonKey(name: "max_days") this.maxDays = 30});

  factory _$GetFutureEventsRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetFutureEventsRequestImplFromJson(json);

  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey(name: "max_days")
  final int maxDays;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GetFutureEventsRequest(limit: $limit, maxDays: $maxDays)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GetFutureEventsRequest'))
      ..add(DiagnosticsProperty('limit', limit))
      ..add(DiagnosticsProperty('maxDays', maxDays));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetFutureEventsRequestImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.maxDays, maxDays) || other.maxDays == maxDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit, maxDays);

  /// Create a copy of GetFutureEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetFutureEventsRequestImplCopyWith<_$GetFutureEventsRequestImpl>
      get copyWith => __$$GetFutureEventsRequestImplCopyWithImpl<
          _$GetFutureEventsRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetFutureEventsRequestImplToJson(
      this,
    );
  }
}

abstract class _GetFutureEventsRequest implements GetFutureEventsRequest {
  const factory _GetFutureEventsRequest(
          {final int limit, @JsonKey(name: "max_days") final int maxDays}) =
      _$GetFutureEventsRequestImpl;

  factory _GetFutureEventsRequest.fromJson(Map<String, dynamic> json) =
      _$GetFutureEventsRequestImpl.fromJson;

  @override
  int get limit;
  @override
  @JsonKey(name: "max_days")
  int get maxDays;

  /// Create a copy of GetFutureEventsRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetFutureEventsRequestImplCopyWith<_$GetFutureEventsRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
