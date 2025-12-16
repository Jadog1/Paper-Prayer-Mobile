// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../recommendations_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recentPrayerRequestsHash() =>
    r'aa3cde63b6986542d5e25dbec60c2790f6d31024';

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

/// See also [recentPrayerRequests].
@ProviderFor(recentPrayerRequests)
const recentPrayerRequestsProvider = RecentPrayerRequestsFamily();

/// See also [recentPrayerRequests].
class RecentPrayerRequestsFamily
    extends Family<AsyncValue<List<PrayerRequest>>> {
  /// See also [recentPrayerRequests].
  const RecentPrayerRequestsFamily();

  /// See also [recentPrayerRequests].
  RecentPrayerRequestsProvider call(
    int collectionId, {
    int n = 5,
  }) {
    return RecentPrayerRequestsProvider(
      collectionId,
      n: n,
    );
  }

  @override
  RecentPrayerRequestsProvider getProviderOverride(
    covariant RecentPrayerRequestsProvider provider,
  ) {
    return call(
      provider.collectionId,
      n: provider.n,
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
  String? get name => r'recentPrayerRequestsProvider';
}

/// See also [recentPrayerRequests].
class RecentPrayerRequestsProvider
    extends AutoDisposeFutureProvider<List<PrayerRequest>> {
  /// See also [recentPrayerRequests].
  RecentPrayerRequestsProvider(
    int collectionId, {
    int n = 5,
  }) : this._internal(
          (ref) => recentPrayerRequests(
            ref as RecentPrayerRequestsRef,
            collectionId,
            n: n,
          ),
          from: recentPrayerRequestsProvider,
          name: r'recentPrayerRequestsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recentPrayerRequestsHash,
          dependencies: RecentPrayerRequestsFamily._dependencies,
          allTransitiveDependencies:
              RecentPrayerRequestsFamily._allTransitiveDependencies,
          collectionId: collectionId,
          n: n,
        );

  RecentPrayerRequestsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
    required this.n,
  }) : super.internal();

  final int collectionId;
  final int n;

  @override
  Override overrideWith(
    FutureOr<List<PrayerRequest>> Function(RecentPrayerRequestsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecentPrayerRequestsProvider._internal(
        (ref) => create(ref as RecentPrayerRequestsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
        n: n,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PrayerRequest>> createElement() {
    return _RecentPrayerRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecentPrayerRequestsProvider &&
        other.collectionId == collectionId &&
        other.n == n;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);
    hash = _SystemHash.combine(hash, n.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RecentPrayerRequestsRef
    on AutoDisposeFutureProviderRef<List<PrayerRequest>> {
  /// The parameter `collectionId` of this provider.
  int get collectionId;

  /// The parameter `n` of this provider.
  int get n;
}

class _RecentPrayerRequestsProviderElement
    extends AutoDisposeFutureProviderElement<List<PrayerRequest>>
    with RecentPrayerRequestsRef {
  _RecentPrayerRequestsProviderElement(super.provider);

  @override
  int get collectionId => (origin as RecentPrayerRequestsProvider).collectionId;
  @override
  int get n => (origin as RecentPrayerRequestsProvider).n;
}

String _$recommendationRepoHash() =>
    r'e58a87465339a42b5162d8f47fe299ab037af3a5';

/// See also [RecommendationRepo].
@ProviderFor(RecommendationRepo)
final recommendationRepoProvider = AutoDisposeAsyncNotifierProvider<
    RecommendationRepo, List<RecommendationGroup>>.internal(
  RecommendationRepo.new,
  name: r'recommendationRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recommendationRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecommendationRepo
    = AutoDisposeAsyncNotifier<List<RecommendationGroup>>;
String _$paginatedCollectionRecommendationNotifierHash() =>
    r'47ba11c7d13bb66ea055ab3d166578d97ac3264b';

abstract class _$PaginatedCollectionRecommendationNotifier
    extends BuildlessAutoDisposeAsyncNotifier<
        CursorPagingData<CollectionRecommendation>> {
  late final int limit;
  late final RecommendationGroup recommendationGroup;

  FutureOr<CursorPagingData<CollectionRecommendation>> build(
    int limit,
    RecommendationGroup recommendationGroup,
  );
}

/// See also [PaginatedCollectionRecommendationNotifier].
@ProviderFor(PaginatedCollectionRecommendationNotifier)
const paginatedCollectionRecommendationNotifierProvider =
    PaginatedCollectionRecommendationNotifierFamily();

/// See also [PaginatedCollectionRecommendationNotifier].
class PaginatedCollectionRecommendationNotifierFamily
    extends Family<AsyncValue<CursorPagingData<CollectionRecommendation>>> {
  /// See also [PaginatedCollectionRecommendationNotifier].
  const PaginatedCollectionRecommendationNotifierFamily();

  /// See also [PaginatedCollectionRecommendationNotifier].
  PaginatedCollectionRecommendationNotifierProvider call(
    int limit,
    RecommendationGroup recommendationGroup,
  ) {
    return PaginatedCollectionRecommendationNotifierProvider(
      limit,
      recommendationGroup,
    );
  }

  @override
  PaginatedCollectionRecommendationNotifierProvider getProviderOverride(
    covariant PaginatedCollectionRecommendationNotifierProvider provider,
  ) {
    return call(
      provider.limit,
      provider.recommendationGroup,
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
  String? get name => r'paginatedCollectionRecommendationNotifierProvider';
}

/// See also [PaginatedCollectionRecommendationNotifier].
class PaginatedCollectionRecommendationNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        PaginatedCollectionRecommendationNotifier,
        CursorPagingData<CollectionRecommendation>> {
  /// See also [PaginatedCollectionRecommendationNotifier].
  PaginatedCollectionRecommendationNotifierProvider(
    int limit,
    RecommendationGroup recommendationGroup,
  ) : this._internal(
          () => PaginatedCollectionRecommendationNotifier()
            ..limit = limit
            ..recommendationGroup = recommendationGroup,
          from: paginatedCollectionRecommendationNotifierProvider,
          name: r'paginatedCollectionRecommendationNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedCollectionRecommendationNotifierHash,
          dependencies:
              PaginatedCollectionRecommendationNotifierFamily._dependencies,
          allTransitiveDependencies:
              PaginatedCollectionRecommendationNotifierFamily
                  ._allTransitiveDependencies,
          limit: limit,
          recommendationGroup: recommendationGroup,
        );

  PaginatedCollectionRecommendationNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.recommendationGroup,
  }) : super.internal();

  final int limit;
  final RecommendationGroup recommendationGroup;

  @override
  FutureOr<CursorPagingData<CollectionRecommendation>> runNotifierBuild(
    covariant PaginatedCollectionRecommendationNotifier notifier,
  ) {
    return notifier.build(
      limit,
      recommendationGroup,
    );
  }

  @override
  Override overrideWith(
      PaginatedCollectionRecommendationNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedCollectionRecommendationNotifierProvider._internal(
        () => create()
          ..limit = limit
          ..recommendationGroup = recommendationGroup,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        recommendationGroup: recommendationGroup,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
      PaginatedCollectionRecommendationNotifier,
      CursorPagingData<CollectionRecommendation>> createElement() {
    return _PaginatedCollectionRecommendationNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedCollectionRecommendationNotifierProvider &&
        other.limit == limit &&
        other.recommendationGroup == recommendationGroup;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, recommendationGroup.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedCollectionRecommendationNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<
        CursorPagingData<CollectionRecommendation>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `recommendationGroup` of this provider.
  RecommendationGroup get recommendationGroup;
}

class _PaginatedCollectionRecommendationNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        PaginatedCollectionRecommendationNotifier,
        CursorPagingData<CollectionRecommendation>>
    with PaginatedCollectionRecommendationNotifierRef {
  _PaginatedCollectionRecommendationNotifierProviderElement(super.provider);

  @override
  int get limit =>
      (origin as PaginatedCollectionRecommendationNotifierProvider).limit;
  @override
  RecommendationGroup get recommendationGroup =>
      (origin as PaginatedCollectionRecommendationNotifierProvider)
          .recommendationGroup;
}

String _$paginatedHistoricalRecommendationNotifierHash() =>
    r'4c77ddabf3f4f68d5b0bc5b45b73c9b67bfb1fc1';

abstract class _$PaginatedHistoricalRecommendationNotifier
    extends BuildlessAutoDisposeAsyncNotifier<
        CursorPagingData<HistoricalCollectionRecommendation>> {
  late final int limit;

  FutureOr<CursorPagingData<HistoricalCollectionRecommendation>> build(
    int limit,
  );
}

/// See also [PaginatedHistoricalRecommendationNotifier].
@ProviderFor(PaginatedHistoricalRecommendationNotifier)
const paginatedHistoricalRecommendationNotifierProvider =
    PaginatedHistoricalRecommendationNotifierFamily();

/// See also [PaginatedHistoricalRecommendationNotifier].
class PaginatedHistoricalRecommendationNotifierFamily extends Family<
    AsyncValue<CursorPagingData<HistoricalCollectionRecommendation>>> {
  /// See also [PaginatedHistoricalRecommendationNotifier].
  const PaginatedHistoricalRecommendationNotifierFamily();

  /// See also [PaginatedHistoricalRecommendationNotifier].
  PaginatedHistoricalRecommendationNotifierProvider call(
    int limit,
  ) {
    return PaginatedHistoricalRecommendationNotifierProvider(
      limit,
    );
  }

  @override
  PaginatedHistoricalRecommendationNotifierProvider getProviderOverride(
    covariant PaginatedHistoricalRecommendationNotifierProvider provider,
  ) {
    return call(
      provider.limit,
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
  String? get name => r'paginatedHistoricalRecommendationNotifierProvider';
}

/// See also [PaginatedHistoricalRecommendationNotifier].
class PaginatedHistoricalRecommendationNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        PaginatedHistoricalRecommendationNotifier,
        CursorPagingData<HistoricalCollectionRecommendation>> {
  /// See also [PaginatedHistoricalRecommendationNotifier].
  PaginatedHistoricalRecommendationNotifierProvider(
    int limit,
  ) : this._internal(
          () => PaginatedHistoricalRecommendationNotifier()..limit = limit,
          from: paginatedHistoricalRecommendationNotifierProvider,
          name: r'paginatedHistoricalRecommendationNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedHistoricalRecommendationNotifierHash,
          dependencies:
              PaginatedHistoricalRecommendationNotifierFamily._dependencies,
          allTransitiveDependencies:
              PaginatedHistoricalRecommendationNotifierFamily
                  ._allTransitiveDependencies,
          limit: limit,
        );

  PaginatedHistoricalRecommendationNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
  }) : super.internal();

  final int limit;

  @override
  FutureOr<CursorPagingData<HistoricalCollectionRecommendation>>
      runNotifierBuild(
    covariant PaginatedHistoricalRecommendationNotifier notifier,
  ) {
    return notifier.build(
      limit,
    );
  }

  @override
  Override overrideWith(
      PaginatedHistoricalRecommendationNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedHistoricalRecommendationNotifierProvider._internal(
        () => create()..limit = limit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
      PaginatedHistoricalRecommendationNotifier,
      CursorPagingData<HistoricalCollectionRecommendation>> createElement() {
    return _PaginatedHistoricalRecommendationNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedHistoricalRecommendationNotifierProvider &&
        other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedHistoricalRecommendationNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<
        CursorPagingData<HistoricalCollectionRecommendation>> {
  /// The parameter `limit` of this provider.
  int get limit;
}

class _PaginatedHistoricalRecommendationNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        PaginatedHistoricalRecommendationNotifier,
        CursorPagingData<HistoricalCollectionRecommendation>>
    with PaginatedHistoricalRecommendationNotifierRef {
  _PaginatedHistoricalRecommendationNotifierProviderElement(super.provider);

  @override
  int get limit =>
      (origin as PaginatedHistoricalRecommendationNotifierProvider).limit;
}

String _$paginatedUnresolvedFollowupsNotifierHash() =>
    r'ab4748655076b8228e70464d031961ec645632ac';

abstract class _$PaginatedUnresolvedFollowupsNotifier
    extends BuildlessAutoDisposeAsyncNotifier<
        CursorPagingData<CollectionRecommendation>> {
  late final int limit;
  late final int lookbackDays;

  FutureOr<CursorPagingData<CollectionRecommendation>> build(
    int limit, {
    int lookbackDays = 30,
  });
}

/// See also [PaginatedUnresolvedFollowupsNotifier].
@ProviderFor(PaginatedUnresolvedFollowupsNotifier)
const paginatedUnresolvedFollowupsNotifierProvider =
    PaginatedUnresolvedFollowupsNotifierFamily();

/// See also [PaginatedUnresolvedFollowupsNotifier].
class PaginatedUnresolvedFollowupsNotifierFamily
    extends Family<AsyncValue<CursorPagingData<CollectionRecommendation>>> {
  /// See also [PaginatedUnresolvedFollowupsNotifier].
  const PaginatedUnresolvedFollowupsNotifierFamily();

  /// See also [PaginatedUnresolvedFollowupsNotifier].
  PaginatedUnresolvedFollowupsNotifierProvider call(
    int limit, {
    int lookbackDays = 30,
  }) {
    return PaginatedUnresolvedFollowupsNotifierProvider(
      limit,
      lookbackDays: lookbackDays,
    );
  }

  @override
  PaginatedUnresolvedFollowupsNotifierProvider getProviderOverride(
    covariant PaginatedUnresolvedFollowupsNotifierProvider provider,
  ) {
    return call(
      provider.limit,
      lookbackDays: provider.lookbackDays,
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
  String? get name => r'paginatedUnresolvedFollowupsNotifierProvider';
}

/// See also [PaginatedUnresolvedFollowupsNotifier].
class PaginatedUnresolvedFollowupsNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        PaginatedUnresolvedFollowupsNotifier,
        CursorPagingData<CollectionRecommendation>> {
  /// See also [PaginatedUnresolvedFollowupsNotifier].
  PaginatedUnresolvedFollowupsNotifierProvider(
    int limit, {
    int lookbackDays = 30,
  }) : this._internal(
          () => PaginatedUnresolvedFollowupsNotifier()
            ..limit = limit
            ..lookbackDays = lookbackDays,
          from: paginatedUnresolvedFollowupsNotifierProvider,
          name: r'paginatedUnresolvedFollowupsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedUnresolvedFollowupsNotifierHash,
          dependencies:
              PaginatedUnresolvedFollowupsNotifierFamily._dependencies,
          allTransitiveDependencies: PaginatedUnresolvedFollowupsNotifierFamily
              ._allTransitiveDependencies,
          limit: limit,
          lookbackDays: lookbackDays,
        );

  PaginatedUnresolvedFollowupsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.lookbackDays,
  }) : super.internal();

  final int limit;
  final int lookbackDays;

  @override
  FutureOr<CursorPagingData<CollectionRecommendation>> runNotifierBuild(
    covariant PaginatedUnresolvedFollowupsNotifier notifier,
  ) {
    return notifier.build(
      limit,
      lookbackDays: lookbackDays,
    );
  }

  @override
  Override overrideWith(
      PaginatedUnresolvedFollowupsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedUnresolvedFollowupsNotifierProvider._internal(
        () => create()
          ..limit = limit
          ..lookbackDays = lookbackDays,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        lookbackDays: lookbackDays,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PaginatedUnresolvedFollowupsNotifier,
      CursorPagingData<CollectionRecommendation>> createElement() {
    return _PaginatedUnresolvedFollowupsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedUnresolvedFollowupsNotifierProvider &&
        other.limit == limit &&
        other.lookbackDays == lookbackDays;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, lookbackDays.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedUnresolvedFollowupsNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<
        CursorPagingData<CollectionRecommendation>> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `lookbackDays` of this provider.
  int get lookbackDays;
}

class _PaginatedUnresolvedFollowupsNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        PaginatedUnresolvedFollowupsNotifier,
        CursorPagingData<CollectionRecommendation>>
    with PaginatedUnresolvedFollowupsNotifierRef {
  _PaginatedUnresolvedFollowupsNotifierProviderElement(super.provider);

  @override
  int get limit =>
      (origin as PaginatedUnresolvedFollowupsNotifierProvider).limit;
  @override
  int get lookbackDays =>
      (origin as PaginatedUnresolvedFollowupsNotifierProvider).lookbackDays;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
