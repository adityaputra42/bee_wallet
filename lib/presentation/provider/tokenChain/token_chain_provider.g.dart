// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_chain_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tokenChainOriginHash() => r'b04f35575b9eb04bd11129e8ad7364c1e683caa1';

/// See also [TokenChainOrigin].
@ProviderFor(TokenChainOrigin)
final tokenChainOriginProvider = AutoDisposeAsyncNotifierProvider<
    TokenChainOrigin, List<TokenChain>>.internal(
  TokenChainOrigin.new,
  name: r'tokenChainOriginProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tokenChainOriginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TokenChainOrigin = AutoDisposeAsyncNotifier<List<TokenChain>>;
String _$selectedChainTokenHash() =>
    r'b0ab54f46fc7cbbe86fe7570376414527c769582';

/// See also [SelectedChainToken].
@ProviderFor(SelectedChainToken)
final selectedChainTokenProvider = AutoDisposeAsyncNotifierProvider<
    SelectedChainToken, List<SelectedTokenChain>>.internal(
  SelectedChainToken.new,
  name: r'selectedChainTokenProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedChainTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedChainToken
    = AutoDisposeAsyncNotifier<List<SelectedTokenChain>>;
String _$chainSelectedSearchHash() =>
    r'912c0f70b2e557f1dab670f9a6418153b050dc4a';

/// See also [ChainSelectedSearch].
@ProviderFor(ChainSelectedSearch)
final chainSelectedSearchProvider = AutoDisposeNotifierProvider<
    ChainSelectedSearch, List<SelectedTokenChain>>.internal(
  ChainSelectedSearch.new,
  name: r'chainSelectedSearchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chainSelectedSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChainSelectedSearch = AutoDisposeNotifier<List<SelectedTokenChain>>;
String _$listTokenChainHash() => r'1bae2f6521fd8057aeb829ae2685dba41ded9276';

/// See also [ListTokenChain].
@ProviderFor(ListTokenChain)
final listTokenChainProvider = AutoDisposeAsyncNotifierProvider<ListTokenChain,
    List<SelectedTokenChain>>.internal(
  ListTokenChain.new,
  name: r'listTokenChainProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listTokenChainHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListTokenChain = AutoDisposeAsyncNotifier<List<SelectedTokenChain>>;
String _$listManageTokenHash() => r'1fe6ba90c55231f3c303f147f18f460555d60e23';

/// See also [ListManageToken].
@ProviderFor(ListManageToken)
final listManageTokenProvider =
    AutoDisposeNotifierProvider<ListManageToken, List<TokenChain>>.internal(
  ListManageToken.new,
  name: r'listManageTokenProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listManageTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListManageToken = AutoDisposeNotifier<List<TokenChain>>;
String _$listChainSearchHash() => r'ddabff40d0d5b28f4483cc295c4f522ffc8ae11f';

/// See also [ListChainSearch].
@ProviderFor(ListChainSearch)
final listChainSearchProvider =
    AutoDisposeNotifierProvider<ListChainSearch, List<TokenChain>>.internal(
  ListChainSearch.new,
  name: r'listChainSearchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$listChainSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListChainSearch = AutoDisposeNotifier<List<TokenChain>>;
String _$tokenChainNftHash() => r'75934c48468b907d525daaaa6b44c0354b2ccfcd';

/// See also [TokenChainNft].
@ProviderFor(TokenChainNft)
final tokenChainNftProvider =
    AutoDisposeNotifierProvider<TokenChainNft, TokenChain>.internal(
  TokenChainNft.new,
  name: r'tokenChainNftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tokenChainNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TokenChainNft = AutoDisposeNotifier<TokenChain>;
String _$chainNftTransferHash() => r'1cf0c160cfc170914c37c78e23708e0f21c0b94d';

/// See also [ChainNftTransfer].
@ProviderFor(ChainNftTransfer)
final chainNftTransferProvider =
    AutoDisposeNotifierProvider<ChainNftTransfer, SelectedTokenChain>.internal(
  ChainNftTransfer.new,
  name: r'chainNftTransferProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$chainNftTransferHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChainNftTransfer = AutoDisposeNotifier<SelectedTokenChain>;
String _$networkAddTokenHash() => r'56d1bb0efebb62e99532ded127c42656e0e7c4b8';

/// See also [NetworkAddToken].
@ProviderFor(NetworkAddToken)
final networkAddTokenProvider =
    AutoDisposeNotifierProvider<NetworkAddToken, TokenChain>.internal(
  NetworkAddToken.new,
  name: r'networkAddTokenProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkAddTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkAddToken = AutoDisposeNotifier<TokenChain>;
String _$contractAddressHash() => r'581b71140e42a613ee949a1f195621dad64ee0a2';

/// See also [ContractAddress].
@ProviderFor(ContractAddress)
final contractAddressProvider = AutoDisposeNotifierProvider<ContractAddress,
    TextEditingController>.internal(
  ContractAddress.new,
  name: r'contractAddressProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$contractAddressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ContractAddress = AutoDisposeNotifier<TextEditingController>;
String _$nameTokenHash() => r'1e7dadb8b512a06725537e3751fa62db0364f679';

/// See also [NameToken].
@ProviderFor(NameToken)
final nameTokenProvider =
    AutoDisposeNotifierProvider<NameToken, TextEditingController>.internal(
  NameToken.new,
  name: r'nameTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nameTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NameToken = AutoDisposeNotifier<TextEditingController>;
String _$symbolTokenHash() => r'917d02c2e52929ef88225cbfc75a6485590cb03a';

/// See also [SymbolToken].
@ProviderFor(SymbolToken)
final symbolTokenProvider =
    AutoDisposeNotifierProvider<SymbolToken, TextEditingController>.internal(
  SymbolToken.new,
  name: r'symbolTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$symbolTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SymbolToken = AutoDisposeNotifier<TextEditingController>;
String _$decimalTokenHash() => r'e1c382d2bf0b35d0805ca467c9ccbc0b73c5d659';

/// See also [DecimalToken].
@ProviderFor(DecimalToken)
final decimalTokenProvider =
    AutoDisposeNotifierProvider<DecimalToken, TextEditingController>.internal(
  DecimalToken.new,
  name: r'decimalTokenProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$decimalTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DecimalToken = AutoDisposeNotifier<TextEditingController>;
String _$disableAddTokenHash() => r'e513d2b41b229d4b1c93388a66eed1ac47519704';

/// See also [DisableAddToken].
@ProviderFor(DisableAddToken)
final disableAddTokenProvider =
    AutoDisposeNotifierProvider<DisableAddToken, bool>.internal(
  DisableAddToken.new,
  name: r'disableAddTokenProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$disableAddTokenHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisableAddToken = AutoDisposeNotifier<bool>;
String _$tokenFromContractHash() => r'9d10af7cb738501276a323ea634c4628a3751091';

/// See also [TokenFromContract].
@ProviderFor(TokenFromContract)
final tokenFromContractProvider = AutoDisposeAsyncNotifierProvider<
    TokenFromContract, List<TokenChain>>.internal(
  TokenFromContract.new,
  name: r'tokenFromContractProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tokenFromContractHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TokenFromContract = AutoDisposeAsyncNotifier<List<TokenChain>>;
String _$tokenDappLinkHash() => r'75c7951f1f0bed828889ebd137e9ff3944ec6fec';

/// See also [TokenDappLink].
@ProviderFor(TokenDappLink)
final tokenDappLinkProvider =
    AutoDisposeNotifierProvider<TokenDappLink, TokenChain>.internal(
  TokenDappLink.new,
  name: r'tokenDappLinkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tokenDappLinkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TokenDappLink = AutoDisposeNotifier<TokenChain>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
