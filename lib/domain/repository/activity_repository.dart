import '../../data/model/model.dart';

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
