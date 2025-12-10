// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../usage_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUsageCostHash() => r'f35ac9fb84fb0369ca5d8c79940d1cddfb93fc23';

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

/// Fetch usage cost summary for a specific date range
///
/// Copied from [fetchUsageCost].
@ProviderFor(fetchUsageCost)
const fetchUsageCostProvider = FetchUsageCostFamily();

/// Fetch usage cost summary for a specific date range
///
/// Copied from [fetchUsageCost].
class FetchUsageCostFamily extends Family<AsyncValue<UsageCostSummary>> {
  /// Fetch usage cost summary for a specific date range
  ///
  /// Copied from [fetchUsageCost].
  const FetchUsageCostFamily();

  /// Fetch usage cost summary for a specific date range
  ///
  /// Copied from [fetchUsageCost].
  FetchUsageCostProvider call({
    required String startDate,
    required String endDate,
  }) {
    return FetchUsageCostProvider(
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  FetchUsageCostProvider getProviderOverride(
    covariant FetchUsageCostProvider provider,
  ) {
    return call(
      startDate: provider.startDate,
      endDate: provider.endDate,
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
  String? get name => r'fetchUsageCostProvider';
}

/// Fetch usage cost summary for a specific date range
///
/// Copied from [fetchUsageCost].
class FetchUsageCostProvider
    extends AutoDisposeFutureProvider<UsageCostSummary> {
  /// Fetch usage cost summary for a specific date range
  ///
  /// Copied from [fetchUsageCost].
  FetchUsageCostProvider({
    required String startDate,
    required String endDate,
  }) : this._internal(
          (ref) => fetchUsageCost(
            ref as FetchUsageCostRef,
            startDate: startDate,
            endDate: endDate,
          ),
          from: fetchUsageCostProvider,
          name: r'fetchUsageCostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchUsageCostHash,
          dependencies: FetchUsageCostFamily._dependencies,
          allTransitiveDependencies:
              FetchUsageCostFamily._allTransitiveDependencies,
          startDate: startDate,
          endDate: endDate,
        );

  FetchUsageCostProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final String startDate;
  final String endDate;

  @override
  Override overrideWith(
    FutureOr<UsageCostSummary> Function(FetchUsageCostRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchUsageCostProvider._internal(
        (ref) => create(ref as FetchUsageCostRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UsageCostSummary> createElement() {
    return _FetchUsageCostProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUsageCostProvider &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchUsageCostRef on AutoDisposeFutureProviderRef<UsageCostSummary> {
  /// The parameter `startDate` of this provider.
  String get startDate;

  /// The parameter `endDate` of this provider.
  String get endDate;
}

class _FetchUsageCostProviderElement
    extends AutoDisposeFutureProviderElement<UsageCostSummary>
    with FetchUsageCostRef {
  _FetchUsageCostProviderElement(super.provider);

  @override
  String get startDate => (origin as FetchUsageCostProvider).startDate;
  @override
  String get endDate => (origin as FetchUsageCostProvider).endDate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
