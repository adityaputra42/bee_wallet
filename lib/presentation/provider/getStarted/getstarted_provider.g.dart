// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getstarted_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$passwordHash() => r'98211458efdb29cc12d924744f8053175ce5d2de';

/// See also [password].
@ProviderFor(password)
final passwordProvider = AutoDisposeFutureProvider<void>.internal(
  password,
  name: r'passwordProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$passwordHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PasswordRef = AutoDisposeFutureProviderRef<void>;
String _$disableGetStartedHash() => r'255c503e0c129de4a989b37b8977746faa9b731a';

/// See also [DisableGetStarted].
@ProviderFor(DisableGetStarted)
final disableGetStartedProvider =
    AutoDisposeNotifierProvider<DisableGetStarted, bool>.internal(
  DisableGetStarted.new,
  name: r'disableGetStartedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$disableGetStartedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisableGetStarted = AutoDisposeNotifier<bool>;
String _$userTermHash() => r'c0221cbc59aaacfd84ab3bc7ea20da76ac2c7d4a';

/// See also [UserTerm].
@ProviderFor(UserTerm)
final userTermProvider = AutoDisposeNotifierProvider<UserTerm, bool>.internal(
  UserTerm.new,
  name: r'userTermProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userTermHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserTerm = AutoDisposeNotifier<bool>;
String _$passwordCreateHash() => r'0da15bf302e022935cfc0b06769faede1b9ec508';

/// See also [PasswordCreate].
@ProviderFor(PasswordCreate)
final passwordCreateProvider =
    AutoDisposeNotifierProvider<PasswordCreate, String>.internal(
  PasswordCreate.new,
  name: r'passwordCreateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$passwordCreateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PasswordCreate = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
