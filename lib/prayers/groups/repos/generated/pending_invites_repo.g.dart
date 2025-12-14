// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../pending_invites_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPendingInvitesAtHash() =>
    r'42e9be1d9e71dd7ca268f7b0e4424ce020b56272';

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

/// See also [fetchPendingInvitesAt].
@ProviderFor(fetchPendingInvitesAt)
const fetchPendingInvitesAtProvider = FetchPendingInvitesAtFamily();

/// See also [fetchPendingInvitesAt].
class FetchPendingInvitesAtFamily
    extends Family<AsyncValue<PaginatedPendingInvites>> {
  /// See also [fetchPendingInvitesAt].
  const FetchPendingInvitesAtFamily();

  /// See also [fetchPendingInvitesAt].
  FetchPendingInvitesAtProvider call(
    CursorPagination pagination,
  ) {
    return FetchPendingInvitesAtProvider(
      pagination,
    );
  }

  @override
  FetchPendingInvitesAtProvider getProviderOverride(
    covariant FetchPendingInvitesAtProvider provider,
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
  String? get name => r'fetchPendingInvitesAtProvider';
}

/// See also [fetchPendingInvitesAt].
class FetchPendingInvitesAtProvider
    extends AutoDisposeFutureProvider<PaginatedPendingInvites> {
  /// See also [fetchPendingInvitesAt].
  FetchPendingInvitesAtProvider(
    CursorPagination pagination,
  ) : this._internal(
          (ref) => fetchPendingInvitesAt(
            ref as FetchPendingInvitesAtRef,
            pagination,
          ),
          from: fetchPendingInvitesAtProvider,
          name: r'fetchPendingInvitesAtProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPendingInvitesAtHash,
          dependencies: FetchPendingInvitesAtFamily._dependencies,
          allTransitiveDependencies:
              FetchPendingInvitesAtFamily._allTransitiveDependencies,
          pagination: pagination,
        );

  FetchPendingInvitesAtProvider._internal(
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
    FutureOr<PaginatedPendingInvites> Function(
            FetchPendingInvitesAtRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPendingInvitesAtProvider._internal(
        (ref) => create(ref as FetchPendingInvitesAtRef),
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
  AutoDisposeFutureProviderElement<PaginatedPendingInvites> createElement() {
    return _FetchPendingInvitesAtProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPendingInvitesAtProvider &&
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
mixin FetchPendingInvitesAtRef
    on AutoDisposeFutureProviderRef<PaginatedPendingInvites> {
  /// The parameter `pagination` of this provider.
  CursorPagination get pagination;
}

class _FetchPendingInvitesAtProviderElement
    extends AutoDisposeFutureProviderElement<PaginatedPendingInvites>
    with FetchPendingInvitesAtRef {
  _FetchPendingInvitesAtProviderElement(super.provider);

  @override
  CursorPagination get pagination =>
      (origin as FetchPendingInvitesAtProvider).pagination;
}

String _$hasPendingInvitesHash() => r'6bd64213b39de9a2b8ee6bb680f3fd73721ac2e4';

/// Simple provider to check if there are any pending invites.
/// Returns true if there's at least one pending invite.
/// Useful for showing notification badges in the UI.
///
/// Copied from [hasPendingInvites].
@ProviderFor(hasPendingInvites)
final hasPendingInvitesProvider = AutoDisposeFutureProvider<bool>.internal(
  hasPendingInvites,
  name: r'hasPendingInvitesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hasPendingInvitesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HasPendingInvitesRef = AutoDisposeFutureProviderRef<bool>;
String _$acceptInviteHash() => r'07822b15a26fc36b9c0107066c0c8a3e9b595356';

/// Accepts a pending invite and invalidates related providers.
///
/// Copied from [acceptInvite].
@ProviderFor(acceptInvite)
const acceptInviteProvider = AcceptInviteFamily();

/// Accepts a pending invite and invalidates related providers.
///
/// Copied from [acceptInvite].
class AcceptInviteFamily extends Family<AsyncValue<void>> {
  /// Accepts a pending invite and invalidates related providers.
  ///
  /// Copied from [acceptInvite].
  const AcceptInviteFamily();

  /// Accepts a pending invite and invalidates related providers.
  ///
  /// Copied from [acceptInvite].
  AcceptInviteProvider call(
    int groupId,
  ) {
    return AcceptInviteProvider(
      groupId,
    );
  }

  @override
  AcceptInviteProvider getProviderOverride(
    covariant AcceptInviteProvider provider,
  ) {
    return call(
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
  String? get name => r'acceptInviteProvider';
}

/// Accepts a pending invite and invalidates related providers.
///
/// Copied from [acceptInvite].
class AcceptInviteProvider extends AutoDisposeFutureProvider<void> {
  /// Accepts a pending invite and invalidates related providers.
  ///
  /// Copied from [acceptInvite].
  AcceptInviteProvider(
    int groupId,
  ) : this._internal(
          (ref) => acceptInvite(
            ref as AcceptInviteRef,
            groupId,
          ),
          from: acceptInviteProvider,
          name: r'acceptInviteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$acceptInviteHash,
          dependencies: AcceptInviteFamily._dependencies,
          allTransitiveDependencies:
              AcceptInviteFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  AcceptInviteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final int groupId;

  @override
  Override overrideWith(
    FutureOr<void> Function(AcceptInviteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AcceptInviteProvider._internal(
        (ref) => create(ref as AcceptInviteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AcceptInviteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AcceptInviteProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AcceptInviteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _AcceptInviteProviderElement
    extends AutoDisposeFutureProviderElement<void> with AcceptInviteRef {
  _AcceptInviteProviderElement(super.provider);

  @override
  int get groupId => (origin as AcceptInviteProvider).groupId;
}

String _$rejectInviteHash() => r'c4faacabe89b9c66e59930741dd185017e4421a0';

/// Rejects a pending invite and invalidates related providers.
///
/// Copied from [rejectInvite].
@ProviderFor(rejectInvite)
const rejectInviteProvider = RejectInviteFamily();

/// Rejects a pending invite and invalidates related providers.
///
/// Copied from [rejectInvite].
class RejectInviteFamily extends Family<AsyncValue<void>> {
  /// Rejects a pending invite and invalidates related providers.
  ///
  /// Copied from [rejectInvite].
  const RejectInviteFamily();

  /// Rejects a pending invite and invalidates related providers.
  ///
  /// Copied from [rejectInvite].
  RejectInviteProvider call(
    int groupId,
  ) {
    return RejectInviteProvider(
      groupId,
    );
  }

  @override
  RejectInviteProvider getProviderOverride(
    covariant RejectInviteProvider provider,
  ) {
    return call(
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
  String? get name => r'rejectInviteProvider';
}

/// Rejects a pending invite and invalidates related providers.
///
/// Copied from [rejectInvite].
class RejectInviteProvider extends AutoDisposeFutureProvider<void> {
  /// Rejects a pending invite and invalidates related providers.
  ///
  /// Copied from [rejectInvite].
  RejectInviteProvider(
    int groupId,
  ) : this._internal(
          (ref) => rejectInvite(
            ref as RejectInviteRef,
            groupId,
          ),
          from: rejectInviteProvider,
          name: r'rejectInviteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rejectInviteHash,
          dependencies: RejectInviteFamily._dependencies,
          allTransitiveDependencies:
              RejectInviteFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  RejectInviteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final int groupId;

  @override
  Override overrideWith(
    FutureOr<void> Function(RejectInviteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RejectInviteProvider._internal(
        (ref) => create(ref as RejectInviteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _RejectInviteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RejectInviteProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RejectInviteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _RejectInviteProviderElement
    extends AutoDisposeFutureProviderElement<void> with RejectInviteRef {
  _RejectInviteProviderElement(super.provider);

  @override
  int get groupId => (origin as RejectInviteProvider).groupId;
}

String _$paginatedPendingInvitesNotifierHash() =>
    r'ba1388bc6493cf204575b05d1dfe8f77f60bd5c2';

abstract class _$PaginatedPendingInvitesNotifier
    extends BuildlessAutoDisposeAsyncNotifier<CursorPagingData<PendingInvite>> {
  late final int limit;

  FutureOr<CursorPagingData<PendingInvite>> build(
    int limit,
  );
}

/// See also [PaginatedPendingInvitesNotifier].
@ProviderFor(PaginatedPendingInvitesNotifier)
const paginatedPendingInvitesNotifierProvider =
    PaginatedPendingInvitesNotifierFamily();

/// See also [PaginatedPendingInvitesNotifier].
class PaginatedPendingInvitesNotifierFamily
    extends Family<AsyncValue<CursorPagingData<PendingInvite>>> {
  /// See also [PaginatedPendingInvitesNotifier].
  const PaginatedPendingInvitesNotifierFamily();

  /// See also [PaginatedPendingInvitesNotifier].
  PaginatedPendingInvitesNotifierProvider call(
    int limit,
  ) {
    return PaginatedPendingInvitesNotifierProvider(
      limit,
    );
  }

  @override
  PaginatedPendingInvitesNotifierProvider getProviderOverride(
    covariant PaginatedPendingInvitesNotifierProvider provider,
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
  String? get name => r'paginatedPendingInvitesNotifierProvider';
}

/// See also [PaginatedPendingInvitesNotifier].
class PaginatedPendingInvitesNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        PaginatedPendingInvitesNotifier, CursorPagingData<PendingInvite>> {
  /// See also [PaginatedPendingInvitesNotifier].
  PaginatedPendingInvitesNotifierProvider(
    int limit,
  ) : this._internal(
          () => PaginatedPendingInvitesNotifier()..limit = limit,
          from: paginatedPendingInvitesNotifierProvider,
          name: r'paginatedPendingInvitesNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedPendingInvitesNotifierHash,
          dependencies: PaginatedPendingInvitesNotifierFamily._dependencies,
          allTransitiveDependencies:
              PaginatedPendingInvitesNotifierFamily._allTransitiveDependencies,
          limit: limit,
        );

  PaginatedPendingInvitesNotifierProvider._internal(
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
  FutureOr<CursorPagingData<PendingInvite>> runNotifierBuild(
    covariant PaginatedPendingInvitesNotifier notifier,
  ) {
    return notifier.build(
      limit,
    );
  }

  @override
  Override overrideWith(PaginatedPendingInvitesNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedPendingInvitesNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PaginatedPendingInvitesNotifier,
      CursorPagingData<PendingInvite>> createElement() {
    return _PaginatedPendingInvitesNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedPendingInvitesNotifierProvider &&
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
mixin PaginatedPendingInvitesNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<CursorPagingData<PendingInvite>> {
  /// The parameter `limit` of this provider.
  int get limit;
}

class _PaginatedPendingInvitesNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        PaginatedPendingInvitesNotifier, CursorPagingData<PendingInvite>>
    with PaginatedPendingInvitesNotifierRef {
  _PaginatedPendingInvitesNotifierProviderElement(super.provider);

  @override
  int get limit => (origin as PaginatedPendingInvitesNotifierProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
