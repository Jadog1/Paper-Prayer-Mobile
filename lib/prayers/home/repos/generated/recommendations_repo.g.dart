// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../recommendations_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recommendationRepoHash() =>
    r'f0123de533b7b28f395b931d3f261ee5363e017b';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
