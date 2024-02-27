

import '../../data/model/model.dart';
import '../../data/model/token_chain/selected_token_chain.dart';
import '../../data/model/token_chain/token_chain.dart';

abstract class ActivityRepository {
  Future<List<Activity>> findAllActivity(String address,
      {required int page, required SelectedTokenChain chain});

  Future<List<Activity>> findPetaActivity(String address,
      {required int page, required SelectedTokenChain chain});
  Future<List<Activity>> findAllActivityNFT(
      {required String address,
      required int page,
      required TokenChain chain,
      required String contractAddress});

  Future<List<Activity>> findPetaActivityNFT(
      {required String address,
      required int page,
      required TokenChain chain,
      required String contractAddress});
}
