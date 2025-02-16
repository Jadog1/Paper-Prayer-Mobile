// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../collection_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchRecommendationsHash() =>
    r'74f3d27413032ac4d4cbd6cf66a46a1019b9bf9d';

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

String _$collectionContactRepoHash() =>
    r'501250d19946c571d7f8f94f95e22046fe3c6a5b';

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
