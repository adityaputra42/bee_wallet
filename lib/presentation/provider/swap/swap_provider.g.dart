// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swap_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chainSwapFromHash() => r'5f6d37175fa86ced607e086676a0167735287d6f';

/// See also [ChainSwapFrom].
@ProviderFor(ChainSwapFrom)
final chainSwapFromProvider =
    AutoDisposeNotifierProvider<ChainSwapFrom, SelectedTokenChain>.internal(
  ChainSwapFrom.new,
  name: r'chainSwapFromProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chainSwapFromHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChainSwapFrom = AutoDisposeNotifier<SelectedTokenChain>;
String _$chainSwapToHash() => r'715083e6c44c4a1b92e4a9989b821fdf611e8f9b';

/// See also [ChainSwapTo].
@ProviderFor(ChainSwapTo)
final chainSwapToProvider =
    AutoDisposeNotifierProvider<ChainSwapTo, SelectedTokenChain>.internal(
  ChainSwapTo.new,
  name: r'chainSwapToProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chainSwapToHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChainSwapTo = AutoDisposeNotifier<SelectedTokenChain>;
String _$swapOriginChainHash() => r'2f2c4c3e79ca67a181af1897538a14a039c943c9';

/// See also [SwapOriginChain].
@ProviderFor(SwapOriginChain)
final swapOriginChainProvider =
    AutoDisposeNotifierProvider<SwapOriginChain, TokenChain>.internal(
  SwapOriginChain.new,
  name: r'swapOriginChainProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$swapOriginChainHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SwapOriginChain = AutoDisposeNotifier<TokenChain>;
String _$listOriginChainSwapHash() =>
    r'a99c3bcd52c6ea26d686c021eb615c7de867686e';

/// See also [ListOriginChainSwap].
@ProviderFor(ListOriginChainSwap)
final listOriginChainSwapProvider =
    AutoDisposeNotifierProvider<ListOriginChainSwap, List<TokenChain>>.internal(
  ListOriginChainSwap.new,
  name: r'listOriginChainSwapProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listOriginChainSwapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListOriginChainSwap = AutoDisposeNotifier<List<TokenChain>>;
String _$pairAddressHash() => r'a133a6aa86533eafdc8ebcea02d7ab32b6ed72b8';

/// See also [PairAddress].
@ProviderFor(PairAddress)
final pairAddressProvider =
    AutoDisposeAsyncNotifierProvider<PairAddress, String>.internal(
  PairAddress.new,
  name: r'pairAddressProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pairAddressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PairAddress = AutoDisposeAsyncNotifier<String>;
String _$fromSwapAmountHash() => r'57419ec4a6b0dc0ddefcd4fd73ced80975b4b959';

/// See also [FromSwapAmount].
@ProviderFor(FromSwapAmount)
final fromSwapAmountProvider =
    AutoDisposeNotifierProvider<FromSwapAmount, TextEditingController>.internal(
  FromSwapAmount.new,
  name: r'fromSwapAmountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fromSwapAmountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FromSwapAmount = AutoDisposeNotifier<TextEditingController>;
String _$toSwapAmountHash() => r'343d40f4f4a76dad570ac0c9e82dd09ef53d702d';

/// See also [ToSwapAmount].
@ProviderFor(ToSwapAmount)
final toSwapAmountProvider =
    AutoDisposeNotifierProvider<ToSwapAmount, TextEditingController>.internal(
  ToSwapAmount.new,
  name: r'toSwapAmountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$toSwapAmountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ToSwapAmount = AutoDisposeNotifier<TextEditingController>;
String _$txHashSwapHash() => r'5c1432f309429803ac8ba4aa509e9a24f1dbfcad';

/// See also [TxHashSwap].
@ProviderFor(TxHashSwap)
final txHashSwapProvider =
    AutoDisposeAsyncNotifierProvider<TxHashSwap, String>.internal(
  TxHashSwap.new,
  name: r'txHashSwapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$txHashSwapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TxHashSwap = AutoDisposeAsyncNotifier<String>;
String _$disableSwapHash() => r'c4069e9423f984b464c10d2adaed0f2174ef79ce';

/// See also [DisableSwap].
@ProviderFor(DisableSwap)
final disableSwapProvider =
    AutoDisposeNotifierProvider<DisableSwap, bool>.internal(
  DisableSwap.new,
  name: r'disableSwapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$disableSwapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisableSwap = AutoDisposeNotifier<bool>;
String _$loadingSwapHash() => r'8ca24a2c29e6349f5e89da9091a57f5983e44d13';

/// See also [LoadingSwap].
@ProviderFor(LoadingSwap)
final loadingSwapProvider =
    AutoDisposeNotifierProvider<LoadingSwap, bool>.internal(
  LoadingSwap.new,
  name: r'loadingSwapProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loadingSwapHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoadingSwap = AutoDisposeNotifier<bool>;
String _$loadingPriceImpactHash() =>
    r'02494fa3646fc6e19d3becaa1b7a7f30b03c5639';

/// See also [LoadingPriceImpact].
@ProviderFor(LoadingPriceImpact)
final loadingPriceImpactProvider =
    AutoDisposeNotifierProvider<LoadingPriceImpact, bool>.internal(
  LoadingPriceImpact.new,
  name: r'loadingPriceImpactProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadingPriceImpactHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoadingPriceImpact = AutoDisposeNotifier<bool>;
String _$priceImpactHash() => r'3dc56a9275c51f3776318e96b551a2f116507639';

/// See also [PriceImpact].
@ProviderFor(PriceImpact)
final priceImpactProvider =
    AutoDisposeNotifierProvider<PriceImpact, double>.internal(
  PriceImpact.new,
  name: r'priceImpactProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$priceImpactHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PriceImpact = AutoDisposeNotifier<double>;
String _$amountOutMinHash() => r'ba4f52ffc3f2337e83d709100f229d59c3062a2d';

/// See also [AmountOutMin].
@ProviderFor(AmountOutMin)
final amountOutMinProvider =
    AutoDisposeNotifierProvider<AmountOutMin, BigInt>.internal(
  AmountOutMin.new,
  name: r'amountOutMinProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$amountOutMinHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AmountOutMin = AutoDisposeNotifier<BigInt>;
String _$slipPageHash() => r'2f0f512a8aec4742ef71bb80a95479b4f38a1bb3';

/// See also [SlipPage].
@ProviderFor(SlipPage)
final slipPageProvider = AutoDisposeNotifierProvider<SlipPage, double>.internal(
  SlipPage.new,
  name: r'slipPageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$slipPageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SlipPage = AutoDisposeNotifier<double>;
String _$validationFromHash() => r'7b4794402e5331a564705cde6135a7f521f97dd2';

/// See also [ValidationFrom].
@ProviderFor(ValidationFrom)
final validationFromProvider =
    AutoDisposeNotifierProvider<ValidationFrom, String>.internal(
  ValidationFrom.new,
  name: r'validationFromProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$validationFromHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ValidationFrom = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
