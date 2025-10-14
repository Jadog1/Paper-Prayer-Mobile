// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../notebook_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchNotebookRequestsAtHash() =>
    r'b9910b48f09457688a33e40cfee2dc98522efb4a';

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

/// See also [fetchNotebookRequestsAt].
@ProviderFor(fetchNotebookRequestsAt)
const fetchNotebookRequestsAtProvider = FetchNotebookRequestsAtFamily();

/// See also [fetchNotebookRequestsAt].
class FetchNotebookRequestsAtFamily
    extends Family<AsyncValue<PaginatedPrayerRequests>> {
  /// See also [fetchNotebookRequestsAt].
  const FetchNotebookRequestsAtFamily();

  /// See also [fetchNotebookRequestsAt].
  FetchNotebookRequestsAtProvider call(
    CursorPagination pagination,
    int? groupId,
    int? contactId, {
    int? eventId,
    int? collectionId,
  }) {
    return FetchNotebookRequestsAtProvider(
      pagination,
      groupId,
      contactId,
      eventId: eventId,
      collectionId: collectionId,
    );
  }

  @override
  FetchNotebookRequestsAtProvider getProviderOverride(
    covariant FetchNotebookRequestsAtProvider provider,
  ) {
    return call(
      provider.pagination,
      provider.groupId,
      provider.contactId,
      eventId: provider.eventId,
      collectionId: provider.collectionId,
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
  String? get name => r'fetchNotebookRequestsAtProvider';
}

/// See also [fetchNotebookRequestsAt].
class FetchNotebookRequestsAtProvider
    extends AutoDisposeFutureProvider<PaginatedPrayerRequests> {
  /// See also [fetchNotebookRequestsAt].
  FetchNotebookRequestsAtProvider(
    CursorPagination pagination,
    int? groupId,
    int? contactId, {
    int? eventId,
    int? collectionId,
  }) : this._internal(
          (ref) => fetchNotebookRequestsAt(
            ref as FetchNotebookRequestsAtRef,
            pagination,
            groupId,
            contactId,
            eventId: eventId,
            collectionId: collectionId,
          ),
          from: fetchNotebookRequestsAtProvider,
          name: r'fetchNotebookRequestsAtProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchNotebookRequestsAtHash,
          dependencies: FetchNotebookRequestsAtFamily._dependencies,
          allTransitiveDependencies:
              FetchNotebookRequestsAtFamily._allTransitiveDependencies,
          pagination: pagination,
          groupId: groupId,
          contactId: contactId,
          eventId: eventId,
          collectionId: collectionId,
        );

  FetchNotebookRequestsAtProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pagination,
    required this.groupId,
    required this.contactId,
    required this.eventId,
    required this.collectionId,
  }) : super.internal();

  final CursorPagination pagination;
  final int? groupId;
  final int? contactId;
  final int? eventId;
  final int? collectionId;

  @override
  Override overrideWith(
    FutureOr<PaginatedPrayerRequests> Function(
            FetchNotebookRequestsAtRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchNotebookRequestsAtProvider._internal(
        (ref) => create(ref as FetchNotebookRequestsAtRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pagination: pagination,
        groupId: groupId,
        contactId: contactId,
        eventId: eventId,
        collectionId: collectionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginatedPrayerRequests> createElement() {
    return _FetchNotebookRequestsAtProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchNotebookRequestsAtProvider &&
        other.pagination == pagination &&
        other.groupId == groupId &&
        other.contactId == contactId &&
        other.eventId == eventId &&
        other.collectionId == collectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pagination.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchNotebookRequestsAtRef
    on AutoDisposeFutureProviderRef<PaginatedPrayerRequests> {
  /// The parameter `pagination` of this provider.
  CursorPagination get pagination;

  /// The parameter `groupId` of this provider.
  int? get groupId;

  /// The parameter `contactId` of this provider.
  int? get contactId;

  /// The parameter `eventId` of this provider.
  int? get eventId;

  /// The parameter `collectionId` of this provider.
  int? get collectionId;
}

class _FetchNotebookRequestsAtProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedPrayerRequests>
    with FetchNotebookRequestsAtRef {
  _FetchNotebookRequestsAtProviderElement(super.provider);

  @override
  CursorPagination get pagination =>
      (origin as FetchNotebookRequestsAtProvider).pagination;
  @override
  int? get groupId => (origin as FetchNotebookRequestsAtProvider).groupId;
  @override
  int? get contactId => (origin as FetchNotebookRequestsAtProvider).contactId;
  @override
  int? get eventId => (origin as FetchNotebookRequestsAtProvider).eventId;
  @override
  int? get collectionId =>
      (origin as FetchNotebookRequestsAtProvider).collectionId;
}

String _$fetchNotebookCollectionsAtHash() =>
    r'1d3702d5cca6408904ae91d24c4cbb1d7b636d61';

/// See also [fetchNotebookCollectionsAt].
@ProviderFor(fetchNotebookCollectionsAt)
const fetchNotebookCollectionsAtProvider = FetchNotebookCollectionsAtFamily();

/// See also [fetchNotebookCollectionsAt].
class FetchNotebookCollectionsAtFamily
    extends Family<AsyncValue<PaginatedCollections>> {
  /// See also [fetchNotebookCollectionsAt].
  const FetchNotebookCollectionsAtFamily();

  /// See also [fetchNotebookCollectionsAt].
  FetchNotebookCollectionsAtProvider call(
    CursorPagination pagination,
    int groupId,
  ) {
    return FetchNotebookCollectionsAtProvider(
      pagination,
      groupId,
    );
  }

  @override
  FetchNotebookCollectionsAtProvider getProviderOverride(
    covariant FetchNotebookCollectionsAtProvider provider,
  ) {
    return call(
      provider.pagination,
      provider.groupId,
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
  String? get name => r'fetchNotebookCollectionsAtProvider';
}

/// See also [fetchNotebookCollectionsAt].
class FetchNotebookCollectionsAtProvider
    extends AutoDisposeFutureProvider<PaginatedCollections> {
  /// See also [fetchNotebookCollectionsAt].
  FetchNotebookCollectionsAtProvider(
    CursorPagination pagination,
    int groupId,
  ) : this._internal(
          (ref) => fetchNotebookCollectionsAt(
            ref as FetchNotebookCollectionsAtRef,
            pagination,
            groupId,
          ),
          from: fetchNotebookCollectionsAtProvider,
          name: r'fetchNotebookCollectionsAtProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchNotebookCollectionsAtHash,
          dependencies: FetchNotebookCollectionsAtFamily._dependencies,
          allTransitiveDependencies:
              FetchNotebookCollectionsAtFamily._allTransitiveDependencies,
          pagination: pagination,
          groupId: groupId,
        );

  FetchNotebookCollectionsAtProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pagination,
    required this.groupId,
  }) : super.internal();

  final CursorPagination pagination;
  final int groupId;

  @override
  Override overrideWith(
    FutureOr<PaginatedCollections> Function(
            FetchNotebookCollectionsAtRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchNotebookCollectionsAtProvider._internal(
        (ref) => create(ref as FetchNotebookCollectionsAtRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pagination: pagination,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginatedCollections> createElement() {
    return _FetchNotebookCollectionsAtProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchNotebookCollectionsAtProvider &&
        other.pagination == pagination &&
        other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pagination.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchNotebookCollectionsAtRef
    on AutoDisposeFutureProviderRef<PaginatedCollections> {
  /// The parameter `pagination` of this provider.
  CursorPagination get pagination;

  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _FetchNotebookCollectionsAtProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedCollections>
    with FetchNotebookCollectionsAtRef {
  _FetchNotebookCollectionsAtProviderElement(super.provider);

  @override
  CursorPagination get pagination =>
      (origin as FetchNotebookCollectionsAtProvider).pagination;
  @override
  int get groupId => (origin as FetchNotebookCollectionsAtProvider).groupId;
}

String _$paginatedPrayerRequestsNotifierHash() =>
    r'3bea2177252b97ae0e606319aa7de2f629c45ebd';

abstract class _$PaginatedPrayerRequestsNotifier
    extends BuildlessAutoDisposeAsyncNotifier<CursorPagingData<PrayerRequest>> {
  late final int limit;
  late final int? groupId;
  late final int? contactId;
  late final int? eventId;
  late final int? collectionId;

  FutureOr<CursorPagingData<PrayerRequest>> build(
    int limit,
    int? groupId,
    int? contactId, {
    int? eventId,
    int? collectionId,
  });
}

/// See also [PaginatedPrayerRequestsNotifier].
@ProviderFor(PaginatedPrayerRequestsNotifier)
const paginatedPrayerRequestsNotifierProvider =
    PaginatedPrayerRequestsNotifierFamily();

/// See also [PaginatedPrayerRequestsNotifier].
class PaginatedPrayerRequestsNotifierFamily
    extends Family<AsyncValue<CursorPagingData<PrayerRequest>>> {
  /// See also [PaginatedPrayerRequestsNotifier].
  const PaginatedPrayerRequestsNotifierFamily();

  /// See also [PaginatedPrayerRequestsNotifier].
  PaginatedPrayerRequestsNotifierProvider call(
    int limit,
    int? groupId,
    int? contactId, {
    int? eventId,
    int? collectionId,
  }) {
    return PaginatedPrayerRequestsNotifierProvider(
      limit,
      groupId,
      contactId,
      eventId: eventId,
      collectionId: collectionId,
    );
  }

  @override
  PaginatedPrayerRequestsNotifierProvider getProviderOverride(
    covariant PaginatedPrayerRequestsNotifierProvider provider,
  ) {
    return call(
      provider.limit,
      provider.groupId,
      provider.contactId,
      eventId: provider.eventId,
      collectionId: provider.collectionId,
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
  String? get name => r'paginatedPrayerRequestsNotifierProvider';
}

/// See also [PaginatedPrayerRequestsNotifier].
class PaginatedPrayerRequestsNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        PaginatedPrayerRequestsNotifier, CursorPagingData<PrayerRequest>> {
  /// See also [PaginatedPrayerRequestsNotifier].
  PaginatedPrayerRequestsNotifierProvider(
    int limit,
    int? groupId,
    int? contactId, {
    int? eventId,
    int? collectionId,
  }) : this._internal(
          () => PaginatedPrayerRequestsNotifier()
            ..limit = limit
            ..groupId = groupId
            ..contactId = contactId
            ..eventId = eventId
            ..collectionId = collectionId,
          from: paginatedPrayerRequestsNotifierProvider,
          name: r'paginatedPrayerRequestsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedPrayerRequestsNotifierHash,
          dependencies: PaginatedPrayerRequestsNotifierFamily._dependencies,
          allTransitiveDependencies:
              PaginatedPrayerRequestsNotifierFamily._allTransitiveDependencies,
          limit: limit,
          groupId: groupId,
          contactId: contactId,
          eventId: eventId,
          collectionId: collectionId,
        );

  PaginatedPrayerRequestsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.groupId,
    required this.contactId,
    required this.eventId,
    required this.collectionId,
  }) : super.internal();

  final int limit;
  final int? groupId;
  final int? contactId;
  final int? eventId;
  final int? collectionId;

  @override
  FutureOr<CursorPagingData<PrayerRequest>> runNotifierBuild(
    covariant PaginatedPrayerRequestsNotifier notifier,
  ) {
    return notifier.build(
      limit,
      groupId,
      contactId,
      eventId: eventId,
      collectionId: collectionId,
    );
  }

  @override
  Override overrideWith(PaginatedPrayerRequestsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedPrayerRequestsNotifierProvider._internal(
        () => create()
          ..limit = limit
          ..groupId = groupId
          ..contactId = contactId
          ..eventId = eventId
          ..collectionId = collectionId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        groupId: groupId,
        contactId: contactId,
        eventId: eventId,
        collectionId: collectionId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PaginatedPrayerRequestsNotifier,
      CursorPagingData<PrayerRequest>> createElement() {
    return _PaginatedPrayerRequestsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedPrayerRequestsNotifierProvider &&
        other.limit == limit &&
        other.groupId == groupId &&
        other.contactId == contactId &&
        other.eventId == eventId &&
        other.collectionId == collectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedPrayerRequestsNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<CursorPagingData<PrayerRequest>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `groupId` of this provider.
  int? get groupId;

  /// The parameter `contactId` of this provider.
  int? get contactId;

  /// The parameter `eventId` of this provider.
  int? get eventId;

  /// The parameter `collectionId` of this provider.
  int? get collectionId;
}

class _PaginatedPrayerRequestsNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        PaginatedPrayerRequestsNotifier, CursorPagingData<PrayerRequest>>
    with PaginatedPrayerRequestsNotifierRef {
  _PaginatedPrayerRequestsNotifierProviderElement(super.provider);

  @override
  int get limit => (origin as PaginatedPrayerRequestsNotifierProvider).limit;
  @override
  int? get groupId =>
      (origin as PaginatedPrayerRequestsNotifierProvider).groupId;
  @override
  int? get contactId =>
      (origin as PaginatedPrayerRequestsNotifierProvider).contactId;
  @override
  int? get eventId =>
      (origin as PaginatedPrayerRequestsNotifierProvider).eventId;
  @override
  int? get collectionId =>
      (origin as PaginatedPrayerRequestsNotifierProvider).collectionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
