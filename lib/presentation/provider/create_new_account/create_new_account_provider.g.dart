// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_new_account_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadingCreateAccountHash() =>
    r'9cca820eefff32bf752420f501fe593e18554e7a';

/// See also [LoadingCreateAccount].
@ProviderFor(LoadingCreateAccount)
final loadingCreateAccountProvider =
    AutoDisposeNotifierProvider<LoadingCreateAccount, bool>.internal(
  LoadingCreateAccount.new,
  name: r'loadingCreateAccountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadingCreateAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoadingCreateAccount = AutoDisposeNotifier<bool>;
String _$nameWalletHash() => r'9e7af092f8986a93d0615af9b9d64273f557ca7f';

/// See also [NameWallet].
@ProviderFor(NameWallet)
final nameWalletProvider =
    AutoDisposeNotifierProvider<NameWallet, TextEditingController>.internal(
  NameWallet.new,
  name: r'nameWalletProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nameWalletHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NameWallet = AutoDisposeNotifier<TextEditingController>;
String _$disableCreateWalletHash() =>
    r'52a3ca89472088585b6c077dfaaf18f90d081d86';

/// See also [DisableCreateWallet].
@ProviderFor(DisableCreateWallet)
final disableCreateWalletProvider =
    AutoDisposeNotifierProvider<DisableCreateWallet, bool>.internal(
  DisableCreateWallet.new,
  name: r'disableCreateWalletProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$disableCreateWalletHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisableCreateWallet = AutoDisposeNotifier<bool>;
String _$generateMnemonicHash() => r'6aadd5a3722ef652512927d53685a2d960b95bb2';

/// See also [GenerateMnemonic].
@ProviderFor(GenerateMnemonic)
final generateMnemonicProvider =
    AutoDisposeAsyncNotifierProvider<GenerateMnemonic, String>.internal(
  GenerateMnemonic.new,
  name: r'generateMnemonicProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$generateMnemonicHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GenerateMnemonic = AutoDisposeAsyncNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
