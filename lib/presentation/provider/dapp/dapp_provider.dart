import 'package:bee_wallet/data/model/dapp_history/dapp_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/token_chain/selected_token_chain.dart';
import '../../../utils/util.dart';
import '../provider.dart';
part 'dapp_provider.g.dart';

@riverpod
class NewsDapp extends _$NewsDapp {
  @override
  List<String> build() {
    var listImage = [
      "https://usa.visa.com/content/dam/VCOM/regional/na/us/Solutions/visa-crypto-opportunities-800x450.jpg",
      "https://cdn.vietnambiz.vn/2019/9/12/how-to-earn-cryptocurrency-2-805x452-15682572048351009525293.jpeg",
      "https://blog.pintu.co.id/wp-content/uploads/2023/11/aset-crypto.jpg",
    ];
    return listImage;
  }
}

@riverpod
class DappList extends _$DappList {
  @override
  Future<List<DappLink>> build() async {
    state = const AsyncLoading();
    final chain = ref.watch(tokenDappLinkProvider);

    final initLink = await rootBundle.loadString('assets/abi/dapp_link.json');
    final listLink = dappLinkFromJson(initLink);
    await DbHelper.instance.deleteAllDappLink();
    await DbHelper.instance.addAllDappLink(listLink);
    final newlinks =
        await DbHelper.instance.getAllDappLink(chainId: chain.chainId!);
    return newlinks;
  }
}

@riverpod
class IndexCarousel extends _$IndexCarousel {
  @override
  int build() => 0;

  changeIndex(int index) => state = index;
}

@riverpod
class IndexTabDapp extends _$IndexTabDapp {
  @override
  int build() => 0;

  changeIndex(int index) => state = index;
}

@riverpod
class TitleWebView extends _$TitleWebView {
  @override
  String build() => '';

  changeTitle(String value) => state = value;
}

@riverpod
class SearchWeb extends _$SearchWeb {
  @override
  TextEditingController build() => TextEditingController();
}

@riverpod
class ChainDapp extends _$ChainDapp {
  @override
  SelectedTokenChain build() {
    return SelectedTokenChain();
  }

  setChainTransfer(SelectedTokenChain chain) {
    state = chain;
  }
}
