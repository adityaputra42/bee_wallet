// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chainTransferHash() => r'dadfd770069ffecdc3480299d3c47c44e6f141b5';

/// See also [ChainTransfer].
@ProviderFor(ChainTransfer)
final chainTransferProvider =
    AutoDisposeNotifierProvider<ChainTransfer, SelectedTokenChain>.internal(
  ChainTransfer.new,
  name: r'chainTransferProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chainTransferHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChainTransfer = AutoDisposeNotifier<SelectedTokenChain>;
String _$recentAddressHash() => r'64e91ef8cf4b3ff9201f1a5f84cb6832e8fe5b14';

/// See also [RecentAddress].
@ProviderFor(RecentAddress)
final recentAddressProvider = AutoDisposeAsyncNotifierProvider<RecentAddress,
    List<RecentTransactionAddress>>.internal(
  RecentAddress.new,
  name: r'recentAddressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentAddressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecentAddress
    = AutoDisposeAsyncNotifier<List<RecentTransactionAddress>>;
String _$amountTransferHash() => r'de5690bbae6a77452680f419daa4af3aeb210477';

/// See also [AmountTransfer].
@ProviderFor(AmountTransfer)
final amountTransferProvider =
    AutoDisposeNotifierProvider<AmountTransfer, TextEditingController>.internal(
  AmountTransfer.new,
  name: r'amountTransferProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$amountTransferHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AmountTransfer = AutoDisposeNotifier<TextEditingController>;
String _$receiveAddressHash() => r'9aa865599d0541d530c0c613eabbdb42cbd042af';

/// See also [ReceiveAddress].
@ProviderFor(ReceiveAddress)
final receiveAddressProvider =
    AutoDisposeNotifierProvider<ReceiveAddress, TextEditingController>.internal(
  ReceiveAddress.new,
  name: r'receiveAddressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$receiveAddressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReceiveAddress = AutoDisposeNotifier<TextEditingController>;
String _$validateAddressTransferHash() =>
    r'd5bc9fd4c3675c3ec37a5708a9819286bc2dad5b';

/// See also [ValidateAddressTransfer].
@ProviderFor(ValidateAddressTransfer)
final validateAddressTransferProvider =
    AutoDisposeNotifierProvider<ValidateAddressTransfer, bool>.internal(
  ValidateAddressTransfer.new,
  name: r'validateAddressTransferProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$validateAddressTransferHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ValidateAddressTransfer = AutoDisposeNotifier<bool>;
String _$disableNextTransferHash() =>
    r'5f8ca863e955a35c967f494d090323e45766bc82';

/// See also [DisableNextTransfer].
@ProviderFor(DisableNextTransfer)
final disableNextTransferProvider =
    AutoDisposeNotifierProvider<DisableNextTransfer, bool>.internal(
  DisableNextTransfer.new,
  name: r'disableNextTransferProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$disableNextTransferHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisableNextTransfer = AutoDisposeNotifier<bool>;
String _$networkFeeHash() => r'ad6d86baa0cfcf40df37f812822eb71f3e80fa37';

/// See also [NetworkFee].
@ProviderFor(NetworkFee)
final networkFeeProvider =
    AutoDisposeNotifierProvider<NetworkFee, double>.internal(
  NetworkFee.new,
  name: r'networkFeeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$networkFeeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkFee = AutoDisposeNotifier<double>;
String _$averageNetworkFeeHash() => r'125403eeb5a870cf36769728b9c7d36328171611';

/// See also [AverageNetworkFee].
@ProviderFor(AverageNetworkFee)
final averageNetworkFeeProvider =
    AutoDisposeNotifierProvider<AverageNetworkFee, double>.internal(
  AverageNetworkFee.new,
  name: r'averageNetworkFeeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$averageNetworkFeeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AverageNetworkFee = AutoDisposeNotifier<double>;
String _$slowNetworkFeeHash() => r'0ec21e297387cd70a309d720a3fac2c1deec0f50';

/// See also [SlowNetworkFee].
@ProviderFor(SlowNetworkFee)
final slowNetworkFeeProvider =
    AutoDisposeNotifierProvider<SlowNetworkFee, double>.internal(
  SlowNetworkFee.new,
  name: r'slowNetworkFeeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$slowNetworkFeeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SlowNetworkFee = AutoDisposeNotifier<double>;
String _$fastNetworkFeeHash() => r'07a3110ab89aa6221c2fca46c3c9ad586b724020';

/// See also [FastNetworkFee].
@ProviderFor(FastNetworkFee)
final fastNetworkFeeProvider =
    AutoDisposeNotifierProvider<FastNetworkFee, double>.internal(
  FastNetworkFee.new,
  name: r'fastNetworkFeeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fastNetworkFeeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FastNetworkFee = AutoDisposeNotifier<double>;
String _$selectedFeeHash() => r'9cb8c71c7dfb3ced8026bc03d472d57be56ebd01';

/// See also [SelectedFee].
@ProviderFor(SelectedFee)
final selectedFeeProvider =
    AutoDisposeNotifierProvider<SelectedFee, int>.internal(
  SelectedFee.new,
  name: r'selectedFeeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedFeeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedFee = AutoDisposeNotifier<int>;
String _$amountInputHash() => r'ac4c8dbf08434bc60aea9abf69286783caac0def';

/// See also [AmountInput].
@ProviderFor(AmountInput)
final amountInputProvider =
    AutoDisposeNotifierProvider<AmountInput, double>.internal(
  AmountInput.new,
  name: r'amountInputProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$amountInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AmountInput = AutoDisposeNotifier<double>;
String _$totalAmountHash() => r'f242766f17a27c49f5683401ff4b3361e1c55999';

/// See also [TotalAmount].
@ProviderFor(TotalAmount)
final totalAmountProvider =
    AutoDisposeNotifierProvider<TotalAmount, double>.internal(
  TotalAmount.new,
  name: r'totalAmountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$totalAmountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TotalAmount = AutoDisposeNotifier<double>;
String _$transferLoadingHash() => r'a3a328e64dfcc6bdd16b977704550b817861b759';

/// See also [TransferLoading].
@ProviderFor(TransferLoading)
final transferLoadingProvider =
    AutoDisposeNotifierProvider<TransferLoading, bool>.internal(
  TransferLoading.new,
  name: r'transferLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transferLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransferLoading = AutoDisposeNotifier<bool>;
String _$transferChainHash() => r'ed09419e2f027821ef313c896ed4f82f8b4abbc9';

/// See also [TransferChain].
@ProviderFor(TransferChain)
final transferChainProvider =
    AutoDisposeAsyncNotifierProvider<TransferChain, bool>.internal(
  TransferChain.new,
  name: r'transferChainProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transferChainHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransferChain = AutoDisposeAsyncNotifier<bool>;
String _$gasLimitHash() => r'5cd310de73badb196cf9000034651f6bce72859d';

/// See also [GasLimit].
@ProviderFor(GasLimit)
final gasLimitProvider =
    AutoDisposeNotifierProvider<GasLimit, TextEditingController>.internal(
  GasLimit.new,
  name: r'gasLimitProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gasLimitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GasLimit = AutoDisposeNotifier<TextEditingController>;
String _$gasPriceHash() => r'70d5bb2b3942f5137ff32bb5ddaf776372441a7d';

/// See also [GasPrice].
@ProviderFor(GasPrice)
final gasPriceProvider =
    AutoDisposeNotifierProvider<GasPrice, TextEditingController>.internal(
  GasPrice.new,
  name: r'gasPriceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gasPriceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GasPrice = AutoDisposeNotifier<TextEditingController>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
