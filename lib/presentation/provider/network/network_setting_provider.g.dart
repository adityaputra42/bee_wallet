// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_setting_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listNetworkSettingHash() =>
    r'4f519dbd609c405b0b69e47a6549e43b573a20bb';

/// See also [ListNetworkSetting].
@ProviderFor(ListNetworkSetting)
final listNetworkSettingProvider =
    AutoDisposeNotifierProvider<ListNetworkSetting, List<TokenChain>>.internal(
  ListNetworkSetting.new,
  name: r'listNetworkSettingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listNetworkSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListNetworkSetting = AutoDisposeNotifier<List<TokenChain>>;
String _$selectedNetworkSettingHash() =>
    r'1d42628359f851e953543ccddcfc4c6647a3e3fd';

/// See also [SelectedNetworkSetting].
@ProviderFor(SelectedNetworkSetting)
final selectedNetworkSettingProvider =
    AutoDisposeNotifierProvider<SelectedNetworkSetting, TokenChain>.internal(
  SelectedNetworkSetting.new,
  name: r'selectedNetworkSettingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedNetworkSettingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedNetworkSetting = AutoDisposeNotifier<TokenChain>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
