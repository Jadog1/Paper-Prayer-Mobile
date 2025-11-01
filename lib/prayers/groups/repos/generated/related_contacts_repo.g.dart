// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../related_contacts_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchRelatedContactsForContactHash() =>
    r'7a347c0a781d735af841af541687a8244f319c46';

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

/// Fetch all related contacts for a contact
///
/// Copied from [fetchRelatedContactsForContact].
@ProviderFor(fetchRelatedContactsForContact)
const fetchRelatedContactsForContactProvider =
    FetchRelatedContactsForContactFamily();

/// Fetch all related contacts for a contact
///
/// Copied from [fetchRelatedContactsForContact].
class FetchRelatedContactsForContactFamily
    extends Family<AsyncValue<List<RelatedContact>>> {
  /// Fetch all related contacts for a contact
  ///
  /// Copied from [fetchRelatedContactsForContact].
  const FetchRelatedContactsForContactFamily();

  /// Fetch all related contacts for a contact
  ///
  /// Copied from [fetchRelatedContactsForContact].
  FetchRelatedContactsForContactProvider call(
    int contactId,
  ) {
    return FetchRelatedContactsForContactProvider(
      contactId,
    );
  }

  @override
  FetchRelatedContactsForContactProvider getProviderOverride(
    covariant FetchRelatedContactsForContactProvider provider,
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
  String? get name => r'fetchRelatedContactsForContactProvider';
}

/// Fetch all related contacts for a contact
///
/// Copied from [fetchRelatedContactsForContact].
class FetchRelatedContactsForContactProvider
    extends AutoDisposeFutureProvider<List<RelatedContact>> {
  /// Fetch all related contacts for a contact
  ///
  /// Copied from [fetchRelatedContactsForContact].
  FetchRelatedContactsForContactProvider(
    int contactId,
  ) : this._internal(
          (ref) => fetchRelatedContactsForContact(
            ref as FetchRelatedContactsForContactRef,
            contactId,
          ),
          from: fetchRelatedContactsForContactProvider,
          name: r'fetchRelatedContactsForContactProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRelatedContactsForContactHash,
          dependencies: FetchRelatedContactsForContactFamily._dependencies,
          allTransitiveDependencies:
              FetchRelatedContactsForContactFamily._allTransitiveDependencies,
          contactId: contactId,
        );

  FetchRelatedContactsForContactProvider._internal(
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
    FutureOr<List<RelatedContact>> Function(
            FetchRelatedContactsForContactRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRelatedContactsForContactProvider._internal(
        (ref) => create(ref as FetchRelatedContactsForContactRef),
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
  AutoDisposeFutureProviderElement<List<RelatedContact>> createElement() {
    return _FetchRelatedContactsForContactProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRelatedContactsForContactProvider &&
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
mixin FetchRelatedContactsForContactRef
    on AutoDisposeFutureProviderRef<List<RelatedContact>> {
  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _FetchRelatedContactsForContactProviderElement
    extends AutoDisposeFutureProviderElement<List<RelatedContact>>
    with FetchRelatedContactsForContactRef {
  _FetchRelatedContactsForContactProviderElement(super.provider);

  @override
  int get contactId =>
      (origin as FetchRelatedContactsForContactProvider).contactId;
}

String _$fetchRelatedContactHash() =>
    r'ede35a5b9a50d74d5c7049572b13f169129be1a8';

/// Fetch a single related contact by ID
///
/// Copied from [fetchRelatedContact].
@ProviderFor(fetchRelatedContact)
const fetchRelatedContactProvider = FetchRelatedContactFamily();

/// Fetch a single related contact by ID
///
/// Copied from [fetchRelatedContact].
class FetchRelatedContactFamily extends Family<AsyncValue<RelatedContact>> {
  /// Fetch a single related contact by ID
  ///
  /// Copied from [fetchRelatedContact].
  const FetchRelatedContactFamily();

  /// Fetch a single related contact by ID
  ///
  /// Copied from [fetchRelatedContact].
  FetchRelatedContactProvider call(
    int relatedContactId,
  ) {
    return FetchRelatedContactProvider(
      relatedContactId,
    );
  }

  @override
  FetchRelatedContactProvider getProviderOverride(
    covariant FetchRelatedContactProvider provider,
  ) {
    return call(
      provider.relatedContactId,
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
  String? get name => r'fetchRelatedContactProvider';
}

/// Fetch a single related contact by ID
///
/// Copied from [fetchRelatedContact].
class FetchRelatedContactProvider
    extends AutoDisposeFutureProvider<RelatedContact> {
  /// Fetch a single related contact by ID
  ///
  /// Copied from [fetchRelatedContact].
  FetchRelatedContactProvider(
    int relatedContactId,
  ) : this._internal(
          (ref) => fetchRelatedContact(
            ref as FetchRelatedContactRef,
            relatedContactId,
          ),
          from: fetchRelatedContactProvider,
          name: r'fetchRelatedContactProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRelatedContactHash,
          dependencies: FetchRelatedContactFamily._dependencies,
          allTransitiveDependencies:
              FetchRelatedContactFamily._allTransitiveDependencies,
          relatedContactId: relatedContactId,
        );

  FetchRelatedContactProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.relatedContactId,
  }) : super.internal();

  final int relatedContactId;

  @override
  Override overrideWith(
    FutureOr<RelatedContact> Function(FetchRelatedContactRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRelatedContactProvider._internal(
        (ref) => create(ref as FetchRelatedContactRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        relatedContactId: relatedContactId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RelatedContact> createElement() {
    return _FetchRelatedContactProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRelatedContactProvider &&
        other.relatedContactId == relatedContactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, relatedContactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchRelatedContactRef on AutoDisposeFutureProviderRef<RelatedContact> {
  /// The parameter `relatedContactId` of this provider.
  int get relatedContactId;
}

class _FetchRelatedContactProviderElement
    extends AutoDisposeFutureProviderElement<RelatedContact>
    with FetchRelatedContactRef {
  _FetchRelatedContactProviderElement(super.provider);

  @override
  int get relatedContactId =>
      (origin as FetchRelatedContactProvider).relatedContactId;
}

String _$fetchPrayerRequestsForRelatedContactHash() =>
    r'ac978c190a3e691b90d7cb00d3c6e43f205b01e6';

/// Fetch prayer requests for a related contact
///
/// Copied from [fetchPrayerRequestsForRelatedContact].
@ProviderFor(fetchPrayerRequestsForRelatedContact)
const fetchPrayerRequestsForRelatedContactProvider =
    FetchPrayerRequestsForRelatedContactFamily();

/// Fetch prayer requests for a related contact
///
/// Copied from [fetchPrayerRequestsForRelatedContact].
class FetchPrayerRequestsForRelatedContactFamily
    extends Family<AsyncValue<List<PrayerRequest>>> {
  /// Fetch prayer requests for a related contact
  ///
  /// Copied from [fetchPrayerRequestsForRelatedContact].
  const FetchPrayerRequestsForRelatedContactFamily();

  /// Fetch prayer requests for a related contact
  ///
  /// Copied from [fetchPrayerRequestsForRelatedContact].
  FetchPrayerRequestsForRelatedContactProvider call(
    int relatedContactId,
  ) {
    return FetchPrayerRequestsForRelatedContactProvider(
      relatedContactId,
    );
  }

  @override
  FetchPrayerRequestsForRelatedContactProvider getProviderOverride(
    covariant FetchPrayerRequestsForRelatedContactProvider provider,
  ) {
    return call(
      provider.relatedContactId,
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
  String? get name => r'fetchPrayerRequestsForRelatedContactProvider';
}

/// Fetch prayer requests for a related contact
///
/// Copied from [fetchPrayerRequestsForRelatedContact].
class FetchPrayerRequestsForRelatedContactProvider
    extends AutoDisposeFutureProvider<List<PrayerRequest>> {
  /// Fetch prayer requests for a related contact
  ///
  /// Copied from [fetchPrayerRequestsForRelatedContact].
  FetchPrayerRequestsForRelatedContactProvider(
    int relatedContactId,
  ) : this._internal(
          (ref) => fetchPrayerRequestsForRelatedContact(
            ref as FetchPrayerRequestsForRelatedContactRef,
            relatedContactId,
          ),
          from: fetchPrayerRequestsForRelatedContactProvider,
          name: r'fetchPrayerRequestsForRelatedContactProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPrayerRequestsForRelatedContactHash,
          dependencies:
              FetchPrayerRequestsForRelatedContactFamily._dependencies,
          allTransitiveDependencies: FetchPrayerRequestsForRelatedContactFamily
              ._allTransitiveDependencies,
          relatedContactId: relatedContactId,
        );

  FetchPrayerRequestsForRelatedContactProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.relatedContactId,
  }) : super.internal();

  final int relatedContactId;

  @override
  Override overrideWith(
    FutureOr<List<PrayerRequest>> Function(
            FetchPrayerRequestsForRelatedContactRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPrayerRequestsForRelatedContactProvider._internal(
        (ref) => create(ref as FetchPrayerRequestsForRelatedContactRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        relatedContactId: relatedContactId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PrayerRequest>> createElement() {
    return _FetchPrayerRequestsForRelatedContactProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPrayerRequestsForRelatedContactProvider &&
        other.relatedContactId == relatedContactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, relatedContactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchPrayerRequestsForRelatedContactRef
    on AutoDisposeFutureProviderRef<List<PrayerRequest>> {
  /// The parameter `relatedContactId` of this provider.
  int get relatedContactId;
}

class _FetchPrayerRequestsForRelatedContactProviderElement
    extends AutoDisposeFutureProviderElement<List<PrayerRequest>>
    with FetchPrayerRequestsForRelatedContactRef {
  _FetchPrayerRequestsForRelatedContactProviderElement(super.provider);

  @override
  int get relatedContactId =>
      (origin as FetchPrayerRequestsForRelatedContactProvider).relatedContactId;
}

String _$fetchContactForRelatedContactHash() =>
    r'8499a4fe35cf2026fb78319f2f7d9809aa2f1b37';

/// Fetch the associated contact for a related contact
///
/// Copied from [fetchContactForRelatedContact].
@ProviderFor(fetchContactForRelatedContact)
const fetchContactForRelatedContactProvider =
    FetchContactForRelatedContactFamily();

/// Fetch the associated contact for a related contact
///
/// Copied from [fetchContactForRelatedContact].
class FetchContactForRelatedContactFamily extends Family<AsyncValue<Contact>> {
  /// Fetch the associated contact for a related contact
  ///
  /// Copied from [fetchContactForRelatedContact].
  const FetchContactForRelatedContactFamily();

  /// Fetch the associated contact for a related contact
  ///
  /// Copied from [fetchContactForRelatedContact].
  FetchContactForRelatedContactProvider call(
    int relatedContactId,
  ) {
    return FetchContactForRelatedContactProvider(
      relatedContactId,
    );
  }

  @override
  FetchContactForRelatedContactProvider getProviderOverride(
    covariant FetchContactForRelatedContactProvider provider,
  ) {
    return call(
      provider.relatedContactId,
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
  String? get name => r'fetchContactForRelatedContactProvider';
}

/// Fetch the associated contact for a related contact
///
/// Copied from [fetchContactForRelatedContact].
class FetchContactForRelatedContactProvider
    extends AutoDisposeFutureProvider<Contact> {
  /// Fetch the associated contact for a related contact
  ///
  /// Copied from [fetchContactForRelatedContact].
  FetchContactForRelatedContactProvider(
    int relatedContactId,
  ) : this._internal(
          (ref) => fetchContactForRelatedContact(
            ref as FetchContactForRelatedContactRef,
            relatedContactId,
          ),
          from: fetchContactForRelatedContactProvider,
          name: r'fetchContactForRelatedContactProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchContactForRelatedContactHash,
          dependencies: FetchContactForRelatedContactFamily._dependencies,
          allTransitiveDependencies:
              FetchContactForRelatedContactFamily._allTransitiveDependencies,
          relatedContactId: relatedContactId,
        );

  FetchContactForRelatedContactProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.relatedContactId,
  }) : super.internal();

  final int relatedContactId;

  @override
  Override overrideWith(
    FutureOr<Contact> Function(FetchContactForRelatedContactRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchContactForRelatedContactProvider._internal(
        (ref) => create(ref as FetchContactForRelatedContactRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        relatedContactId: relatedContactId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Contact> createElement() {
    return _FetchContactForRelatedContactProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchContactForRelatedContactProvider &&
        other.relatedContactId == relatedContactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, relatedContactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchContactForRelatedContactRef
    on AutoDisposeFutureProviderRef<Contact> {
  /// The parameter `relatedContactId` of this provider.
  int get relatedContactId;
}

class _FetchContactForRelatedContactProviderElement
    extends AutoDisposeFutureProviderElement<Contact>
    with FetchContactForRelatedContactRef {
  _FetchContactForRelatedContactProviderElement(super.provider);

  @override
  int get relatedContactId =>
      (origin as FetchContactForRelatedContactProvider).relatedContactId;
}

String _$fetchRelatedContactWithDataHash() =>
    r'ef937be25828c28f739a4020731fdd153b915a95';

/// Fetch a related contact with all its associated data
///
/// Copied from [fetchRelatedContactWithData].
@ProviderFor(fetchRelatedContactWithData)
const fetchRelatedContactWithDataProvider = FetchRelatedContactWithDataFamily();

/// Fetch a related contact with all its associated data
///
/// Copied from [fetchRelatedContactWithData].
class FetchRelatedContactWithDataFamily
    extends Family<AsyncValue<RelatedContactWithData>> {
  /// Fetch a related contact with all its associated data
  ///
  /// Copied from [fetchRelatedContactWithData].
  const FetchRelatedContactWithDataFamily();

  /// Fetch a related contact with all its associated data
  ///
  /// Copied from [fetchRelatedContactWithData].
  FetchRelatedContactWithDataProvider call(
    int relatedContactId,
  ) {
    return FetchRelatedContactWithDataProvider(
      relatedContactId,
    );
  }

  @override
  FetchRelatedContactWithDataProvider getProviderOverride(
    covariant FetchRelatedContactWithDataProvider provider,
  ) {
    return call(
      provider.relatedContactId,
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
  String? get name => r'fetchRelatedContactWithDataProvider';
}

/// Fetch a related contact with all its associated data
///
/// Copied from [fetchRelatedContactWithData].
class FetchRelatedContactWithDataProvider
    extends AutoDisposeFutureProvider<RelatedContactWithData> {
  /// Fetch a related contact with all its associated data
  ///
  /// Copied from [fetchRelatedContactWithData].
  FetchRelatedContactWithDataProvider(
    int relatedContactId,
  ) : this._internal(
          (ref) => fetchRelatedContactWithData(
            ref as FetchRelatedContactWithDataRef,
            relatedContactId,
          ),
          from: fetchRelatedContactWithDataProvider,
          name: r'fetchRelatedContactWithDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRelatedContactWithDataHash,
          dependencies: FetchRelatedContactWithDataFamily._dependencies,
          allTransitiveDependencies:
              FetchRelatedContactWithDataFamily._allTransitiveDependencies,
          relatedContactId: relatedContactId,
        );

  FetchRelatedContactWithDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.relatedContactId,
  }) : super.internal();

  final int relatedContactId;

  @override
  Override overrideWith(
    FutureOr<RelatedContactWithData> Function(
            FetchRelatedContactWithDataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRelatedContactWithDataProvider._internal(
        (ref) => create(ref as FetchRelatedContactWithDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        relatedContactId: relatedContactId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<RelatedContactWithData> createElement() {
    return _FetchRelatedContactWithDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRelatedContactWithDataProvider &&
        other.relatedContactId == relatedContactId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, relatedContactId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchRelatedContactWithDataRef
    on AutoDisposeFutureProviderRef<RelatedContactWithData> {
  /// The parameter `relatedContactId` of this provider.
  int get relatedContactId;
}

class _FetchRelatedContactWithDataProviderElement
    extends AutoDisposeFutureProviderElement<RelatedContactWithData>
    with FetchRelatedContactWithDataRef {
  _FetchRelatedContactWithDataProviderElement(super.provider);

  @override
  int get relatedContactId =>
      (origin as FetchRelatedContactWithDataProvider).relatedContactId;
}

String _$relatedContactsRepoHash() =>
    r'9158f875e688d3959fbba8613e1a5a6b95e740b1';

abstract class _$RelatedContactsRepo
    extends BuildlessAutoDisposeAsyncNotifier<List<RelatedContact>> {
  late final int contactId;

  FutureOr<List<RelatedContact>> build(
    int contactId,
  );
}

/// Repository for managing related contacts
///
/// Copied from [RelatedContactsRepo].
@ProviderFor(RelatedContactsRepo)
const relatedContactsRepoProvider = RelatedContactsRepoFamily();

/// Repository for managing related contacts
///
/// Copied from [RelatedContactsRepo].
class RelatedContactsRepoFamily
    extends Family<AsyncValue<List<RelatedContact>>> {
  /// Repository for managing related contacts
  ///
  /// Copied from [RelatedContactsRepo].
  const RelatedContactsRepoFamily();

  /// Repository for managing related contacts
  ///
  /// Copied from [RelatedContactsRepo].
  RelatedContactsRepoProvider call(
    int contactId,
  ) {
    return RelatedContactsRepoProvider(
      contactId,
    );
  }

  @override
  RelatedContactsRepoProvider getProviderOverride(
    covariant RelatedContactsRepoProvider provider,
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
  String? get name => r'relatedContactsRepoProvider';
}

/// Repository for managing related contacts
///
/// Copied from [RelatedContactsRepo].
class RelatedContactsRepoProvider extends AutoDisposeAsyncNotifierProviderImpl<
    RelatedContactsRepo, List<RelatedContact>> {
  /// Repository for managing related contacts
  ///
  /// Copied from [RelatedContactsRepo].
  RelatedContactsRepoProvider(
    int contactId,
  ) : this._internal(
          () => RelatedContactsRepo()..contactId = contactId,
          from: relatedContactsRepoProvider,
          name: r'relatedContactsRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$relatedContactsRepoHash,
          dependencies: RelatedContactsRepoFamily._dependencies,
          allTransitiveDependencies:
              RelatedContactsRepoFamily._allTransitiveDependencies,
          contactId: contactId,
        );

  RelatedContactsRepoProvider._internal(
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
  FutureOr<List<RelatedContact>> runNotifierBuild(
    covariant RelatedContactsRepo notifier,
  ) {
    return notifier.build(
      contactId,
    );
  }

  @override
  Override overrideWith(RelatedContactsRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: RelatedContactsRepoProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<RelatedContactsRepo,
      List<RelatedContact>> createElement() {
    return _RelatedContactsRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RelatedContactsRepoProvider && other.contactId == contactId;
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
mixin RelatedContactsRepoRef
    on AutoDisposeAsyncNotifierProviderRef<List<RelatedContact>> {
  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _RelatedContactsRepoProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RelatedContactsRepo,
        List<RelatedContact>> with RelatedContactsRepoRef {
  _RelatedContactsRepoProviderElement(super.provider);

  @override
  int get contactId => (origin as RelatedContactsRepoProvider).contactId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
