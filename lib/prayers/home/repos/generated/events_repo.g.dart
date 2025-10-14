// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../events_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchFutureEventsHash() => r'8391dcf11227489c1c566ef9a6aebf7fb69d7d56';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Fetch future events within max days
///
/// Copied from [fetchFutureEvents].
@ProviderFor(fetchFutureEvents)
const fetchFutureEventsProvider = FetchFutureEventsFamily();

/// Fetch future events within max days
///
/// Copied from [fetchFutureEvents].
class FetchFutureEventsFamily
    extends Family<AsyncValue<List<PrayerCollectionEvent>>> {
  /// Fetch future events within max days
  ///
  /// Copied from [fetchFutureEvents].
  const FetchFutureEventsFamily();

  /// Fetch future events within max days
  ///
  /// Copied from [fetchFutureEvents].
  FetchFutureEventsProvider call({
    int limit = 10,
    int maxDays = 30,
  }) {
    return FetchFutureEventsProvider(
      limit: limit,
      maxDays: maxDays,
    );
  }

  @override
  FetchFutureEventsProvider getProviderOverride(
    covariant FetchFutureEventsProvider provider,
  ) {
    return call(
      limit: provider.limit,
      maxDays: provider.maxDays,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchFutureEventsProvider';
}

/// Fetch future events within max days
///
/// Copied from [fetchFutureEvents].
class FetchFutureEventsProvider
    extends AutoDisposeFutureProvider<List<PrayerCollectionEvent>> {
  /// Fetch future events within max days
  ///
  /// Copied from [fetchFutureEvents].
  FetchFutureEventsProvider({
    int limit = 10,
    int maxDays = 30,
  }) : this._internal(
          (ref) => fetchFutureEvents(
            ref as FetchFutureEventsRef,
            limit: limit,
            maxDays: maxDays,
          ),
          from: fetchFutureEventsProvider,
          name: r'fetchFutureEventsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchFutureEventsHash,
          dependencies: FetchFutureEventsFamily._dependencies,
          allTransitiveDependencies:
              FetchFutureEventsFamily._allTransitiveDependencies,
          limit: limit,
          maxDays: maxDays,
        );

  FetchFutureEventsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.maxDays,
  }) : super.internal();

  final int limit;
  final int maxDays;

  @override
  Override overrideWith(
    FutureOr<List<PrayerCollectionEvent>> Function(
            FetchFutureEventsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchFutureEventsProvider._internal(
        (ref) => create(ref as FetchFutureEventsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        maxDays: maxDays,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PrayerCollectionEvent>>
      createElement() {
    return _FetchFutureEventsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchFutureEventsProvider &&
        other.limit == limit &&
        other.maxDays == maxDays;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, maxDays.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchFutureEventsRef
    on AutoDisposeFutureProviderRef<List<PrayerCollectionEvent>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `maxDays` of this provider.
  int get maxDays;
}

class _FetchFutureEventsProviderElement
    extends AutoDisposeFutureProviderElement<List<PrayerCollectionEvent>>
    with FetchFutureEventsRef {
  _FetchFutureEventsProviderElement(super.provider);

  @override
  int get limit => (origin as FetchFutureEventsProvider).limit;
  @override
  int get maxDays => (origin as FetchFutureEventsProvider).maxDays;
}

String _$fetchEventsInRangeHash() =>
    r'bfe133d77deb1acdb5dc0275e71d7932a812d55f';

/// Fetch paginated events for a specific date range
///
/// Copied from [fetchEventsInRange].
@ProviderFor(fetchEventsInRange)
const fetchEventsInRangeProvider = FetchEventsInRangeFamily();

/// Fetch paginated events for a specific date range
///
/// Copied from [fetchEventsInRange].
class FetchEventsInRangeFamily extends Family<AsyncValue<PaginatedEvents>> {
  /// Fetch paginated events for a specific date range
  ///
  /// Copied from [fetchEventsInRange].
  const FetchEventsInRangeFamily();

  /// Fetch paginated events for a specific date range
  ///
  /// Copied from [fetchEventsInRange].
  FetchEventsInRangeProvider call({
    required String startDate,
    required String endDate,
    String? cursor,
    int limit = 50,
  }) {
    return FetchEventsInRangeProvider(
      startDate: startDate,
      endDate: endDate,
      cursor: cursor,
      limit: limit,
    );
  }

  @override
  FetchEventsInRangeProvider getProviderOverride(
    covariant FetchEventsInRangeProvider provider,
  ) {
    return call(
      startDate: provider.startDate,
      endDate: provider.endDate,
      cursor: provider.cursor,
      limit: provider.limit,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchEventsInRangeProvider';
}

/// Fetch paginated events for a specific date range
///
/// Copied from [fetchEventsInRange].
class FetchEventsInRangeProvider
    extends AutoDisposeFutureProvider<PaginatedEvents> {
  /// Fetch paginated events for a specific date range
  ///
  /// Copied from [fetchEventsInRange].
  FetchEventsInRangeProvider({
    required String startDate,
    required String endDate,
    String? cursor,
    int limit = 50,
  }) : this._internal(
          (ref) => fetchEventsInRange(
            ref as FetchEventsInRangeRef,
            startDate: startDate,
            endDate: endDate,
            cursor: cursor,
            limit: limit,
          ),
          from: fetchEventsInRangeProvider,
          name: r'fetchEventsInRangeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchEventsInRangeHash,
          dependencies: FetchEventsInRangeFamily._dependencies,
          allTransitiveDependencies:
              FetchEventsInRangeFamily._allTransitiveDependencies,
          startDate: startDate,
          endDate: endDate,
          cursor: cursor,
          limit: limit,
        );

  FetchEventsInRangeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
    required this.cursor,
    required this.limit,
  }) : super.internal();

  final String startDate;
  final String endDate;
  final String? cursor;
  final int limit;

  @override
  Override overrideWith(
    FutureOr<PaginatedEvents> Function(FetchEventsInRangeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchEventsInRangeProvider._internal(
        (ref) => create(ref as FetchEventsInRangeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
        cursor: cursor,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginatedEvents> createElement() {
    return _FetchEventsInRangeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchEventsInRangeProvider &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.cursor == cursor &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);
    hash = _SystemHash.combine(hash, cursor.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchEventsInRangeRef on AutoDisposeFutureProviderRef<PaginatedEvents> {
  /// The parameter `startDate` of this provider.
  String get startDate;

  /// The parameter `endDate` of this provider.
  String get endDate;

  /// The parameter `cursor` of this provider.
  String? get cursor;

  /// The parameter `limit` of this provider.
  int get limit;
}

class _FetchEventsInRangeProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedEvents>
    with FetchEventsInRangeRef {
  _FetchEventsInRangeProviderElement(super.provider);

  @override
  String get startDate => (origin as FetchEventsInRangeProvider).startDate;
  @override
  String get endDate => (origin as FetchEventsInRangeProvider).endDate;
  @override
  String? get cursor => (origin as FetchEventsInRangeProvider).cursor;
  @override
  int get limit => (origin as FetchEventsInRangeProvider).limit;
}

String _$paginatedEventsNotifierHash() =>
    r'a0f09ec473663ddd63714fe52bad798727fe2022';

abstract class _$PaginatedEventsNotifier
    extends BuildlessAutoDisposeAsyncNotifier<
        CursorPagingData<PrayerCollectionEvent>> {
  late final int limit;
  late final String startDate;
  late final String endDate;

  FutureOr<CursorPagingData<PrayerCollectionEvent>> build(
    int limit,
    String startDate,
    String endDate,
  );
}

/// Paginated events notifier for calendar views
///
/// Copied from [PaginatedEventsNotifier].
@ProviderFor(PaginatedEventsNotifier)
const paginatedEventsNotifierProvider = PaginatedEventsNotifierFamily();

/// Paginated events notifier for calendar views
///
/// Copied from [PaginatedEventsNotifier].
class PaginatedEventsNotifierFamily
    extends Family<AsyncValue<CursorPagingData<PrayerCollectionEvent>>> {
  /// Paginated events notifier for calendar views
  ///
  /// Copied from [PaginatedEventsNotifier].
  const PaginatedEventsNotifierFamily();

  /// Paginated events notifier for calendar views
  ///
  /// Copied from [PaginatedEventsNotifier].
  PaginatedEventsNotifierProvider call(
    int limit,
    String startDate,
    String endDate,
  ) {
    return PaginatedEventsNotifierProvider(
      limit,
      startDate,
      endDate,
    );
  }

  @override
  PaginatedEventsNotifierProvider getProviderOverride(
    covariant PaginatedEventsNotifierProvider provider,
  ) {
    return call(
      provider.limit,
      provider.startDate,
      provider.endDate,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'paginatedEventsNotifierProvider';
}

/// Paginated events notifier for calendar views
///
/// Copied from [PaginatedEventsNotifier].
class PaginatedEventsNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PaginatedEventsNotifier,
        CursorPagingData<PrayerCollectionEvent>> {
  /// Paginated events notifier for calendar views
  ///
  /// Copied from [PaginatedEventsNotifier].
  PaginatedEventsNotifierProvider(
    int limit,
    String startDate,
    String endDate,
  ) : this._internal(
          () => PaginatedEventsNotifier()
            ..limit = limit
            ..startDate = startDate
            ..endDate = endDate,
          from: paginatedEventsNotifierProvider,
          name: r'paginatedEventsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedEventsNotifierHash,
          dependencies: PaginatedEventsNotifierFamily._dependencies,
          allTransitiveDependencies:
              PaginatedEventsNotifierFamily._allTransitiveDependencies,
          limit: limit,
          startDate: startDate,
          endDate: endDate,
        );

  PaginatedEventsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final int limit;
  final String startDate;
  final String endDate;

  @override
  FutureOr<CursorPagingData<PrayerCollectionEvent>> runNotifierBuild(
    covariant PaginatedEventsNotifier notifier,
  ) {
    return notifier.build(
      limit,
      startDate,
      endDate,
    );
  }

  @override
  Override overrideWith(PaginatedEventsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedEventsNotifierProvider._internal(
        () => create()
          ..limit = limit
          ..startDate = startDate
          ..endDate = endDate,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PaginatedEventsNotifier,
      CursorPagingData<PrayerCollectionEvent>> createElement() {
    return _PaginatedEventsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedEventsNotifierProvider &&
        other.limit == limit &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedEventsNotifierRef on AutoDisposeAsyncNotifierProviderRef<
    CursorPagingData<PrayerCollectionEvent>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `startDate` of this provider.
  String get startDate;

  /// The parameter `endDate` of this provider.
  String get endDate;
}

class _PaginatedEventsNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PaginatedEventsNotifier,
        CursorPagingData<PrayerCollectionEvent>>
    with PaginatedEventsNotifierRef {
  _PaginatedEventsNotifierProviderElement(super.provider);

  @override
  int get limit => (origin as PaginatedEventsNotifierProvider).limit;
  @override
  String get startDate => (origin as PaginatedEventsNotifierProvider).startDate;
  @override
  String get endDate => (origin as PaginatedEventsNotifierProvider).endDate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
