import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../data/model/candle.dart';
import '../../data/model/coin_info.dart';
import '../repository/chain_repository.dart';

class ChainController implements ChainRepository {
  @override
  Future<CoinInfo> fetchChain({
    required String network,
    required String address,
  }) async {
    try {
      String url =
          "https://api.geckoterminal.com/api/v2/networks/$network/tokens/$address";
      log("url coin info => $url");
      var response = await http.Client().get(Uri.parse(url));
      log("response coin info => ${response.body}");
      if (response.statusCode == 200) {
        var data = coinInfoFromJson(response.body);
        return data;
      } else {
        return CoinInfo();
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<List<double>>> fecthKline({
    required String network,
    required String addressPool,
    required String timeFrame,
    required String agregate,
    String? token,
  }) async {
    try {
      String url =
          "https://api.geckoterminal.com/api/v2/networks/$network/pools/$addressPool/ohlcv/$timeFrame?aggregate=$agregate&";

      if (token != null) {
        url += "token=$token";
      }
      log("url kline => $url");
      var response = await http.Client().get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = candleFromJson(response.body);
        return data;
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<double> fetchPriceMarket({required String idApi}) async {
    try {
      String url =
          "https://api.coingecko.com/api/v3/simple/price?ids=$idApi&vs_currencies=usd";

      var response = await http.Client().get(Uri.parse(url));
      if (response.statusCode == 200) {
        double price = jsonDecode(response.body)[idApi]['usd'];
        log("response => $price");
        return price;
      } else {
        return 0;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
