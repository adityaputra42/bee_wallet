// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chain_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chainOtherHash() => r'ef4695bfd7288bd4039a2d90ac9a3f64484dec45';

/// See also [ChainOther].
@ProviderFor(ChainOther)
final chainOtherProvider =
    AutoDisposeAsyncNotifierProvider<ChainOther, List<ChainNetwork>>.internal(
  ChainOther.new,
  name: r'chainOtherProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chainOtherHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChainOther = AutoDisposeAsyncNotifier<List<ChainNetwork>>;
String _$chainOtherSearchHash() => r'5eff3d00ecbd6d97f862d6691a5fef438e47691e';

/// See also [ChainOtherSearch].
@ProviderFor(ChainOtherSearch)
final chainOtherSearchProvider =
    AutoDisposeNotifierProvider<ChainOtherSearch, List<ChainNetwork>>.internal(
  ChainOtherSearch.new,
  name: r'chainOtherSearchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chainOtherSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChainOtherSearch = AutoDisposeNotifier<List<ChainNetwork>>;
String _$balanceChainHash() => r'9bbfc9630727a37627e799944b3d61b6b7d22119';

/// See also [BalanceChain].
@ProviderFor(BalanceChain)
final balanceChainProvider =
    AutoDisposeAsyncNotifierProvider<BalanceChain, void>.internal(
  BalanceChain.new,
  name: r'balanceChainProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$balanceChainHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BalanceChain = AutoDisposeAsyncNotifier<void>;
String _$balancePeriodicHash() => r'b82550cbd59f3442ddd85a4a10b8ff311d9d12ae';

/// See also [BalancePeriodic].
@ProviderFor(BalancePeriodic)
final balancePeriodicProvider =
    AutoDisposeNotifierProvider<BalancePeriodic, Timer>.internal(
  BalancePeriodic.new,
  name: r'balancePeriodicProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$balancePeriodicHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BalancePeriodic = AutoDisposeNotifier<Timer>;
String _$chainDetailHash() => r'3e0655fa2a8099c1ec14162378cd87ba1f492d77';

/// See also [ChainDetail].
@ProviderFor(ChainDetail)
final chainDetailProvider =
    AutoDisposeNotifierProvider<ChainDetail, SelectedTokenChain>.internal(
  ChainDetail.new,
  name: r'chainDetailProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chainDetailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChainDetail = AutoDisposeNotifier<SelectedTokenChain>;
String _$activityDetailHash() => r'2859b1a90d9002e980eadfaf7434b6af7663923d';

/// See also [ActivityDetail].
@ProviderFor(ActivityDetail)
final activityDetailProvider =
    AutoDisposeNotifierProvider<ActivityDetail, Activity>.internal(
  ActivityDetail.new,
  name: r'activityDetailProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activityDetailHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActivityDetail = AutoDisposeNotifier<Activity>;
String _$chainHistoryHash() => r'98700f4a2992c45f24c254ea676635b7a1cfb99f';

/// See also [ChainHistory].
@ProviderFor(ChainHistory)
final chainHistoryProvider = AutoDisposeNotifierProvider<ChainHistory,
    PagingController<int, Activity>>.internal(
  ChainHistory.new,
  name: r'chainHistoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chainHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChainHistory = AutoDisposeNotifier<PagingController<int, Activity>>;
String _$nameChainControllerHash() =>
    r'f4a0d8ca677deeede6340cec95158b6e1c0fbc35';

/// See also [NameChainController].
@ProviderFor(NameChainController)
final nameChainControllerProvider = AutoDisposeNotifierProvider<
    NameChainController, TextEditingController>.internal(
  NameChainController.new,
  name: r'nameChainControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nameChainControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NameChainController = AutoDisposeNotifier<TextEditingController>;
String _$rpcChainControllerHash() =>
    r'a7ebe24866d374acb4d99b2dcc11ba967e60780b';

/// See also [RpcChainController].
@ProviderFor(RpcChainController)
final rpcChainControllerProvider = AutoDisposeNotifierProvider<
    RpcChainController, TextEditingController>.internal(
  RpcChainController.new,
  name: r'rpcChainControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rpcChainControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RpcChainController = AutoDisposeNotifier<TextEditingController>;
String _$chainIdControllerHash() => r'7c39dae76e5e198c5a1526610db408e540ddaeb5';

/// See also [ChainIdController].
@ProviderFor(ChainIdController)
final chainIdControllerProvider = AutoDisposeNotifierProvider<ChainIdController,
    TextEditingController>.internal(
  ChainIdController.new,
  name: r'chainIdControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chainIdControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChainIdController = AutoDisposeNotifier<TextEditingController>;
String _$symbolChainControllerHash() =>
    r'82d086868c61bfc09c2f5b6a7ce8efc6f7c6bc57';

/// See also [SymbolChainController].
@ProviderFor(SymbolChainController)
final symbolChainControllerProvider = AutoDisposeNotifierProvider<
    SymbolChainController, TextEditingController>.internal(
  SymbolChainController.new,
  name: r'symbolChainControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$symbolChainControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SymbolChainController = AutoDisposeNotifier<TextEditingController>;
String _$explorerChainControllerHash() =>
    r'c56e104f490fd1f7a0025cb983f38ee5cf08f517';

/// See also [ExplorerChainController].
@ProviderFor(ExplorerChainController)
final explorerChainControllerProvider = AutoDisposeNotifierProvider<
    ExplorerChainController, TextEditingController>.internal(
  ExplorerChainController.new,
  name: r'explorerChainControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$explorerChainControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ExplorerChainController = AutoDisposeNotifier<TextEditingController>;
String _$disbaleAddNetworkHash() => r'd4c930f7c9880fe0bf503ca57975267dd487fe33';

/// See also [DisbaleAddNetwork].
@ProviderFor(DisbaleAddNetwork)
final disbaleAddNetworkProvider =
    AutoDisposeNotifierProvider<DisbaleAddNetwork, bool>.internal(
  DisbaleAddNetwork.new,
  name: r'disbaleAddNetworkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$disbaleAddNetworkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisbaleAddNetwork = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
