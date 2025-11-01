// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../mobile_auth_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$exchangeFirebaseTokenHash() =>
    r'af7a372bba7cd957411729952663c2fa2e029686';

/// Get a mobile session ID by exchanging the current user's Firebase token
///
/// Copied from [exchangeFirebaseToken].
@ProviderFor(exchangeFirebaseToken)
final exchangeFirebaseTokenProvider =
    AutoDisposeFutureProvider<MobileAuthSession>.internal(
  exchangeFirebaseToken,
  name: r'exchangeFirebaseTokenProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$exchangeFirebaseTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ExchangeFirebaseTokenRef
    = AutoDisposeFutureProviderRef<MobileAuthSession>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
