import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/dapp_history/dapp_link.dart';
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
    state = const AsyncValue.loading();
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
class FavoriteDapp extends _$FavoriteDapp {
  @override
  List<Map<String, dynamic>> build() {
    List<Map<String, dynamic>> favorite = [
      {
        // "image": AppImage.pancakeSwap,
        "title": "PancakeSwap",
        "subtitle":
            "Trade, earn and win crypto in decentralize app and more oportunity",
        "link": "https://pancakeswap.finance/"
      },
      {
        // "image": AppImage.uniswap,
        "title": "UniSwap",
        "subtitle":
            "Trade, earn and win crypto in decentralize app and more oportunity",
        "link": "https://app.uniswap.org/"
      },
      {
        // "image": AppImage.opensea,
        "title": "OpenSea",
        "subtitle":
            "Trade, earn and win crypto in decentralize app and more oportunity",
        "link": "https://opensea.io/"
      },
      {
        // "image": AppImage.quickswap,
        "title": "QuickSwap",
        "subtitle":
            "Trade, earn and win crypto in decentralize app and more oportunity",
        "link": "https://quickswap.exchange/#/"
      },
      {
        // "image": AppImage.chainlink,
        "title": "ChainLink",
        "subtitle":
            "Trade, earn and win crypto in decentralize app and more oportunity",
        "link": "https://chain.link/"
      },
      {
        // "image": AppImage.ens,
        "title": "ENS",
        "subtitle":
            "Trade, earn and win crypto in decentralize app and more oportunity",
        "link": "https://ens.domains/"
      }
    ];
    return favorite;
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

// @riverpod
// class ChainDapp extends _$ChainDapp {
//   @override
//   SelectedTokenChain build() {
//     return SelectedTokenChain();
//   }

//   setChainTransfer(SelectedTokenChain chain) {
//     state = chain;
//   }
// }
