// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchContactGroupHash() => r'fe20ca5ac939236b67ddc28139eba5c3323ec748';

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

/// See also [fetchContactGroup].
@ProviderFor(fetchContactGroup)
const fetchContactGroupProvider = FetchContactGroupFamily();

/// See also [fetchContactGroup].
class FetchContactGroupFamily extends Family<AsyncValue<ContactGroupPairs>> {
  /// See also [fetchContactGroup].
  const FetchContactGroupFamily();

  /// See also [fetchContactGroup].
  FetchContactGroupProvider call(
    int contactId,
    int groupId,
  ) {
    return FetchContactGroupProvider(
      contactId,
      groupId,
    );
  }

  @override
  FetchContactGroupProvider getProviderOverride(
    covariant FetchContactGroupProvider provider,
  ) {
    return call(
      provider.contactId,
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
  String? get name => r'fetchContactGroupProvider';
}

/// See also [fetchContactGroup].
class FetchContactGroupProvider
    extends AutoDisposeFutureProvider<ContactGroupPairs> {
  /// See also [fetchContactGroup].
  FetchContactGroupProvider(
    int contactId,
    int groupId,
  ) : this._internal(
          (ref) => fetchContactGroup(
            ref as FetchContactGroupRef,
            contactId,
            groupId,
          ),
          from: fetchContactGroupProvider,
          name: r'fetchContactGroupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchContactGroupHash,
          dependencies: FetchContactGroupFamily._dependencies,
          allTransitiveDependencies:
              FetchContactGroupFamily._allTransitiveDependencies,
          contactId: contactId,
          groupId: groupId,
        );

  FetchContactGroupProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.contactId,
    required this.groupId,
  }) : super.internal();

  final int contactId;
  final int groupId;

  @override
  Override overrideWith(
    FutureOr<ContactGroupPairs> Function(FetchContactGroupRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchContactGroupProvider._internal(
        (ref) => create(ref as FetchContactGroupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        contactId: contactId,
        groupId: groupId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ContactGroupPairs> createElement() {
    return _FetchContactGroupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchContactGroupProvider &&
        other.contactId == contactId &&
        other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contactId.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchContactGroupRef on AutoDisposeFutureProviderRef<ContactGroupPairs> {
  /// The parameter `contactId` of this provider.
  int get contactId;

  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _FetchContactGroupProviderElement
    extends AutoDisposeFutureProviderElement<ContactGroupPairs>
    with FetchContactGroupRef {
  _FetchContactGroupProviderElement(super.provider);

  @override
  int get contactId => (origin as FetchContactGroupProvider).contactId;
  @override
  int get groupId => (origin as FetchContactGroupProvider).groupId;
}

String _$fetchCollectionsAndContactsHash() =>
    r'5b34428a929183ffc2e722e09db7101ff1ab78ee';

/// See also [fetchCollectionsAndContacts].
@ProviderFor(fetchCollectionsAndContacts)
const fetchCollectionsAndContactsProvider = FetchCollectionsAndContactsFamily();

/// See also [fetchCollectionsAndContacts].
class FetchCollectionsAndContactsFamily
    extends Family<AsyncValue<UserCollectionsAndContacts>> {
  /// See also [fetchCollectionsAndContacts].
  const FetchCollectionsAndContactsFamily();

  /// See also [fetchCollectionsAndContacts].
  FetchCollectionsAndContactsProvider call(
    Contact contact,
    Group group,
  ) {
    return FetchCollectionsAndContactsProvider(
      contact,
      group,
    );
  }

  @override
  FetchCollectionsAndContactsProvider getProviderOverride(
    covariant FetchCollectionsAndContactsProvider provider,
  ) {
    return call(
      provider.contact,
      provider.group,
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
  String? get name => r'fetchCollectionsAndContactsProvider';
}

/// See also [fetchCollectionsAndContacts].
class FetchCollectionsAndContactsProvider
    extends AutoDisposeFutureProvider<UserCollectionsAndContacts> {
  /// See also [fetchCollectionsAndContacts].
  FetchCollectionsAndContactsProvider(
    Contact contact,
    Group group,
  ) : this._internal(
          (ref) => fetchCollectionsAndContacts(
            ref as FetchCollectionsAndContactsRef,
            contact,
            group,
          ),
          from: fetchCollectionsAndContactsProvider,
          name: r'fetchCollectionsAndContactsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCollectionsAndContactsHash,
          dependencies: FetchCollectionsAndContactsFamily._dependencies,
          allTransitiveDependencies:
              FetchCollectionsAndContactsFamily._allTransitiveDependencies,
          contact: contact,
          group: group,
        );

  FetchCollectionsAndContactsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.contact,
    required this.group,
  }) : super.internal();

  final Contact contact;
  final Group group;

  @override
  Override overrideWith(
    FutureOr<UserCollectionsAndContacts> Function(
            FetchCollectionsAndContactsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCollectionsAndContactsProvider._internal(
        (ref) => create(ref as FetchCollectionsAndContactsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        contact: contact,
        group: group,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserCollectionsAndContacts> createElement() {
    return _FetchCollectionsAndContactsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCollectionsAndContactsProvider &&
        other.contact == contact &&
        other.group == group;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, contact.hashCode);
    hash = _SystemHash.combine(hash, group.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchCollectionsAndContactsRef
    on AutoDisposeFutureProviderRef<UserCollectionsAndContacts> {
  /// The parameter `contact` of this provider.
  Contact get contact;

  /// The parameter `group` of this provider.
  Group get group;
}

class _FetchCollectionsAndContactsProviderElement
    extends AutoDisposeFutureProviderElement<UserCollectionsAndContacts>
    with FetchCollectionsAndContactsRef {
  _FetchCollectionsAndContactsProviderElement(super.provider);

  @override
  Contact get contact =>
      (origin as FetchCollectionsAndContactsProvider).contact;
  @override
  Group get group => (origin as FetchCollectionsAndContactsProvider).group;
}

String _$fetchRelatedContactsHash() =>
    r'9e17c76254146b2c4c6c51b72c32f5efb426427b';

/// See also [fetchRelatedContacts].
@ProviderFor(fetchRelatedContacts)
const fetchRelatedContactsProvider = FetchRelatedContactsFamily();

/// See also [fetchRelatedContacts].
class FetchRelatedContactsFamily
    extends Family<AsyncValue<List<RelatedContact>>> {
  /// See also [fetchRelatedContacts].
  const FetchRelatedContactsFamily();

  /// See also [fetchRelatedContacts].
  FetchRelatedContactsProvider call(
    int contactId,
  ) {
    return FetchRelatedContactsProvider(
      contactId,
    );
  }

  @override
  FetchRelatedContactsProvider getProviderOverride(
    covariant FetchRelatedContactsProvider provider,
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
  String? get name => r'fetchRelatedContactsProvider';
}

/// See also [fetchRelatedContacts].
class FetchRelatedContactsProvider
    extends AutoDisposeFutureProvider<List<RelatedContact>> {
  /// See also [fetchRelatedContacts].
  FetchRelatedContactsProvider(
    int contactId,
  ) : this._internal(
          (ref) => fetchRelatedContacts(
            ref as FetchRelatedContactsRef,
            contactId,
          ),
          from: fetchRelatedContactsProvider,
          name: r'fetchRelatedContactsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRelatedContactsHash,
          dependencies: FetchRelatedContactsFamily._dependencies,
          allTransitiveDependencies:
              FetchRelatedContactsFamily._allTransitiveDependencies,
          contactId: contactId,
        );

  FetchRelatedContactsProvider._internal(
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
    FutureOr<List<RelatedContact>> Function(FetchRelatedContactsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRelatedContactsProvider._internal(
        (ref) => create(ref as FetchRelatedContactsRef),
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
    return _FetchRelatedContactsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRelatedContactsProvider &&
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
mixin FetchRelatedContactsRef
    on AutoDisposeFutureProviderRef<List<RelatedContact>> {
  /// The parameter `contactId` of this provider.
  int get contactId;
}

class _FetchRelatedContactsProviderElement
    extends AutoDisposeFutureProviderElement<List<RelatedContact>>
    with FetchRelatedContactsRef {
  _FetchRelatedContactsProviderElement(super.provider);

  @override
  int get contactId => (origin as FetchRelatedContactsProvider).contactId;
}

String _$fetchSimilarRequestsHash() =>
    r'bceac8b5307af19b02075ed9f35e3882dc330b27';

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

String _$fetchBibleVersesForPrayerRequestHash() =>
    r'4022786c5915752aca9b5fd95a9e852dbe487b36';

/// See also [fetchBibleVersesForPrayerRequest].
@ProviderFor(fetchBibleVersesForPrayerRequest)
const fetchBibleVersesForPrayerRequestProvider =
    FetchBibleVersesForPrayerRequestFamily();

/// See also [fetchBibleVersesForPrayerRequest].
class FetchBibleVersesForPrayerRequestFamily
    extends Family<AsyncValue<List<BibleReferenceAndText>>> {
  /// See also [fetchBibleVersesForPrayerRequest].
  const FetchBibleVersesForPrayerRequestFamily();

  /// See also [fetchBibleVersesForPrayerRequest].
  FetchBibleVersesForPrayerRequestProvider call(
    int requestId,
  ) {
    return FetchBibleVersesForPrayerRequestProvider(
      requestId,
    );
  }

  @override
  FetchBibleVersesForPrayerRequestProvider getProviderOverride(
    covariant FetchBibleVersesForPrayerRequestProvider provider,
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
  String? get name => r'fetchBibleVersesForPrayerRequestProvider';
}

/// See also [fetchBibleVersesForPrayerRequest].
class FetchBibleVersesForPrayerRequestProvider
    extends AutoDisposeFutureProvider<List<BibleReferenceAndText>> {
  /// See also [fetchBibleVersesForPrayerRequest].
  FetchBibleVersesForPrayerRequestProvider(
    int requestId,
  ) : this._internal(
          (ref) => fetchBibleVersesForPrayerRequest(
            ref as FetchBibleVersesForPrayerRequestRef,
            requestId,
          ),
          from: fetchBibleVersesForPrayerRequestProvider,
          name: r'fetchBibleVersesForPrayerRequestProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchBibleVersesForPrayerRequestHash,
          dependencies: FetchBibleVersesForPrayerRequestFamily._dependencies,
          allTransitiveDependencies:
              FetchBibleVersesForPrayerRequestFamily._allTransitiveDependencies,
          requestId: requestId,
        );

  FetchBibleVersesForPrayerRequestProvider._internal(
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
    FutureOr<List<BibleReferenceAndText>> Function(
            FetchBibleVersesForPrayerRequestRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchBibleVersesForPrayerRequestProvider._internal(
        (ref) => create(ref as FetchBibleVersesForPrayerRequestRef),
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
  AutoDisposeFutureProviderElement<List<BibleReferenceAndText>>
      createElement() {
    return _FetchBibleVersesForPrayerRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchBibleVersesForPrayerRequestProvider &&
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
mixin FetchBibleVersesForPrayerRequestRef
    on AutoDisposeFutureProviderRef<List<BibleReferenceAndText>> {
  /// The parameter `requestId` of this provider.
  int get requestId;
}

class _FetchBibleVersesForPrayerRequestProviderElement
    extends AutoDisposeFutureProviderElement<List<BibleReferenceAndText>>
    with FetchBibleVersesForPrayerRequestRef {
  _FetchBibleVersesForPrayerRequestProviderElement(super.provider);

  @override
  int get requestId =>
      (origin as FetchBibleVersesForPrayerRequestProvider).requestId;
}

String _$groupContactsRepoHash() => r'5bd39288acbb9785049805abcc080a15e5dc7c31';

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
String _$prayerRequestRepoHash() => r'9da34ed39f54faaa95bb132da621e4bbea4b7294';

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
