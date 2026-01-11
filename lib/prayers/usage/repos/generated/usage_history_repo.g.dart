// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../usage_history_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUsageHistoryAtHash() =>
    r'0ffc98927eb6af6380ed9d0e375901030990e72a';

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

/// See also [fetchUsageHistoryAt].
@ProviderFor(fetchUsageHistoryAt)
const fetchUsageHistoryAtProvider = FetchUsageHistoryAtFamily();

/// See also [fetchUsageHistoryAt].
class FetchUsageHistoryAtFamily
    extends Family<AsyncValue<PaginatedGenAIUsageHistory>> {
  /// See also [fetchUsageHistoryAt].
  const FetchUsageHistoryAtFamily();

  /// See also [fetchUsageHistoryAt].
  FetchUsageHistoryAtProvider call(
    CursorPagination pagination,
  ) {
    return FetchUsageHistoryAtProvider(
      pagination,
    );
  }

  @override
  FetchUsageHistoryAtProvider getProviderOverride(
    covariant FetchUsageHistoryAtProvider provider,
  ) {
    return call(
      provider.pagination,
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
  String? get name => r'fetchUsageHistoryAtProvider';
}

/// See also [fetchUsageHistoryAt].
class FetchUsageHistoryAtProvider
    extends AutoDisposeFutureProvider<PaginatedGenAIUsageHistory> {
  /// See also [fetchUsageHistoryAt].
  FetchUsageHistoryAtProvider(
    CursorPagination pagination,
  ) : this._internal(
          (ref) => fetchUsageHistoryAt(
            ref as FetchUsageHistoryAtRef,
            pagination,
          ),
          from: fetchUsageHistoryAtProvider,
          name: r'fetchUsageHistoryAtProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUsageHistoryAtHash,
          dependencies: FetchUsageHistoryAtFamily._dependencies,
          allTransitiveDependencies:
              FetchUsageHistoryAtFamily._allTransitiveDependencies,
          pagination: pagination,
        );

  FetchUsageHistoryAtProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pagination,
  }) : super.internal();

  final CursorPagination pagination;

  @override
  Override overrideWith(
    FutureOr<PaginatedGenAIUsageHistory> Function(
            FetchUsageHistoryAtRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUsageHistoryAtProvider._internal(
        (ref) => create(ref as FetchUsageHistoryAtRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pagination: pagination,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaginatedGenAIUsageHistory> createElement() {
    return _FetchUsageHistoryAtProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUsageHistoryAtProvider &&
        other.pagination == pagination;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pagination.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchUsageHistoryAtRef
    on AutoDisposeFutureProviderRef<PaginatedGenAIUsageHistory> {
  /// The parameter `pagination` of this provider.
  CursorPagination get pagination;
}

class _FetchUsageHistoryAtProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedGenAIUsageHistory>
    with FetchUsageHistoryAtRef {
  _FetchUsageHistoryAtProviderElement(super.provider);

  @override
  CursorPagination get pagination =>
      (origin as FetchUsageHistoryAtProvider).pagination;
}

String _$paginatedUsageHistoryNotifierHash() =>
    r'1a00fd9c457e8e711295adda07e16b721baa02e5';

abstract class _$PaginatedUsageHistoryNotifier
    extends BuildlessAutoDisposeAsyncNotifier<
        CursorPagingData<GenAIUsageHistoryItem>> {
  late final int limit;

  FutureOr<CursorPagingData<GenAIUsageHistoryItem>> build(
    int limit,
  );
}

/// See also [PaginatedUsageHistoryNotifier].
@ProviderFor(PaginatedUsageHistoryNotifier)
const paginatedUsageHistoryNotifierProvider =
    PaginatedUsageHistoryNotifierFamily();

/// See also [PaginatedUsageHistoryNotifier].
class PaginatedUsageHistoryNotifierFamily
    extends Family<AsyncValue<CursorPagingData<GenAIUsageHistoryItem>>> {
  /// See also [PaginatedUsageHistoryNotifier].
  const PaginatedUsageHistoryNotifierFamily();

  /// See also [PaginatedUsageHistoryNotifier].
  PaginatedUsageHistoryNotifierProvider call(
    int limit,
  ) {
    return PaginatedUsageHistoryNotifierProvider(
      limit,
    );
  }

  @override
  PaginatedUsageHistoryNotifierProvider getProviderOverride(
    covariant PaginatedUsageHistoryNotifierProvider provider,
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
  String? get name => r'paginatedUsageHistoryNotifierProvider';
}

/// See also [PaginatedUsageHistoryNotifier].
class PaginatedUsageHistoryNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PaginatedUsageHistoryNotifier,
        CursorPagingData<GenAIUsageHistoryItem>> {
  /// See also [PaginatedUsageHistoryNotifier].
  PaginatedUsageHistoryNotifierProvider(
    int limit,
  ) : this._internal(
          () => PaginatedUsageHistoryNotifier()..limit = limit,
          from: paginatedUsageHistoryNotifierProvider,
          name: r'paginatedUsageHistoryNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedUsageHistoryNotifierHash,
          dependencies: PaginatedUsageHistoryNotifierFamily._dependencies,
          allTransitiveDependencies:
              PaginatedUsageHistoryNotifierFamily._allTransitiveDependencies,
          limit: limit,
        );

  PaginatedUsageHistoryNotifierProvider._internal(
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
  FutureOr<CursorPagingData<GenAIUsageHistoryItem>> runNotifierBuild(
    covariant PaginatedUsageHistoryNotifier notifier,
  ) {
    return notifier.build(
      limit,
    );
  }

  @override
  Override overrideWith(PaginatedUsageHistoryNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedUsageHistoryNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PaginatedUsageHistoryNotifier,
      CursorPagingData<GenAIUsageHistoryItem>> createElement() {
    return _PaginatedUsageHistoryNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedUsageHistoryNotifierProvider &&
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
mixin PaginatedUsageHistoryNotifierRef on AutoDisposeAsyncNotifierProviderRef<
    CursorPagingData<GenAIUsageHistoryItem>> {
  /// The parameter `limit` of this provider.
  int get limit;
}

class _PaginatedUsageHistoryNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        PaginatedUsageHistoryNotifier, CursorPagingData<GenAIUsageHistoryItem>>
    with PaginatedUsageHistoryNotifierRef {
  _PaginatedUsageHistoryNotifierProviderElement(super.provider);

  @override
  int get limit => (origin as PaginatedUsageHistoryNotifierProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
