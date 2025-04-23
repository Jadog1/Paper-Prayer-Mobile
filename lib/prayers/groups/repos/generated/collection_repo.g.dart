// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../collection_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchRecommendationsHash() =>
    r'6c01931323e4e914ade96f5613c3eee658a8b135';

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

/// See also [fetchRecommendations].
@ProviderFor(fetchRecommendations)
const fetchRecommendationsProvider = FetchRecommendationsFamily();

/// See also [fetchRecommendations].
class FetchRecommendationsFamily extends Family<AsyncValue<List<Collection>>> {
  /// See also [fetchRecommendations].
  const FetchRecommendationsFamily();

  /// See also [fetchRecommendations].
  FetchRecommendationsProvider call(
    int contactId,
  ) {
    return FetchRecommendationsProvider(
      contactId,
    );
  }

  @override
  FetchRecommendationsProvider getProviderOverride(
    covariant FetchRecommendationsProvider provider,
  ) {
    return call(
      provider.contactId,
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
  String? get name => r'fetchRecommendationsProvider';
}

/// See also [fetchRecommendations].
class FetchRecommendationsProvider
    extends AutoDisposeFutureProvider<List<Collection>> {
  /// See also [fetchRecommendations].
  FetchRecommendationsProvider(
    int contactId,
  ) : this._internal(
          (ref) => fetchRecommendations(
            ref as FetchRecommendationsRef,
            contactId,
          ),
          from: fetchRecommendationsProvider,
          name: r'fetchRecommendationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRecommendationsHash,
          dependencies: FetchRecommendationsFamily._dependencies,
          allTransitiveDependencies:
              FetchRecommendationsFamily._allTransitiveDependencies,
          contactId: contactId,
        );

  FetchRecommendationsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.contactId,
  }) : super.internal();

  final int contactId;

  @override
  Override overrideWith(
    FutureOr<List<Collection>> Function(FetchRecommendationsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRecommendationsProvider._internal(
        (ref) => create(ref as FetchRecommendationsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        contactId: contactId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Collection>> createElement() {
    return _FetchRecommendationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRecommendationsProvider &&
        other.contactId == contactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchRecommendationsRef
    on AutoDisposeFutureProviderRef<List<Collection>> {
  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _FetchRecommendationsProviderElement
    extends AutoDisposeFutureProviderElement<List<Collection>>
    with FetchRecommendationsRef {
  _FetchRecommendationsProviderElement(super.provider);

  @override
  int get contactId => (origin as FetchRecommendationsProvider).contactId;
}

String _$fetchRequestsInCollectionHash() =>
    r'42219accf8df12c57f3caca07d37d9cd699d548e';

/// See also [fetchRequestsInCollection].
@ProviderFor(fetchRequestsInCollection)
const fetchRequestsInCollectionProvider = FetchRequestsInCollectionFamily();

/// See also [fetchRequestsInCollection].
class FetchRequestsInCollectionFamily
    extends Family<AsyncValue<List<PrayerRequest>>> {
  /// See also [fetchRequestsInCollection].
  const FetchRequestsInCollectionFamily();

  /// See also [fetchRequestsInCollection].
  FetchRequestsInCollectionProvider call(
    int collectionId,
  ) {
    return FetchRequestsInCollectionProvider(
      collectionId,
    );
  }

  @override
  FetchRequestsInCollectionProvider getProviderOverride(
    covariant FetchRequestsInCollectionProvider provider,
  ) {
    return call(
      provider.collectionId,
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
  String? get name => r'fetchRequestsInCollectionProvider';
}

/// See also [fetchRequestsInCollection].
class FetchRequestsInCollectionProvider
    extends AutoDisposeFutureProvider<List<PrayerRequest>> {
  /// See also [fetchRequestsInCollection].
  FetchRequestsInCollectionProvider(
    int collectionId,
  ) : this._internal(
          (ref) => fetchRequestsInCollection(
            ref as FetchRequestsInCollectionRef,
            collectionId,
          ),
          from: fetchRequestsInCollectionProvider,
          name: r'fetchRequestsInCollectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRequestsInCollectionHash,
          dependencies: FetchRequestsInCollectionFamily._dependencies,
          allTransitiveDependencies:
              FetchRequestsInCollectionFamily._allTransitiveDependencies,
          collectionId: collectionId,
        );

  FetchRequestsInCollectionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
  }) : super.internal();

  final int collectionId;

  @override
  Override overrideWith(
    FutureOr<List<PrayerRequest>> Function(
            FetchRequestsInCollectionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRequestsInCollectionProvider._internal(
        (ref) => create(ref as FetchRequestsInCollectionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PrayerRequest>> createElement() {
    return _FetchRequestsInCollectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRequestsInCollectionProvider &&
        other.collectionId == collectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchRequestsInCollectionRef
    on AutoDisposeFutureProviderRef<List<PrayerRequest>> {
  /// The parameter `collectionId` of this provider.
  int get collectionId;
}

class _FetchRequestsInCollectionProviderElement
    extends AutoDisposeFutureProviderElement<List<PrayerRequest>>
    with FetchRequestsInCollectionRef {
  _FetchRequestsInCollectionProviderElement(super.provider);

  @override
  int get collectionId =>
      (origin as FetchRequestsInCollectionProvider).collectionId;
}

String _$fetchCollectionFromRequestHash() =>
    r'772ae3afb53e0d71c9c0d7c21e4f6d660c8d1eb1';

/// See also [fetchCollectionFromRequest].
@ProviderFor(fetchCollectionFromRequest)
const fetchCollectionFromRequestProvider = FetchCollectionFromRequestFamily();

/// See also [fetchCollectionFromRequest].
class FetchCollectionFromRequestFamily
    extends Family<AsyncValue<CollectionAndRelatedContacts?>> {
  /// See also [fetchCollectionFromRequest].
  const FetchCollectionFromRequestFamily();

  /// See also [fetchCollectionFromRequest].
  FetchCollectionFromRequestProvider call(
    int requestId,
    int contactId,
  ) {
    return FetchCollectionFromRequestProvider(
      requestId,
      contactId,
    );
  }

  @override
  FetchCollectionFromRequestProvider getProviderOverride(
    covariant FetchCollectionFromRequestProvider provider,
  ) {
    return call(
      provider.requestId,
      provider.contactId,
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
  String? get name => r'fetchCollectionFromRequestProvider';
}

/// See also [fetchCollectionFromRequest].
class FetchCollectionFromRequestProvider
    extends AutoDisposeFutureProvider<CollectionAndRelatedContacts?> {
  /// See also [fetchCollectionFromRequest].
  FetchCollectionFromRequestProvider(
    int requestId,
    int contactId,
  ) : this._internal(
          (ref) => fetchCollectionFromRequest(
            ref as FetchCollectionFromRequestRef,
            requestId,
            contactId,
          ),
          from: fetchCollectionFromRequestProvider,
          name: r'fetchCollectionFromRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCollectionFromRequestHash,
          dependencies: FetchCollectionFromRequestFamily._dependencies,
          allTransitiveDependencies:
              FetchCollectionFromRequestFamily._allTransitiveDependencies,
          requestId: requestId,
          contactId: contactId,
        );

  FetchCollectionFromRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.requestId,
    required this.contactId,
  }) : super.internal();

  final int requestId;
  final int contactId;

  @override
  Override overrideWith(
    FutureOr<CollectionAndRelatedContacts?> Function(
            FetchCollectionFromRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCollectionFromRequestProvider._internal(
        (ref) => create(ref as FetchCollectionFromRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        requestId: requestId,
        contactId: contactId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CollectionAndRelatedContacts?>
      createElement() {
    return _FetchCollectionFromRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCollectionFromRequestProvider &&
        other.requestId == requestId &&
        other.contactId == contactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, requestId.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchCollectionFromRequestRef
    on AutoDisposeFutureProviderRef<CollectionAndRelatedContacts?> {
  /// The parameter `requestId` of this provider.
  int get requestId;

  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _FetchCollectionFromRequestProviderElement
    extends AutoDisposeFutureProviderElement<CollectionAndRelatedContacts?>
    with FetchCollectionFromRequestRef {
  _FetchCollectionFromRequestProviderElement(super.provider);

  @override
  int get requestId => (origin as FetchCollectionFromRequestProvider).requestId;
  @override
  int get contactId => (origin as FetchCollectionFromRequestProvider).contactId;
}

String _$collectionContactRepoHash() =>
    r'37fe3d96a9a7ae83e7366a58cc222eb4caf17ba4';

abstract class _$CollectionContactRepo
    extends BuildlessAutoDisposeAsyncNotifier<List<Collection>> {
  late final int contactId;

  FutureOr<List<Collection>> build(
    int contactId,
  );
}

/// See also [CollectionContactRepo].
@ProviderFor(CollectionContactRepo)
const collectionContactRepoProvider = CollectionContactRepoFamily();

/// See also [CollectionContactRepo].
class CollectionContactRepoFamily extends Family<AsyncValue<List<Collection>>> {
  /// See also [CollectionContactRepo].
  const CollectionContactRepoFamily();

  /// See also [CollectionContactRepo].
  CollectionContactRepoProvider call(
    int contactId,
  ) {
    return CollectionContactRepoProvider(
      contactId,
    );
  }

  @override
  CollectionContactRepoProvider getProviderOverride(
    covariant CollectionContactRepoProvider provider,
  ) {
    return call(
      provider.contactId,
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
  String? get name => r'collectionContactRepoProvider';
}

/// See also [CollectionContactRepo].
class CollectionContactRepoProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CollectionContactRepo,
        List<Collection>> {
  /// See also [CollectionContactRepo].
  CollectionContactRepoProvider(
    int contactId,
  ) : this._internal(
          () => CollectionContactRepo()..contactId = contactId,
          from: collectionContactRepoProvider,
          name: r'collectionContactRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$collectionContactRepoHash,
          dependencies: CollectionContactRepoFamily._dependencies,
          allTransitiveDependencies:
              CollectionContactRepoFamily._allTransitiveDependencies,
          contactId: contactId,
        );

  CollectionContactRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.contactId,
  }) : super.internal();

  final int contactId;

  @override
  FutureOr<List<Collection>> runNotifierBuild(
    covariant CollectionContactRepo notifier,
  ) {
    return notifier.build(
      contactId,
    );
  }

  @override
  Override overrideWith(CollectionContactRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: CollectionContactRepoProvider._internal(
        () => create()..contactId = contactId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        contactId: contactId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CollectionContactRepo,
      List<Collection>> createElement() {
    return _CollectionContactRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionContactRepoProvider &&
        other.contactId == contactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CollectionContactRepoRef
    on AutoDisposeAsyncNotifierProviderRef<List<Collection>> {
  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _CollectionContactRepoProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CollectionContactRepo,
        List<Collection>> with CollectionContactRepoRef {
  _CollectionContactRepoProviderElement(super.provider);

  @override
  int get contactId => (origin as CollectionContactRepoProvider).contactId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
