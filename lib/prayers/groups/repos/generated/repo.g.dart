// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPrayerRequestsHash() =>
    r'fa15c175479f53a9f14ecd5e767ad109354f5ba7';

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

/// See also [fetchPrayerRequests].
@ProviderFor(fetchPrayerRequests)
const fetchPrayerRequestsProvider = FetchPrayerRequestsFamily();

/// See also [fetchPrayerRequests].
class FetchPrayerRequestsFamily
    extends Family<AsyncValue<List<PrayerRequest>>> {
  /// See also [fetchPrayerRequests].
  const FetchPrayerRequestsFamily();

  /// See also [fetchPrayerRequests].
  FetchPrayerRequestsProvider call(
    int contactId,
  ) {
    return FetchPrayerRequestsProvider(
      contactId,
    );
  }

  @override
  FetchPrayerRequestsProvider getProviderOverride(
    covariant FetchPrayerRequestsProvider provider,
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
  String? get name => r'fetchPrayerRequestsProvider';
}

/// See also [fetchPrayerRequests].
class FetchPrayerRequestsProvider
    extends AutoDisposeFutureProvider<List<PrayerRequest>> {
  /// See also [fetchPrayerRequests].
  FetchPrayerRequestsProvider(
    int contactId,
  ) : this._internal(
          (ref) => fetchPrayerRequests(
            ref as FetchPrayerRequestsRef,
            contactId,
          ),
          from: fetchPrayerRequestsProvider,
          name: r'fetchPrayerRequestsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPrayerRequestsHash,
          dependencies: FetchPrayerRequestsFamily._dependencies,
          allTransitiveDependencies:
              FetchPrayerRequestsFamily._allTransitiveDependencies,
          contactId: contactId,
        );

  FetchPrayerRequestsProvider._internal(
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
    FutureOr<List<PrayerRequest>> Function(FetchPrayerRequestsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPrayerRequestsProvider._internal(
        (ref) => create(ref as FetchPrayerRequestsRef),
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
  AutoDisposeFutureProviderElement<List<PrayerRequest>> createElement() {
    return _FetchPrayerRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPrayerRequestsProvider && other.contactId == contactId;
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
mixin FetchPrayerRequestsRef
    on AutoDisposeFutureProviderRef<List<PrayerRequest>> {
  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _FetchPrayerRequestsProviderElement
    extends AutoDisposeFutureProviderElement<List<PrayerRequest>>
    with FetchPrayerRequestsRef {
  _FetchPrayerRequestsProviderElement(super.provider);

  @override
  int get contactId => (origin as FetchPrayerRequestsProvider).contactId;
}

String _$saveRequestHash() => r'19a8aa7d038e812d21e1efe6c85f1ec260ca22bb';

/// See also [saveRequest].
@ProviderFor(saveRequest)
const saveRequestProvider = SaveRequestFamily();

/// See also [saveRequest].
class SaveRequestFamily extends Family<AsyncValue<void>> {
  /// See also [saveRequest].
  const SaveRequestFamily();

  /// See also [saveRequest].
  SaveRequestProvider call(
    PrayerRequest request,
  ) {
    return SaveRequestProvider(
      request,
    );
  }

  @override
  SaveRequestProvider getProviderOverride(
    covariant SaveRequestProvider provider,
  ) {
    return call(
      provider.request,
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
  String? get name => r'saveRequestProvider';
}

/// See also [saveRequest].
class SaveRequestProvider extends AutoDisposeFutureProvider<void> {
  /// See also [saveRequest].
  SaveRequestProvider(
    PrayerRequest request,
  ) : this._internal(
          (ref) => saveRequest(
            ref as SaveRequestRef,
            request,
          ),
          from: saveRequestProvider,
          name: r'saveRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveRequestHash,
          dependencies: SaveRequestFamily._dependencies,
          allTransitiveDependencies:
              SaveRequestFamily._allTransitiveDependencies,
          request: request,
        );

  SaveRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.request,
  }) : super.internal();

  final PrayerRequest request;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveRequestRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveRequestProvider._internal(
        (ref) => create(ref as SaveRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        request: request,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveRequestProvider && other.request == request;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, request.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SaveRequestRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `request` of this provider.
  PrayerRequest get request;
}

class _SaveRequestProviderElement extends AutoDisposeFutureProviderElement<void>
    with SaveRequestRef {
  _SaveRequestProviderElement(super.provider);

  @override
  PrayerRequest get request => (origin as SaveRequestProvider).request;
}

String _$groupContactsRepoHash() => r'e0f98f33627d056be7d91fcd5e2f65a55ac989d2';

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
String _$prayerRequestRepoHash() => r'a292e5200f0f306f96ec189d5713507460f37e44';

abstract class _$PrayerRequestRepo
    extends BuildlessAutoDisposeAsyncNotifier<List<PrayerRequest>> {
  late final int? contactId;

  FutureOr<List<PrayerRequest>> build([
    int? contactId,
  ]);
}

/// See also [PrayerRequestRepo].
@ProviderFor(PrayerRequestRepo)
const prayerRequestRepoProvider = PrayerRequestRepoFamily();

/// See also [PrayerRequestRepo].
class PrayerRequestRepoFamily extends Family<AsyncValue<List<PrayerRequest>>> {
  /// See also [PrayerRequestRepo].
  const PrayerRequestRepoFamily();

  /// See also [PrayerRequestRepo].
  PrayerRequestRepoProvider call([
    int? contactId,
  ]) {
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
  PrayerRequestRepoProvider([
    int? contactId,
  ]) : this._internal(
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

  final int? contactId;

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
  int? get contactId;
}

class _PrayerRequestRepoProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PrayerRequestRepo,
        List<PrayerRequest>> with PrayerRequestRepoRef {
  _PrayerRequestRepoProviderElement(super.provider);

  @override
  int? get contactId => (origin as PrayerRequestRepoProvider).contactId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
