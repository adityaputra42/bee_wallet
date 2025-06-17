import '../../data/model/coin_info.dart';

abstract class ChainRepository {
  Future<CoinInfo> fetchChain({
    required String network,
    required String address,
  });
  Future<double> fetchPriceMarket({required String idApi});
  Future<List<List<double>>> fecthKline({
    required String network,
    required String addressPool,
    required String timeFrame,
    required String agregate,
    String? token,
  });
}
