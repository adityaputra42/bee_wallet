// ignore_for_file: unused_result
import 'package:bee_wallet/utils/util.dart';
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
class SelectedNetworkSetting extends _$SelectedNetworkSetting {
  @override
  TokenChain build() {
    return TokenChain();
  }

  void setToken(TokenChain token) {
    state = token;
  }

  updateRPC(String rpc) async {
    TokenChain selectedChain = state;
    await DbHelper.instance
        .updateRPC(chainId: selectedChain.chainId!, rpc: rpc);
    ref.refresh(tokenChainOriginProvider);
    ref.refresh(selectedChainTokenProvider);
  }
}
