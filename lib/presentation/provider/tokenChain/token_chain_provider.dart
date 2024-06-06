import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web3dart/web3dart.dart';
import '../../../config/config.dart';
import '../../../data/model/model.dart';
import '../../../data/model/token_chain/selected_token_chain.dart';
import '../../../data/model/token_chain/token_chain.dart';
import '../../../utils/util.dart';
import '../account/account_provider.dart';
import '../swap/swap_provider.dart';
import 'package:http/http.dart' as http;
import 'package:erc20/erc20.dart';
part 'token_chain_provider.g.dart';

@riverpod
class TokenChainOrigin extends _$TokenChainOrigin {
  @override
  Future<List<TokenChain>> build() async {
    state = const AsyncLoading();
    final networkList = await DbHelper.instance.getAllTokenChain();
    final chainlist = await rootBundle.loadString('assets/abi/chain.json');
    final listChain = tokenChainFromJson(chainlist);
    List<int> ids = [];
    for (var value in networkList) {
      if (listChain.any((element) => element.chainId == value.chainId)) {
        ids.add(value.id!);
      }
    }
    await DbHelper.instance.deleteAllTokenChain(ids);
    await DbHelper.instance.setAllTokenChain(listChain);
    return listChain;
  }

  Future<void> initChainOrigin() async {
    final networkList = await DbHelper.instance.getAllTokenChain();
    final chainlist = await rootBundle.loadString('assets/abi/chain.json');
    final listChain = tokenChainFromJson(chainlist);
    List<int> ids = [];
    for (var value in networkList) {
      if (listChain.any((element) => element.chainId == value.chainId)) {
        ids.add(value.id!);
      }
    }
    await DbHelper.instance.deleteAllTokenChain(ids);
    await DbHelper.instance.setAllTokenChain(listChain);
    state = AsyncData(listChain);
  }
}

@riverpod
class SelectedChainToken extends _$SelectedChainToken {
  @override
  Future<List<SelectedTokenChain>> build() async {
    state = const AsyncLoading();
    var account = ref.watch(selectedAccountProvider).valueOrNull;
    var chain = ref.watch(listTokenChainProvider).valueOrNull ?? [];
    final chainSelected = await DbHelper.instance.getSelectedChain();
    List<SelectedTokenChain> listChain = chain
        .where((element) => element.mnemonicAccount == account?.mnemonic)
        .toList();
    if ((chainSelected.chainId ?? []).isEmpty) {
      List<String> chainId = [];
      Set<String> seen = {};
      for (var item in listChain) {
        if (!seen.contains(item.chainId)) {
          chainId.add(item.chainId!);
          seen.add(item.chainId!);
        }
      }
      final selected = SelectedChain(chainId: chainId);
      await DbHelper.instance.setSelectedChain(selected);
      ref.read(chainSwapProvider.notifier).setChain(listChain.first);
      ref.watch(chainSwapProvider);
      return listChain;
    } else {
      var tokenChainSelected = await DbHelper.instance
          .getSelectedTokenChain(account?.mnemonic ?? '');
      ref.read(chainSwapProvider.notifier).setChain(listChain.first);
      ref.watch(chainSwapProvider);
      return tokenChainSelected;
    }
  }

  updtateSelected(SelectedTokenChain chain) {
    var newList = state.valueOrNull ?? [];
    newList.add(chain);
    state = AsyncData(newList);
  }

  Future<void> changeNework(
      {SelectedTokenChain? network, bool isAll = false}) async {
    log("chain symbol => ${network?.symbol}");
    var account = ref.watch(selectedAccountProvider).valueOrNull;
    final listchain = ref.watch(listTokenChainProvider).valueOrNull ?? [];

    final selectedChain = (state.valueOrNull ?? [])
        .where((element) => element.contractAddress == null)
        .toList();
    final listChainFilter =
        listchain.where((element) => element.contractAddress == null).toList();

    if (isAll == true &&
        listChainFilter.length != selectedChain.length &&
        network?.chainId == null) {
      await DbHelper.instance.changeNetwork(listchain);
      state = AsyncData(listchain);
    } else {
      List<SelectedTokenChain> newChain = [];
      newChain.add(network!);
      await DbHelper.instance.changeNetwork(newChain);
      var listTokenChain = await DbHelper.instance
          .getTokenFromChainId(network.chainId ?? "", account?.mnemonic ?? '');
      state = AsyncData(listTokenChain);
    }
  }
}

@riverpod
class ChainSelectedSearch extends _$ChainSelectedSearch {
  @override
  List<SelectedTokenChain> build() {
    final listChain = ref.watch(selectedChainTokenProvider).valueOrNull ?? [];
    return listChain;
  }

  onSearch(String value) {
    var newList = ref.watch(selectedChainTokenProvider).valueOrNull ?? [];
    List<SelectedTokenChain> result = [];
    if (value == '') {
      result = newList;
    } else {
      result = newList
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()) ||
              element.symbol!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    state = result;
  }
}

@riverpod
class ListTokenChain extends _$ListTokenChain {
  @override
  Future<List<SelectedTokenChain>> build() async {
    return initListChainSelected();
  }

  Future<List<SelectedTokenChain>> initListChainSelected() async {
    final chain = ref.watch(tokenChainOriginProvider).valueOrNull ?? [];
    final mnemonic =
        ref.watch(selectedAccountProvider).valueOrNull?.mnemonic ?? "";
    final listChainWallet =
        await DbHelper.instance.getTokenChainWallet(mnemonicAccount: mnemonic);
    List<TokenChain> listChain =
        chain.where((element) => element.logo != null).toList();
    if (listChainWallet.isEmpty) {
      for (var value in listChain) {
        var selectChain = SelectedTokenChain(
            name: value.name,
            contractAddress: value.contractAddress,
            symbol: value.symbol,
            decimal: value.decimal,
            balance: value.balance,
            mnemonicAccount: mnemonic,
            logo: value.logo,
            baseLogo: value.baseLogo,
            chainId: value.chainId,
            rpc: value.rpc,
            explorer: value.explorer,
            explorerApi: value.explorerApi,
            baseChain: value.baseChain,
            isTestnet: value.isTestnet);
        await DbHelper.instance.setSelectedTokenChain(selectChain);
      }
      final chainWallet = await DbHelper.instance.getTokenChainWallet(
        mnemonicAccount: mnemonic,
      );
      return chainWallet;
    } else {
      return listChainWallet;
    }
  }

  void setTokenChain(TokenChain chain) async {
    final mnemonic = ref.watch(selectedAccountProvider).valueOrNull?.mnemonic;
    final listChain = state.valueOrNull ?? [];
    var selectedChain = SelectedTokenChain(
        name: chain.name,
        contractAddress: chain.contractAddress,
        symbol: chain.symbol,
        decimal: chain.decimal,
        balance: chain.balance,
        mnemonicAccount: mnemonic ?? '',
        logo: chain.logo,
        baseLogo: chain.baseLogo,
        chainId: chain.chainId,
        rpc: chain.rpc,
        explorer: chain.explorer,
        explorerApi: chain.explorerApi,
        baseChain: chain.baseChain,
        isTestnet: chain.isTestnet);
    await DbHelper.instance.setSelectedTokenChain(selectedChain);
    ref
        .read(selectedChainTokenProvider.notifier)
        .updtateSelected(selectedChain);

    listChain.add(selectedChain);
    state = AsyncData(listChain);
  }

  void setChain(SelectedTokenChain chain) async {
    final address = ref.watch(selectedAccountProvider).valueOrNull;
    final listChain = state.valueOrNull ?? [];
    if (listChain.any((element) =>
        element.chainId == chain.chainId &&
        element.symbol!.toLowerCase() == chain.symbol!.toLowerCase() &&
        element.mnemonicAccount == address?.mnemonic)) {
      await DbHelper.instance.deleteSelectedChainWallet(chain);
      final newList = await initListChainSelected();
      state = AsyncData(newList);
    } else {
      await DbHelper.instance.setSelectedChainWallet(chain);
      final newList = await initListChainSelected();
      state = AsyncData(newList);
    }
  }

  void delete(String chainId) async {
    final address = ref.watch(selectedAccountProvider).valueOrNull;
    await DbHelper.instance
        .deleteSelectedTokenChain(chainId, address?.mnemonic ?? "");
    final newList = await initListChainSelected();
    state = AsyncData(newList);
  }
}

@riverpod
class ListManageToken extends _$ListManageToken {
  @override
  List<TokenChain> build() {
    var listChain = ref.watch(tokenChainOriginProvider).valueOrNull ?? [];
    return listChain;
  }

  changeSelected({required bool isAll, TokenChain? chain}) {
    var listChain = ref.watch(tokenChainOriginProvider).valueOrNull ?? [];
    if (isAll == true && chain?.chainId == null) {
      state = listChain;
    } else {
      state = listChain
          .where((element) => element.chainId == chain?.chainId)
          .toList();
    }
  }

  addToken(BuildContext context, TokenChain token) async {
    var originChain = ref.watch(tokenChainOriginProvider).valueOrNull ?? [];

    if (originChain
        .any((element) => element.contractAddress == token.contractAddress)) {
      MethodHelper().showSnack(
          context: context,
          content: "Tokens already exists",
          backgorund: AppColor.redColor);
    } else {
      await DbHelper.instance.addTokenChain(token);
      ref.read(listTokenChainProvider.notifier).setTokenChain(token);
      state.add(token);
      state = [...state];
      ref.watch(appRouteProvider).pop();
    }
  }

  onSearch(String value) {
    var newList = ref.watch(tokenChainOriginProvider).valueOrNull ?? [];
    List<TokenChain> result = [];
    if (value == '') {
      result = newList;
    } else {
      result = newList
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()) ||
              element.symbol!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    state = result;
  }
}

@riverpod
class ListChainSearch extends _$ListChainSearch {
  @override
  List<TokenChain> build() {
    final listChain = (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
        .where((element) => element.contractAddress == null)
        .toList();
    return listChain;
  }

  onSearch(String value) {
    var newList = (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
        .where((element) => element.contractAddress == null)
        .toList();
    List<TokenChain> result = [];
    if (value == '') {
      result = newList;
    } else {
      result = newList
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()) ||
              element.symbol!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    state = result;
  }
}

@riverpod
class TokenChainNft extends _$TokenChainNft {
  @override
  TokenChain build() {
    final listChain = (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
        .where((element) => element.contractAddress == null)
        .toList();
    return listChain.first;
  }

  onChange(TokenChain value) {
    state = value;
  }
}

@riverpod
class TokenDappLink extends _$TokenDappLink {
  @override
  TokenChain build() {
    final listChain = (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
        .where((element) => element.contractAddress == null)
        .toList();
    return listChain.first;
  }

  onChange(TokenChain value) {
    state = value;
  }
}

@riverpod
class ChainNftTransfer extends _$ChainNftTransfer {
  @override
  SelectedTokenChain build() {
    final chainNFT = ref.watch(tokenChainNftProvider);
    final mnemonic =
        ref.watch(selectedAccountProvider).valueOrNull?.mnemonic ?? "";
    final listChain = (ref.watch(listTokenChainProvider).valueOrNull ?? [])
        .where((element) =>
            element.contractAddress == null &&
            element.chainId == chainNFT.chainId &&
            element.mnemonicAccount == mnemonic)
        .toList();
    return listChain.first;
  }
}

@riverpod
class NetworkAddToken extends _$NetworkAddToken {
  @override
  TokenChain build() {
    var listChain = ref
        .watch(listManageTokenProvider)
        .where((element) => element.contractAddress == null)
        .toList();
    return listChain.first;
  }

  changeSelected({required TokenChain chain}) {
    state = chain;
  }
}

@riverpod
class ContractAddress extends _$ContractAddress {
  @override
  TextEditingController build() => TextEditingController();

  getTokenInfo(
      {required BuildContext context,
      required String contractAddress,
      required String rpc}) async {
    if (EthHelper().validateAddress(contractAddress)) {
      final web3client = Web3Client(
        rpc,
        http.Client(),
      );
      final token = ERC20(
          address: EthereumAddress.fromHex(contractAddress),
          client: web3client);
      try {
        final name = await token.name();
        final decimal = await token.decimals();
        final symbol = await token.symbol();

        ref.read(nameTokenProvider.notifier).changeValue(name);
        ref.read(symbolTokenProvider.notifier).changeValue(symbol);
        ref.read(decimalTokenProvider.notifier).changeValue(decimal.toString());
        ref.read(disableAddTokenProvider.notifier).changeValue(false);
      } catch (e) {
        ref.read(disableAddTokenProvider.notifier).changeValue(true);
        Exception(e.toString());
      }
    } else {
      ref.read(disableAddTokenProvider.notifier).changeValue(true);
      MethodHelper().showSnack(
          context: context,
          content: "Contract Address is invalid!",
          backgorund: AppColor.redColor);
    }
  }
}

@riverpod
class NameToken extends _$NameToken {
  @override
  TextEditingController build() => TextEditingController();

  void changeValue(String value) {
    state.text = value;
  }
}

@riverpod
class SymbolToken extends _$SymbolToken {
  @override
  TextEditingController build() => TextEditingController();
  void changeValue(String value) {
    state.text = value;
  }
}

@riverpod
class DecimalToken extends _$DecimalToken {
  @override
  TextEditingController build() => TextEditingController();
  void changeValue(String value) {
    state.text = value;
  }
}

@riverpod
class DisableAddToken extends _$DisableAddToken {
  @override
  bool build() => true;
  void changeValue(bool value) {
    state = value;
  }
}
