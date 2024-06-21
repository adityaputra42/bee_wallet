// ignore_for_file: unused_result, use_build_context_synchronously
import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/token_chain/token_chain.dart';
import '../provider.dart';

part 'network_setting_provider.g.dart';

@riverpod
class ListNetworkSetting extends _$ListNetworkSetting {
  @override
  List<TokenChain> build() {
    final listChain = (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
        .where((element) =>
            element.contractAddress == null && element.baseChain == 'eth')
        .toList();
    return listChain;
  }

  onSearch(String value) {
    var newList = (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
        .where((element) =>
            element.contractAddress == null && element.baseChain == 'eth')
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
class SelectedNetworkSetting extends _$SelectedNetworkSetting {
  @override
  TokenChain build() {
    return TokenChain();
  }

  void setToken(TokenChain token) {
    state = token;
  }

  updateRPC({required BuildContext context, required String rpc}) async {
    TokenChain selectedChain = state;
    await DbHelper.instance
        .updateRPC(chainId: selectedChain.chainId!, rpc: rpc);
    ref.read(isEditProvider.notifier).changeEdit(false);
    MethodHelper().showSnack(
        context: context,
        content: "Succes Update RPC ${selectedChain.symbol}",
        backgorund: AppColor.greenColor);
    ref.refresh(tokenChainOriginProvider);
    ref.refresh(selectedChainTokenProvider);
  }
}

@riverpod
class NameNetwork extends _$NameNetwork {
  @override
  TextEditingController build() {
    var chain = ref.watch(selectedNetworkSettingProvider);
    return TextEditingController(text: chain.name);
  }
}

@riverpod
class SymbolNetwork extends _$SymbolNetwork {
  @override
  TextEditingController build() {
    var chain = ref.watch(selectedNetworkSettingProvider);
    return TextEditingController(text: chain.symbol);
  }
}

@riverpod
class ChainIdNetwork extends _$ChainIdNetwork {
  @override
  TextEditingController build() {
    var chain = ref.watch(selectedNetworkSettingProvider);
    return TextEditingController(text: chain.chainId);
  }
}

@riverpod
class RpcNetwork extends _$RpcNetwork {
  @override
  TextEditingController build() {
    var chain = ref.watch(selectedNetworkSettingProvider);
    return TextEditingController(text: chain.rpc);
  }
}

@riverpod
class ExplorerNetwork extends _$ExplorerNetwork {
  @override
  TextEditingController build() {
    var chain = ref.watch(selectedNetworkSettingProvider);
    return TextEditingController(text: chain.explorer);
  }
}

@riverpod
class IsEdit extends _$IsEdit {
  @override
  bool build() {
    return false;
  }

  void changeEdit(bool value) {
    state = value;
  }
}
