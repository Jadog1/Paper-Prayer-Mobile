// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../reminder_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchRecommendationsForGroupHash() =>
    r'd6744f669464f114d0529a345ba0180d388b150b';

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

/// See also [fetchRecommendationsForGroup].
@ProviderFor(fetchRecommendationsForGroup)
const fetchRecommendationsForGroupProvider =
    FetchRecommendationsForGroupFamily();

/// See also [fetchRecommendationsForGroup].
class FetchRecommendationsForGroupFamily
    extends Family<AsyncValue<List<RemindersForGroup>>> {
  /// See also [fetchRecommendationsForGroup].
  const FetchRecommendationsForGroupFamily();

  /// See also [fetchRecommendationsForGroup].
  FetchRecommendationsForGroupProvider call(
    int groupId,
  ) {
    return FetchRecommendationsForGroupProvider(
      groupId,
    );
  }

  @override
  FetchRecommendationsForGroupProvider getProviderOverride(
    covariant FetchRecommendationsForGroupProvider provider,
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
  String? get name => r'fetchRecommendationsForGroupProvider';
}

/// See also [fetchRecommendationsForGroup].
class FetchRecommendationsForGroupProvider
    extends AutoDisposeFutureProvider<List<RemindersForGroup>> {
  /// See also [fetchRecommendationsForGroup].
  FetchRecommendationsForGroupProvider(
    int groupId,
  ) : this._internal(
          (ref) => fetchRecommendationsForGroup(
            ref as FetchRecommendationsForGroupRef,
            groupId,
          ),
          from: fetchRecommendationsForGroupProvider,
          name: r'fetchRecommendationsForGroupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRecommendationsForGroupHash,
          dependencies: FetchRecommendationsForGroupFamily._dependencies,
          allTransitiveDependencies:
              FetchRecommendationsForGroupFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  FetchRecommendationsForGroupProvider._internal(
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
    FutureOr<List<RemindersForGroup>> Function(
            FetchRecommendationsForGroupRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRecommendationsForGroupProvider._internal(
        (ref) => create(ref as FetchRecommendationsForGroupRef),
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
  AutoDisposeFutureProviderElement<List<RemindersForGroup>> createElement() {
    return _FetchRecommendationsForGroupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRecommendationsForGroupProvider &&
        other.groupId == groupId;
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
mixin FetchRecommendationsForGroupRef
    on AutoDisposeFutureProviderRef<List<RemindersForGroup>> {
  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _FetchRecommendationsForGroupProviderElement
    extends AutoDisposeFutureProviderElement<List<RemindersForGroup>>
    with FetchRecommendationsForGroupRef {
  _FetchRecommendationsForGroupProviderElement(super.provider);

  @override
  int get groupId => (origin as FetchRecommendationsForGroupProvider).groupId;
}

String _$fetchRecommendationGroupsHash() =>
    r'756f7367424b26690c7121eb51782861e6a9bca4';

/// See also [fetchRecommendationGroups].
@ProviderFor(fetchRecommendationGroups)
final fetchRecommendationGroupsProvider =
    AutoDisposeFutureProvider<List<ReminderGroups>>.internal(
  fetchRecommendationGroups,
  name: r'fetchRecommendationGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchRecommendationGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchRecommendationGroupsRef
    = AutoDisposeFutureProviderRef<List<ReminderGroups>>;
String _$recommendationRepoHash() =>
    r'022a17815d70bec40aeda6ced5df5f8c9789652f';

/// See also [RecommendationRepo].
@ProviderFor(RecommendationRepo)
final recommendationRepoProvider = AutoDisposeAsyncNotifierProvider<
    RecommendationRepo, List<Reminder>>.internal(
  RecommendationRepo.new,
  name: r'recommendationRepoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recommendationRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecommendationRepo = AutoDisposeAsyncNotifier<List<Reminder>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
