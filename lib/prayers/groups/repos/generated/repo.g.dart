// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchGroupContactsHash() =>
    r'a9f8050435d5bcb003a59f9933bb343ce9823a0c';

/// See also [fetchGroupContacts].
@ProviderFor(fetchGroupContacts)
final fetchGroupContactsProvider =
    AutoDisposeFutureProvider<List<GroupContacts>>.internal(
  fetchGroupContacts,
  name: r'fetchGroupContactsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchGroupContactsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchGroupContactsRef
    = AutoDisposeFutureProviderRef<List<GroupContacts>>;
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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
