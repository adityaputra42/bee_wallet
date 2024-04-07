// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listNftHash() => r'4cd5050cd290e6f6a478b4eff2ebd490e9bf4033';

/// See also [ListNft].
@ProviderFor(ListNft)
final listNftProvider =
    AutoDisposeAsyncNotifierProvider<ListNft, List<Nft>>.internal(
  ListNft.new,
  name: r'listNftProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListNft = AutoDisposeAsyncNotifier<List<Nft>>;
String _$listViewNftHash() => r'591de948cfa9e78d9a1c55e24aaf89d591293fa7';

/// See also [ListViewNft].
@ProviderFor(ListViewNft)
final listViewNftProvider =
    AutoDisposeNotifierProvider<ListViewNft, List<NftView>>.internal(
  ListViewNft.new,
  name: r'listViewNftProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$listViewNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ListViewNft = AutoDisposeNotifier<List<NftView>>;
String _$selectedViewNftHash() => r'652d97a04094c7afdd502fc5fb3b07cdc94e19fe';

/// See also [SelectedViewNft].
@ProviderFor(SelectedViewNft)
final selectedViewNftProvider =
    AutoDisposeNotifierProvider<SelectedViewNft, NftView>.internal(
  SelectedViewNft.new,
  name: r'selectedViewNftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedViewNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedViewNft = AutoDisposeNotifier<NftView>;
String _$selectedNftHash() => r'ac9445eb782981ea70edf3f62d840b8884e3f04a';

/// See also [SelectedNft].
@ProviderFor(SelectedNft)
final selectedNftProvider =
    AutoDisposeNotifierProvider<SelectedNft, Nft>.internal(
  SelectedNft.new,
  name: r'selectedNftProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedNft = AutoDisposeNotifier<Nft>;
String _$tokenIdControllerHash() => r'a22641daa84333ac9792e5898ece404901ba297f';

/// See also [TokenIdController].
@ProviderFor(TokenIdController)
final tokenIdControllerProvider = AutoDisposeNotifierProvider<TokenIdController,
    TextEditingController>.internal(
  TokenIdController.new,
  name: r'tokenIdControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tokenIdControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TokenIdController = AutoDisposeNotifier<TextEditingController>;
String _$contractNftControllerHash() =>
    r'420071ab1da99ca54a649a5b1d809db5a7c1f846';

/// See also [ContractNftController].
@ProviderFor(ContractNftController)
final contractNftControllerProvider = AutoDisposeNotifierProvider<
    ContractNftController, TextEditingController>.internal(
  ContractNftController.new,
  name: r'contractNftControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$contractNftControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ContractNftController = AutoDisposeNotifier<TextEditingController>;
String _$disableAddNftHash() => r'69bc623727e84c61b342f1a454a5a6b7cb0e8ca2';

/// See also [DisableAddNft].
@ProviderFor(DisableAddNft)
final disableAddNftProvider =
    AutoDisposeNotifierProvider<DisableAddNft, bool>.internal(
  DisableAddNft.new,
  name: r'disableAddNftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$disableAddNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisableAddNft = AutoDisposeNotifier<bool>;
String _$loadingAddNftHash() => r'68f2aa5ae91fd69ee0572dde674d762c6a74cb46';

/// See also [LoadingAddNft].
@ProviderFor(LoadingAddNft)
final loadingAddNftProvider =
    AutoDisposeNotifierProvider<LoadingAddNft, bool>.internal(
  LoadingAddNft.new,
  name: r'loadingAddNftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadingAddNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoadingAddNft = AutoDisposeNotifier<bool>;
String _$nftHistoryHash() => r'1bcac855e87d784793d163cc5a32230b01067944';

/// See also [NftHistory].
@ProviderFor(NftHistory)
final nftHistoryProvider = AutoDisposeNotifierProvider<NftHistory,
    PagingController<int, Activity>>.internal(
  NftHistory.new,
  name: r'nftHistoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nftHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NftHistory = AutoDisposeNotifier<PagingController<int, Activity>>;
String _$networkFeeNftHash() => r'2d51e73e6fd182526c9cc923c7aec44a60afcb93';

/// See also [NetworkFeeNft].
@ProviderFor(NetworkFeeNft)
final networkFeeNftProvider =
    AutoDisposeNotifierProvider<NetworkFeeNft, double>.internal(
  NetworkFeeNft.new,
  name: r'networkFeeNftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkFeeNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkFeeNft = AutoDisposeNotifier<double>;
String _$slowNetworkFeeNftHash() => r'883a31455abd7b7d06698a254050608c5e49e623';

/// See also [SlowNetworkFeeNft].
@ProviderFor(SlowNetworkFeeNft)
final slowNetworkFeeNftProvider =
    AutoDisposeNotifierProvider<SlowNetworkFeeNft, double>.internal(
  SlowNetworkFeeNft.new,
  name: r'slowNetworkFeeNftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$slowNetworkFeeNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SlowNetworkFeeNft = AutoDisposeNotifier<double>;
String _$averageNetworkFeeNftHash() =>
    r'99b2fda1971ff7f50295e35588353f27224eb209';

/// See also [AverageNetworkFeeNft].
@ProviderFor(AverageNetworkFeeNft)
final averageNetworkFeeNftProvider =
    AutoDisposeNotifierProvider<AverageNetworkFeeNft, double>.internal(
  AverageNetworkFeeNft.new,
  name: r'averageNetworkFeeNftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$averageNetworkFeeNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AverageNetworkFeeNft = AutoDisposeNotifier<double>;
String _$fastNetworkFeeNftHash() => r'8301e75551be5c27d7897b1ccf8c763aa1a566db';

/// See also [FastNetworkFeeNft].
@ProviderFor(FastNetworkFeeNft)
final fastNetworkFeeNftProvider =
    AutoDisposeNotifierProvider<FastNetworkFeeNft, double>.internal(
  FastNetworkFeeNft.new,
  name: r'fastNetworkFeeNftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fastNetworkFeeNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FastNetworkFeeNft = AutoDisposeNotifier<double>;
String _$selectedFeeNftHash() => r'a1a970bd632cbc29818db86e57b8edf4f0070272';

/// See also [SelectedFeeNft].
@ProviderFor(SelectedFeeNft)
final selectedFeeNftProvider =
    AutoDisposeNotifierProvider<SelectedFeeNft, int>.internal(
  SelectedFeeNft.new,
  name: r'selectedFeeNftProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedFeeNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedFeeNft = AutoDisposeNotifier<int>;
String _$receiveNftHash() => r'1535487ac7ebd2467a7f725de1367993ca2b53fd';

/// See also [ReceiveNft].
@ProviderFor(ReceiveNft)
final receiveNftProvider =
    AutoDisposeNotifierProvider<ReceiveNft, TextEditingController>.internal(
  ReceiveNft.new,
  name: r'receiveNftProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$receiveNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReceiveNft = AutoDisposeNotifier<TextEditingController>;
String _$gasLimitNFTHash() => r'79ed45122a713baf8e2389083d65f5d2365e795f';

/// See also [GasLimitNFT].
@ProviderFor(GasLimitNFT)
final gasLimitNFTProvider =
    AutoDisposeNotifierProvider<GasLimitNFT, TextEditingController>.internal(
  GasLimitNFT.new,
  name: r'gasLimitNFTProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gasLimitNFTHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GasLimitNFT = AutoDisposeNotifier<TextEditingController>;
String _$gasPriceNFTHash() => r'30cf08b8573820b9eeabc973d00b42ad7b04bcbb';

/// See also [GasPriceNFT].
@ProviderFor(GasPriceNFT)
final gasPriceNFTProvider =
    AutoDisposeNotifierProvider<GasPriceNFT, TextEditingController>.internal(
  GasPriceNFT.new,
  name: r'gasPriceNFTProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gasPriceNFTHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GasPriceNFT = AutoDisposeNotifier<TextEditingController>;
String _$disableGasFeeNFTHash() => r'2f6e29a3b1408671931e39c325ae2c67f1412802';

/// See also [DisableGasFeeNFT].
@ProviderFor(DisableGasFeeNFT)
final disableGasFeeNFTProvider =
    AutoDisposeNotifierProvider<DisableGasFeeNFT, bool>.internal(
  DisableGasFeeNFT.new,
  name: r'disableGasFeeNFTProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$disableGasFeeNFTHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisableGasFeeNFT = AutoDisposeNotifier<bool>;
String _$transferNftLoadingHash() =>
    r'4cad9c9aa59f9f932a86412ea4e8ace6f7809e04';

/// See also [TransferNftLoading].
@ProviderFor(TransferNftLoading)
final transferNftLoadingProvider =
    AutoDisposeNotifierProvider<TransferNftLoading, bool>.internal(
  TransferNftLoading.new,
  name: r'transferNftLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transferNftLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransferNftLoading = AutoDisposeNotifier<bool>;
String _$transferNftHash() => r'648ab1d995aa34d828215726b7651c12d5e3fc75';

/// See also [TransferNft].
@ProviderFor(TransferNft)
final transferNftProvider =
    AutoDisposeNotifierProvider<TransferNft, bool>.internal(
  TransferNft.new,
  name: r'transferNftProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$transferNftHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransferNft = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
