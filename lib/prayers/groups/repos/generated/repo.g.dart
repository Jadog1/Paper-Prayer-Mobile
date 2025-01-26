// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchSimilarRequestsHash() =>
    r'bceac8b5307af19b02075ed9f35e3882dc330b27';

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

/// See also [fetchSimilarRequests].
@ProviderFor(fetchSimilarRequests)
const fetchSimilarRequestsProvider = FetchSimilarRequestsFamily();

/// See also [fetchSimilarRequests].
class FetchSimilarRequestsFamily
    extends Family<AsyncValue<List<PrayerRequestScore>>> {
  /// See also [fetchSimilarRequests].
  const FetchSimilarRequestsFamily();

  /// See also [fetchSimilarRequests].
  FetchSimilarRequestsProvider call(
    int requestId,
  ) {
    return FetchSimilarRequestsProvider(
      requestId,
    );
  }

  @override
  FetchSimilarRequestsProvider getProviderOverride(
    covariant FetchSimilarRequestsProvider provider,
  ) {
    return call(
      provider.requestId,
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
  String? get name => r'fetchSimilarRequestsProvider';
}

/// See also [fetchSimilarRequests].
class FetchSimilarRequestsProvider
    extends AutoDisposeFutureProvider<List<PrayerRequestScore>> {
  /// See also [fetchSimilarRequests].
  FetchSimilarRequestsProvider(
    int requestId,
  ) : this._internal(
          (ref) => fetchSimilarRequests(
            ref as FetchSimilarRequestsRef,
            requestId,
          ),
          from: fetchSimilarRequestsProvider,
          name: r'fetchSimilarRequestsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchSimilarRequestsHash,
          dependencies: FetchSimilarRequestsFamily._dependencies,
          allTransitiveDependencies:
              FetchSimilarRequestsFamily._allTransitiveDependencies,
          requestId: requestId,
        );

  FetchSimilarRequestsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.requestId,
  }) : super.internal();

  final int requestId;

  @override
  Override overrideWith(
    FutureOr<List<PrayerRequestScore>> Function(
            FetchSimilarRequestsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchSimilarRequestsProvider._internal(
        (ref) => create(ref as FetchSimilarRequestsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        requestId: requestId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PrayerRequestScore>> createElement() {
    return _FetchSimilarRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSimilarRequestsProvider &&
        other.requestId == requestId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, requestId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchSimilarRequestsRef
    on AutoDisposeFutureProviderRef<List<PrayerRequestScore>> {
  /// The parameter `requestId` of this provider.
  int get requestId;
}

class _FetchSimilarRequestsProviderElement
    extends AutoDisposeFutureProviderElement<List<PrayerRequestScore>>
    with FetchSimilarRequestsRef {
  _FetchSimilarRequestsProviderElement(super.provider);

  @override
  int get requestId => (origin as FetchSimilarRequestsProvider).requestId;
}

String _$groupContactsRepoHash() => r'987644ae9c094780a0521a84a92c1b2148602f38';

/// See also [GroupContactsRepo].
@ProviderFor(GroupContactsRepo)
final groupContactsRepoProvider = AutoDisposeAsyncNotifierProvider<
    GroupContactsRepo, List<GroupContacts>>.internal(
  GroupContactsRepo.new,
  name: r'groupContactsRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupContactsRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GroupContactsRepo = AutoDisposeAsyncNotifier<List<GroupContacts>>;
String _$prayerRequestRepoHash() => r'4713972dcf60a10b8422b7adaeebaf969aa01101';

abstract class _$PrayerRequestRepo
    extends BuildlessAutoDisposeAsyncNotifier<List<PrayerRequest>> {
  late final int contactId;

  FutureOr<List<PrayerRequest>> build(
    int contactId,
  );
}

/// See also [PrayerRequestRepo].
@ProviderFor(PrayerRequestRepo)
const prayerRequestRepoProvider = PrayerRequestRepoFamily();

/// See also [PrayerRequestRepo].
class PrayerRequestRepoFamily extends Family<AsyncValue<List<PrayerRequest>>> {
  /// See also [PrayerRequestRepo].
  const PrayerRequestRepoFamily();

  /// See also [PrayerRequestRepo].
  PrayerRequestRepoProvider call(
    int contactId,
  ) {
    return PrayerRequestRepoProvider(
      contactId,
    );
  }

  @override
  PrayerRequestRepoProvider getProviderOverride(
    covariant PrayerRequestRepoProvider provider,
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
  String? get name => r'prayerRequestRepoProvider';
}

/// See also [PrayerRequestRepo].
class PrayerRequestRepoProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PrayerRequestRepo, List<PrayerRequest>> {
  /// See also [PrayerRequestRepo].
  PrayerRequestRepoProvider(
    int contactId,
  ) : this._internal(
          () => PrayerRequestRepo()..contactId = contactId,
          from: prayerRequestRepoProvider,
          name: r'prayerRequestRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$prayerRequestRepoHash,
          dependencies: PrayerRequestRepoFamily._dependencies,
          allTransitiveDependencies:
              PrayerRequestRepoFamily._allTransitiveDependencies,
          contactId: contactId,
        );

  PrayerRequestRepoProvider._internal(
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
  FutureOr<List<PrayerRequest>> runNotifierBuild(
    covariant PrayerRequestRepo notifier,
  ) {
    return notifier.build(
      contactId,
    );
  }

  @override
  Override overrideWith(PrayerRequestRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: PrayerRequestRepoProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<PrayerRequestRepo,
      List<PrayerRequest>> createElement() {
    return _PrayerRequestRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PrayerRequestRepoProvider && other.contactId == contactId;
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
mixin PrayerRequestRepoRef
    on AutoDisposeAsyncNotifierProviderRef<List<PrayerRequest>> {
  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _PrayerRequestRepoProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PrayerRequestRepo,
        List<PrayerRequest>> with PrayerRequestRepoRef {
  _PrayerRequestRepoProviderElement(super.provider);

  @override
  int get contactId => (origin as PrayerRequestRepoProvider).contactId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
