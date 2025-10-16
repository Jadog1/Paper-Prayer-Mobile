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

String _$fetchCollectionWithContactsHash() =>
    r'd9023623101091f5b28f3e18895bb2db907392fe';

/// See also [fetchCollectionWithContacts].
@ProviderFor(fetchCollectionWithContacts)
const fetchCollectionWithContactsProvider = FetchCollectionWithContactsFamily();

/// See also [fetchCollectionWithContacts].
class FetchCollectionWithContactsFamily
    extends Family<AsyncValue<CollectionAndRelatedContacts>> {
  /// See also [fetchCollectionWithContacts].
  const FetchCollectionWithContactsFamily();

  /// See also [fetchCollectionWithContacts].
  FetchCollectionWithContactsProvider call(
    int collectionId,
    int contactId,
  ) {
    return FetchCollectionWithContactsProvider(
      collectionId,
      contactId,
    );
  }

  @override
  FetchCollectionWithContactsProvider getProviderOverride(
    covariant FetchCollectionWithContactsProvider provider,
  ) {
    return call(
      provider.collectionId,
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
  String? get name => r'fetchCollectionWithContactsProvider';
}

/// See also [fetchCollectionWithContacts].
class FetchCollectionWithContactsProvider
    extends AutoDisposeFutureProvider<CollectionAndRelatedContacts> {
  /// See also [fetchCollectionWithContacts].
  FetchCollectionWithContactsProvider(
    int collectionId,
    int contactId,
  ) : this._internal(
          (ref) => fetchCollectionWithContacts(
            ref as FetchCollectionWithContactsRef,
            collectionId,
            contactId,
          ),
          from: fetchCollectionWithContactsProvider,
          name: r'fetchCollectionWithContactsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCollectionWithContactsHash,
          dependencies: FetchCollectionWithContactsFamily._dependencies,
          allTransitiveDependencies:
              FetchCollectionWithContactsFamily._allTransitiveDependencies,
          collectionId: collectionId,
          contactId: contactId,
        );

  FetchCollectionWithContactsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.collectionId,
    required this.contactId,
  }) : super.internal();

  final int collectionId;
  final int contactId;

  @override
  Override overrideWith(
    FutureOr<CollectionAndRelatedContacts> Function(
            FetchCollectionWithContactsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCollectionWithContactsProvider._internal(
        (ref) => create(ref as FetchCollectionWithContactsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        collectionId: collectionId,
        contactId: contactId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CollectionAndRelatedContacts>
      createElement() {
    return _FetchCollectionWithContactsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCollectionWithContactsProvider &&
        other.collectionId == collectionId &&
        other.contactId == contactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, collectionId.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchCollectionWithContactsRef
    on AutoDisposeFutureProviderRef<CollectionAndRelatedContacts> {
  /// The parameter `collectionId` of this provider.
  int get collectionId;

  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _FetchCollectionWithContactsProviderElement
    extends AutoDisposeFutureProviderElement<CollectionAndRelatedContacts>
    with FetchCollectionWithContactsRef {
  _FetchCollectionWithContactsProviderElement(super.provider);

  @override
  int get collectionId =>
      (origin as FetchCollectionWithContactsProvider).collectionId;
  @override
  int get contactId =>
      (origin as FetchCollectionWithContactsProvider).contactId;
}

String _$fetchCollectionForEventHash() =>
    r'7c7d6f6b9806b15f2909a374ccfb5693fb25bb01';

/// See also [fetchCollectionForEvent].
@ProviderFor(fetchCollectionForEvent)
const fetchCollectionForEventProvider = FetchCollectionForEventFamily();

/// See also [fetchCollectionForEvent].
class FetchCollectionForEventFamily extends Family<AsyncValue<Collection>> {
  /// See also [fetchCollectionForEvent].
  const FetchCollectionForEventFamily();

  /// See also [fetchCollectionForEvent].
  FetchCollectionForEventProvider call(
    int eventId,
  ) {
    return FetchCollectionForEventProvider(
      eventId,
    );
  }

  @override
  FetchCollectionForEventProvider getProviderOverride(
    covariant FetchCollectionForEventProvider provider,
  ) {
    return call(
      provider.eventId,
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
  String? get name => r'fetchCollectionForEventProvider';
}

/// See also [fetchCollectionForEvent].
class FetchCollectionForEventProvider
    extends AutoDisposeFutureProvider<Collection> {
  /// See also [fetchCollectionForEvent].
  FetchCollectionForEventProvider(
    int eventId,
  ) : this._internal(
          (ref) => fetchCollectionForEvent(
            ref as FetchCollectionForEventRef,
            eventId,
          ),
          from: fetchCollectionForEventProvider,
          name: r'fetchCollectionForEventProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCollectionForEventHash,
          dependencies: FetchCollectionForEventFamily._dependencies,
          allTransitiveDependencies:
              FetchCollectionForEventFamily._allTransitiveDependencies,
          eventId: eventId,
        );

  FetchCollectionForEventProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
  }) : super.internal();

  final int eventId;

  @override
  Override overrideWith(
    FutureOr<Collection> Function(FetchCollectionForEventRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCollectionForEventProvider._internal(
        (ref) => create(ref as FetchCollectionForEventRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventId: eventId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Collection> createElement() {
    return _FetchCollectionForEventProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCollectionForEventProvider && other.eventId == eventId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchCollectionForEventRef on AutoDisposeFutureProviderRef<Collection> {
  /// The parameter `eventId` of this provider.
  int get eventId;
}

class _FetchCollectionForEventProviderElement
    extends AutoDisposeFutureProviderElement<Collection>
    with FetchCollectionForEventRef {
  _FetchCollectionForEventProviderElement(super.provider);

  @override
  int get eventId => (origin as FetchCollectionForEventProvider).eventId;
}

String _$deleteEventHash() => r'da63300bccffd8adf90f37ec58bfe49071679db8';

/// See also [deleteEvent].
@ProviderFor(deleteEvent)
const deleteEventProvider = DeleteEventFamily();

/// See also [deleteEvent].
class DeleteEventFamily extends Family<AsyncValue<void>> {
  /// See also [deleteEvent].
  const DeleteEventFamily();

  /// See also [deleteEvent].
  DeleteEventProvider call(
    int eventId,
  ) {
    return DeleteEventProvider(
      eventId,
    );
  }

  @override
  DeleteEventProvider getProviderOverride(
    covariant DeleteEventProvider provider,
  ) {
    return call(
      provider.eventId,
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
  String? get name => r'deleteEventProvider';
}

/// See also [deleteEvent].
class DeleteEventProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteEvent].
  DeleteEventProvider(
    int eventId,
  ) : this._internal(
          (ref) => deleteEvent(
            ref as DeleteEventRef,
            eventId,
          ),
          from: deleteEventProvider,
          name: r'deleteEventProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteEventHash,
          dependencies: DeleteEventFamily._dependencies,
          allTransitiveDependencies:
              DeleteEventFamily._allTransitiveDependencies,
          eventId: eventId,
        );

  DeleteEventProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.eventId,
  }) : super.internal();

  final int eventId;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteEventRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteEventProvider._internal(
        (ref) => create(ref as DeleteEventRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        eventId: eventId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteEventProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteEventProvider && other.eventId == eventId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, eventId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteEventRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `eventId` of this provider.
  int get eventId;
}

class _DeleteEventProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteEventRef {
  _DeleteEventProviderElement(super.provider);

  @override
  int get eventId => (origin as DeleteEventProvider).eventId;
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
