import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web3_provider/web3_provider.dart';

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

  initWebController(InAppWebViewController controller) async {
    final title = await controller.getTitle();
    final uri = await controller.getUrl();
    final image = await controller.requestImageRef();
    var newimage = image?.url?.path;

    if (title != "") {
      await addDappsHistory(
        DappsHistory(title: title, url: uri.toString(), image: newimage),
      );
    }
  }
}
