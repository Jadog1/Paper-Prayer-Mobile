// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../reminder_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchRemindersForGroupHash() =>
    r'56da2a390c3acc0dbd89d3dc918a3f0a24fc46b7';

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

/// See also [fetchRemindersForGroup].
@ProviderFor(fetchRemindersForGroup)
const fetchRemindersForGroupProvider = FetchRemindersForGroupFamily();

/// See also [fetchRemindersForGroup].
class FetchRemindersForGroupFamily
    extends Family<AsyncValue<List<RemindersForGroup>>> {
  /// See also [fetchRemindersForGroup].
  const FetchRemindersForGroupFamily();

  /// See also [fetchRemindersForGroup].
  FetchRemindersForGroupProvider call(
    int groupId,
  ) {
    return FetchRemindersForGroupProvider(
      groupId,
    );
  }

  @override
  FetchRemindersForGroupProvider getProviderOverride(
    covariant FetchRemindersForGroupProvider provider,
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
  String? get name => r'fetchRemindersForGroupProvider';
}

/// See also [fetchRemindersForGroup].
class FetchRemindersForGroupProvider
    extends AutoDisposeFutureProvider<List<RemindersForGroup>> {
  /// See also [fetchRemindersForGroup].
  FetchRemindersForGroupProvider(
    int groupId,
  ) : this._internal(
          (ref) => fetchRemindersForGroup(
            ref as FetchRemindersForGroupRef,
            groupId,
          ),
          from: fetchRemindersForGroupProvider,
          name: r'fetchRemindersForGroupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchRemindersForGroupHash,
          dependencies: FetchRemindersForGroupFamily._dependencies,
          allTransitiveDependencies:
              FetchRemindersForGroupFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  FetchRemindersForGroupProvider._internal(
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
            FetchRemindersForGroupRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchRemindersForGroupProvider._internal(
        (ref) => create(ref as FetchRemindersForGroupRef),
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
    return _FetchRemindersForGroupProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchRemindersForGroupProvider && other.groupId == groupId;
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
mixin FetchRemindersForGroupRef
    on AutoDisposeFutureProviderRef<List<RemindersForGroup>> {
  /// The parameter `groupId` of this provider.
  int get groupId;
}

class _FetchRemindersForGroupProviderElement
    extends AutoDisposeFutureProviderElement<List<RemindersForGroup>>
    with FetchRemindersForGroupRef {
  _FetchRemindersForGroupProviderElement(super.provider);

  @override
  int get groupId => (origin as FetchRemindersForGroupProvider).groupId;
}

String _$fetchReminderGroupsHash() =>
    r'51ea47d4741a47c1098f090f4c72146af295493f';

/// See also [fetchReminderGroups].
@ProviderFor(fetchReminderGroups)
final fetchReminderGroupsProvider =
    AutoDisposeFutureProvider<List<ReminderGroups>>.internal(
  fetchReminderGroups,
  name: r'fetchReminderGroupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchReminderGroupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchReminderGroupsRef
    = AutoDisposeFutureProviderRef<List<ReminderGroups>>;
String _$fetchReminderRecommendationsHash() =>
    r'c92732b587083417e263192a8df964627f1a791a';

/// See also [fetchReminderRecommendations].
@ProviderFor(fetchReminderRecommendations)
final fetchReminderRecommendationsProvider =
    AutoDisposeFutureProvider<List<Reminder>>.internal(
  fetchReminderRecommendations,
  name: r'fetchReminderRecommendationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchReminderRecommendationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchReminderRecommendationsRef
    = AutoDisposeFutureProviderRef<List<Reminder>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
