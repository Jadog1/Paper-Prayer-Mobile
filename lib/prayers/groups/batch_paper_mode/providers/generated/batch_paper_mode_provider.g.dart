// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../batch_paper_mode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$batchPaperModeNotifierHash() =>
    r'7b15707b2d08b5b512ae84982eccfccc840a63b3';

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

abstract class _$BatchPaperModeNotifier
    extends BuildlessAutoDisposeNotifier<BatchPaperModeState> {
  late final BatchPaperModeConfig config;

  BatchPaperModeState build(
    BatchPaperModeConfig config,
  );
}

/// See also [BatchPaperModeNotifier].
@ProviderFor(BatchPaperModeNotifier)
const batchPaperModeNotifierProvider = BatchPaperModeNotifierFamily();

/// See also [BatchPaperModeNotifier].
class BatchPaperModeNotifierFamily extends Family<BatchPaperModeState> {
  /// See also [BatchPaperModeNotifier].
  const BatchPaperModeNotifierFamily();

  /// See also [BatchPaperModeNotifier].
  BatchPaperModeNotifierProvider call(
    BatchPaperModeConfig config,
  ) {
    return BatchPaperModeNotifierProvider(
      config,
    );
  }

  @override
  BatchPaperModeNotifierProvider getProviderOverride(
    covariant BatchPaperModeNotifierProvider provider,
  ) {
    return call(
      provider.config,
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
  String? get name => r'batchPaperModeNotifierProvider';
}

/// See also [BatchPaperModeNotifier].
class BatchPaperModeNotifierProvider extends AutoDisposeNotifierProviderImpl<
    BatchPaperModeNotifier, BatchPaperModeState> {
  /// See also [BatchPaperModeNotifier].
  BatchPaperModeNotifierProvider(
    BatchPaperModeConfig config,
  ) : this._internal(
          () => BatchPaperModeNotifier()..config = config,
          from: batchPaperModeNotifierProvider,
          name: r'batchPaperModeNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$batchPaperModeNotifierHash,
          dependencies: BatchPaperModeNotifierFamily._dependencies,
          allTransitiveDependencies:
              BatchPaperModeNotifierFamily._allTransitiveDependencies,
          config: config,
        );

  BatchPaperModeNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.config,
  }) : super.internal();

  final BatchPaperModeConfig config;

  @override
  BatchPaperModeState runNotifierBuild(
    covariant BatchPaperModeNotifier notifier,
  ) {
    return notifier.build(
      config,
    );
  }

  @override
  Override overrideWith(BatchPaperModeNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: BatchPaperModeNotifierProvider._internal(
        () => create()..config = config,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        config: config,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<BatchPaperModeNotifier,
      BatchPaperModeState> createElement() {
    return _BatchPaperModeNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BatchPaperModeNotifierProvider && other.config == config;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, config.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BatchPaperModeNotifierRef
    on AutoDisposeNotifierProviderRef<BatchPaperModeState> {
  /// The parameter `config` of this provider.
  BatchPaperModeConfig get config;
}

class _BatchPaperModeNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<BatchPaperModeNotifier,
        BatchPaperModeState> with BatchPaperModeNotifierRef {
  _BatchPaperModeNotifierProviderElement(super.provider);

  @override
  BatchPaperModeConfig get config =>
      (origin as BatchPaperModeNotifierProvider).config;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
