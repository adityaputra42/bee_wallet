import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web3_webview/flutter_web3_webview.dart';

import '../../../../../data/model/model.dart';

import '../../../../../utils/util.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../provider/dapp/browser_provider.dart';
import '../../../../provider/provider.dart';

class NewWeb3Webview extends ConsumerStatefulWidget {
  const NewWeb3Webview({super.key, required this.initialUrl});
  final String initialUrl;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewWeb3WebviewState();
}

class _NewWeb3WebviewState extends ConsumerState<NewWeb3Webview> {
  @override
  void initState() {
    Web3Webview.initJs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chain = ref.watch(tokenDappLinkProvider);
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        fontSize: 14,
        title: ref.watch(titleWebViewProvider),
      ),
      body: Web3Webview(
          initialUrlRequest: URLRequest(
              url: WebUri(
            MethodHelper().urlValidator(widget.initialUrl),
          )),
          settings: Web3Settings(
              eth: Web3EthSettings(
                  chainId: int.tryParse(chain.chainId ?? '1'),
                  rdns: chain.rpc)),
          shouldOverrideUrlLoading: (p0, action) async =>
              NavigationActionPolicy.ALLOW,
          onTitleChanged: (contoller, title) async {
            await contoller.getUrl();
            ref
                .read(titleWebViewProvider.notifier)
                .changeTitle(title ?? "Dapps");
          },
          ethAccounts: () async {
            return [account?.addressETH ?? ''];
          },
          ethChainId: () async {
            return int.parse(chain.chainId ?? '1');
          },
          onUpdateVisitedHistory: (controller, uri, isReload) {
            ref
                .read(browserHistoryProvider.notifier)
                .initWebController(controller);
          },
          walletSwitchEthereumChain: (JsAddEthereumChain data) async {
            final listChain = ref.watch(listChainSearchProvider);
            var chainIdFromWeb = int.parse(
                (data.chainId)?.replaceFirst('0x', '') ?? '1',
                radix: 16);
            ref
                .read(tokenDappLinkProvider.notifier)
                .onChange(listChain.singleWhere(
                  (v) => v.chainId == chainIdFromWeb.toString(),
                  orElse: () => TokenChain(),
                ));

            return true;
          }),
    );
  }
}
