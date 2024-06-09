// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/config.dart';
import '../../../data/model/model.dart';
import '../../../domain/controller/controller.dart';
import '../../../utils/util.dart';
import '../account/account_provider.dart';
import '../tokenChain/token_chain_provider.dart';
part 'nft_provider.g.dart';

@riverpod
class ListNft extends _$ListNft {
  @override
  Future<List<Nft>> build() async {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final chain = ref.watch(tokenChainNftProvider);
    final nfts = await DbHelper.instance.getAllNFT(
        owner: account?.addressETH ?? "", chainId: chain.chainId ?? "");
    return nfts;
  }

  initializeNFt() async {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final chain = ref.watch(tokenChainNftProvider);
    final nfts = await DbHelper.instance.getAllNFT(
        owner: account?.addressETH ?? "", chainId: chain.chainId ?? "");
    log("list NFT => ${nfts.length}");
    state = AsyncData(nfts);
  }

  addNft(BuildContext context, String contractAddress, int tokenId) async {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final chain = ref.watch(tokenChainNftProvider);
    final listNft = state.valueOrNull ?? [];
    ref.read(loadingAddNftProvider.notifier).changeValue(true);
    if (!listNft.any((element) => element.tokenId == tokenId)) {
      var nft = await EthHelper().fetchNFT(
          context: context,
          contractAddress: contractAddress,
          tokenId: tokenId,
          chain: chain,
          address: account?.addressETH ?? "");
      if (nft != null) {
        await DbHelper.instance.addNFT(nft);
        initializeNFt();
        MethodHelper().showSnack(
            context: context,
            content: "Success Add NFT ${chain.name}",
            backgorund: AppColor.greenColor);
        ref.read(loadingAddNftProvider.notifier).changeValue(false);
        ref.watch(appRouteProvider).pop();
      } else {
        MethodHelper().showSnack(
            context: context,
            content: "Failed Add NFT ${chain.name}",
            backgorund: AppColor.redColor);
        ref.read(loadingAddNftProvider.notifier).changeValue(false);
      }
    } else {
      MethodHelper().showSnack(
          context: context,
          content: "NFT already exist!",
          backgorund: AppColor.redColor);
      ref.read(loadingAddNftProvider.notifier).changeValue(false);
    }
  }
}

@riverpod
class ListViewNft extends _$ListViewNft {
  @override
  List<NftView> build() {
    final nfts = ref.watch(listNftProvider).valueOrNull ?? [];
    List<NftView> views = MethodHelper().removeDupicateNft(nfts);
    return views;
  }

  onSearch(String value) {
    final nfts = ref.watch(listNftProvider).valueOrNull ?? [];
    List<NftView> views = MethodHelper().removeDupicateNft(nfts);
    List<NftView> result = [];
    if (value == '') {
      result = views;
    } else {
      result = views
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    state = result;
  }
}

@riverpod
class SelectedViewNft extends _$SelectedViewNft {
  @override
  NftView build() {
    return NftView();
  }

  changeValue(NftView value) {
    state = value;
  }
}

@riverpod
class SelectedNft extends _$SelectedNft {
  @override
  Nft build() {
    return Nft();
  }

  changeValue(Nft value) {
    state = value;
  }
}

@riverpod
class TokenIdController extends _$TokenIdController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  onChange(String value) {
    if (value != '' && ref.watch(contractNftControllerProvider).text != '') {
      ref.read(disableAddNftProvider.notifier).changeValue(false);
    } else {
      ref.read(disableAddNftProvider.notifier).changeValue(false);
    }
  }

  String? onValidate(String? value) {
    if (value == '') {
      return "Token id can't be empty";
    } else {
      return null;
    }
  }
}

@riverpod
class ContractNftController extends _$ContractNftController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  onChange(String value) {
    if (value != '' && ref.watch(tokenIdControllerProvider).text != '') {
      ref.read(disableAddNftProvider.notifier).changeValue(false);
    } else {
      ref.read(disableAddNftProvider.notifier).changeValue(false);
    }
  }

  String? onValidate(String? value) {
    if (value == '') {
      return "Contract address can't be empty";
    } else {
      return null;
    }
  }
}

@riverpod
class DisableAddNft extends _$DisableAddNft {
  @override
  bool build() {
    return true;
  }

  changeValue(bool value) => state = value;
}

@riverpod
class LoadingAddNft extends _$LoadingAddNft {
  @override
  bool build() {
    return false;
  }

  changeValue(bool value) => state = value;
}

@riverpod
class NftHistory extends _$NftHistory {
  @override
  PagingController<int, Activity> build() {
    final pagingController = PagingController<int, Activity>(
      firstPageKey: 1,
    );
    return pagingController;
  }

  init() {
    state.addPageRequestListener((pageKey) {
      fetchData(pageKey);
    });
  }

  Future<void> fetchData(
    int pageKey,
  ) async {
    const pageSize = 15;
    ActivityController repository = ActivityController();
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final chain = ref.watch(tokenChainNftProvider);
    final nftView = ref.watch(selectedViewNftProvider);
    if (chain.baseChain == 'eth') {
      try {
        List<Activity> response = [];
        if (chain.chainId == '234') {
          response = await repository.findPetaActivityNFT(
              address: account?.addressETH ?? '',
              page: pageKey,
              chain: chain,
              contractAddress: nftView.contract ?? '');
        } else {
          response = await repository.findAllActivityNFT(
              address: account?.addressETH ?? '',
              page: pageKey,
              chain: chain,
              contractAddress: nftView.contract ?? '');
        }

        log(response.length.toString());
        final isLastPage = response.length < pageSize;
        if (isLastPage) {
          state.appendLastPage(response);
        } else {
          final nextPageKey = pageKey + 1;
          state.appendPage(response, nextPageKey);
        }
      } catch (error) {
        state.error = error;
      }
    } else {
      state.appendLastPage([]);
    }
  }
}

@riverpod
class NetworkFeeNft extends _$NetworkFeeNft {
  @override
  double build() => 0;
  Future<void> getNetworkFee() async {
    var chain = ref.watch(chainNftTransferProvider);
    var nft = ref.watch(selectedNftProvider);
    var account = ref.watch(selectedAccountProvider).valueOrNull;
    double fee = 0.0;
    if (chain.baseChain == 'eth') {
      var data = await EthHelper().getEstimateGasNFTTransfer(
          to: ref.watch(receiveNftProvider).text,
          nft: nft,
          privateKey: EcryptionHelper().decrypt(account?.keyETH ?? ''),
          chain: chain);

      fee = data['txFee'];
      ref
          .read(gasLimitNFTProvider.notifier)
          .changeInit(data['gasLimit'].toString());
      ref
          .read(gasPriceNFTProvider.notifier)
          .changeInit(data['gasPrice'].toString());
      state = fee;
    }
    ref.read(slowNetworkFeeNftProvider.notifier).setNetworkFee(fee);
    ref.read(averageNetworkFeeNftProvider.notifier).setNetworkFee(fee);
    ref.read(fastNetworkFeeNftProvider.notifier).setNetworkFee(fee);
    ref.watch(slowNetworkFeeNftProvider);
    ref.watch(averageNetworkFeeNftProvider);
    ref.watch(fastNetworkFeeNftProvider);
    ref.watch(gasLimitNFTProvider);
    ref.watch(gasPriceNFTProvider);
  }

  void setAdvanceGasFee() {
    var gasPrice = ref.watch(gasPriceNFTProvider).text;
    var gasLimit = ref.watch(gasLimitNFTProvider).text;
    final txFee = BigInt.from(double.parse(gasPrice)) *
        BigInt.from(double.parse(gasLimit));
    var fee = txFee / BigInt.from(10).pow(9);
    state = fee;
  }
}

@riverpod
class SlowNetworkFeeNft extends _$SlowNetworkFeeNft {
  @override
  double build() => 0;
  setNetworkFee(double fee) {
    state = fee - (fee * 0.33);
  }
}

@riverpod
class AverageNetworkFeeNft extends _$AverageNetworkFeeNft {
  @override
  double build() => 0;
  setNetworkFee(double fee) {
    state = fee;
  }
}

@riverpod
class FastNetworkFeeNft extends _$FastNetworkFeeNft {
  @override
  double build() => 0;
  setNetworkFee(double fee) {
    state = fee + (fee * 0.33);
  }
}

@riverpod
class SelectedFeeNft extends _$SelectedFeeNft {
  @override
  int build() => 1;
  setSelectedFee(int value) {
    state = value;
  }
}

@riverpod
class ReceiveNft extends _$ReceiveNft {
  @override
  TextEditingController build() => TextEditingController();
  onChange(String value) {
    bool isValid = EthHelper().validateAddress(state.text);
    if (isValid == true && state.text != '') {
      ref.read(disableGasFeeNFTProvider.notifier).changeValue(false);
    } else {
      ref.read(disableGasFeeNFTProvider.notifier).changeValue(true);
    }
  }

  String? onValidate(String? value) {
    bool isValid = EthHelper().validateAddress(state.text);

    if (isValid == false) {
      return "address receive is invalid";
    } else if (value == '') {
      return "address receive can't be empty";
    } else {
      return null;
    }
  } 

  setvalue(String value){
    state.text = value;
  }
}

@riverpod
class GasLimitNFT extends _$GasLimitNFT {
  @override
  TextEditingController build() => TextEditingController();

  changeInit(String value) {
    state.text = value;
  }
}

@riverpod
class GasPriceNFT extends _$GasPriceNFT {
  @override
  TextEditingController build() => TextEditingController();
  changeInit(String value) {
    state.text = value;
  }
}

@riverpod
class DisableGasFeeNFT extends _$DisableGasFeeNFT {
  @override
  bool build() => true;
  changeValue(bool value) {
    state = value;
  }
}

@riverpod
class TransferNft extends _$TransferNft {
  @override
  Future<bool> build()async => false;

  Future<void> tranfer(BuildContext context) async {

    state = const AsyncLoading();
    var chain = ref.watch(chainNftTransferProvider);
    var nft = ref.watch(selectedNftProvider);
    var account = ref.watch(selectedAccountProvider).valueOrNull;
    try {
     
      var response = await EthHelper().transferNft(
        to: ref.watch(receiveNftProvider).text,
        nft: nft,
        chain: chain,
        privateKey: EcryptionHelper().decrypt(account?.keyETH ?? ''),
      );

      if (response != null) {
        await DbHelper.instance.deleteNFT(nft.id!);
        ref.read(listNftProvider.notifier).initializeNFt();
        state =const  AsyncData(true);
       
        context.goNamed('transaction_nft_success');
      } else {
        MethodHelper().showSnack(
            context: context,
            content: "Transaction Failed",
            backgorund: AppColor.redColor);
      }
    } catch (e) {
      MethodHelper().showSnack(
          context: context, content: "Error $e", backgorund: AppColor.redColor);
          state =const  AsyncData(false);
     
    }
  }
}
