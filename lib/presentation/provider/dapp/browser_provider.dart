import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/model.dart';
import '../../../utils/util.dart';
part 'browser_provider.g.dart';

@riverpod
class BrowserHistory extends _$BrowserHistory {
  @override
  Future<List<DappsHistory>> build() async {
    state = const AsyncLoading();
    List<DappsHistory> list = await DbHelper.instance.getDappsHistory();
    return list;
  }

  Future<void> addDappsHistory(DappsHistory history) async {
    List<DappsHistory> list = state.valueOrNull ?? [];
    await DbHelper.instance.addHistoryDapps(history);
    list.add(history);
    state = AsyncData(list);
  }

  Future<void> deleteDappsHistory(int id) async {
    List<DappsHistory> list = state.valueOrNull ?? [];
    await DbHelper.instance.deleteDappsHistory(id);
    list.removeWhere((element) => element.id == id);
    state = AsyncData(list);
  }
}
