// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_dispose.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$keepAliveHash() => r'72dd192676126d487c24c7695a91d59410c62696';

/// See also [keepAlive].
@ProviderFor(keepAlive)
final keepAliveProvider = Provider<int>.internal(
  keepAlive,
  name: r'keepAliveProvider',
  debugGetCreateSourceHash: _riverpodIsDebugMode ? _$keepAliveHash : null,
  debugFamilyCallRuntimeType: null,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef KeepAliveRef = ProviderRef<int>;
String _$notKeepAliveHash() => r'1ccc497d7c651f8e730ec1bcecf271ffe9615d83';

/// See also [notKeepAlive].
@ProviderFor(notKeepAlive)
final notKeepAliveProvider = AutoDisposeProvider<int>.internal(
  notKeepAlive,
  name: r'notKeepAliveProvider',
  debugGetCreateSourceHash: _riverpodIsDebugMode ? _$notKeepAliveHash : null,
  debugFamilyCallRuntimeType: null,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotKeepAliveRef = AutoDisposeProviderRef<int>;
const _riverpodIsDebugMode = bool.fromEnvironment('dart.vm.product');
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
