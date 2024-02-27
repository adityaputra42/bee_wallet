// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newUserHash() => r'83da89bfc98fcfca7fc7eee6c1336a4df115046d';

/// See also [NewUser].
@ProviderFor(NewUser)
final newUserProvider = AutoDisposeNotifierProvider<NewUser, bool>.internal(
  NewUser.new,
  name: r'newUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NewUser = AutoDisposeNotifier<bool>;
String _$checkAccountUserHash() => r'c940a43c19b1afcf80cf24778fdfee12ac9135ec';

/// See also [CheckAccountUser].
@ProviderFor(CheckAccountUser)
final checkAccountUserProvider =
    NotifierProvider<CheckAccountUser, bool>.internal(
  CheckAccountUser.new,
  name: r'checkAccountUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkAccountUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CheckAccountUser = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
