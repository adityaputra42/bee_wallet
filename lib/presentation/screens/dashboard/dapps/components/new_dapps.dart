import 'dart:developer';

import 'package:bee_wallet/data/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web3_webview/web3_webview.dart';

import '../../../../../config/config.dart';

import '../../../../../utils/util.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../provider/provider.dart';
import '../../../../widget/widget.dart';

class NewWeb3Webview extends ConsumerWidget {
  const NewWeb3Webview({super.key, required this.initialUrl});
  final String initialUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        fontSize: 14,
        title: ref.watch(titleWebViewProvider),
      ),
      body: SafeArea(
        child: ref
            .watch(refreshControllerProvider)
            .when(
              data: (data) {
                final chain = ref.watch(tokenDappLinkProvider);
                final listChain =
                    (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
                        .where((element) => element.contractAddress == null)
                        .toList();
                final account = ref.watch(selectedAccountProvider).valueOrNull;
                return Web3WebView(
                  web3WalletConfig: Web3WalletConfig(
                    privateKey: EcryptionHelper().decrypt(account!.keyETH!),
                    name: "Wallet New",
                    icon: AppImage.logo,
                    currentNetwork: NetworkConfig(
                      chainId:
                          "0x${(int.parse(chain.chainId ?? '1')).toRadixString(16)}",
                      chainName: chain.name ?? '',
                      rpcUrls: [chain.rpc ?? ''],
                      nativeCurrency: NativeCurrency(
                        name: chain.name ?? '',
                        symbol: chain.symbol ?? '',
                        decimals: 18,
                      ),
                      blockExplorerUrls: [chain.explorer ?? ''],
                    ),
                    supportNetworks:
                        listChain
                            .map(
                              (n) => NetworkConfig(
                                chainId: n.chainId ?? '1',
                                chainName: n.name ?? '',
                                rpcUrls: [n.rpc ?? ''],
                                nativeCurrency: NativeCurrency(
                                  name: n.name ?? '',
                                  symbol: n.symbol ?? '',
                                  decimals: 18,
                                ),
                                blockExplorerUrls: [n.explorer ?? ''],
                              ),
                            )
                            .toList(),
                    dialogTheme: WalletDialogTheme(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      textColor: Colors.white,
                      borderColor: Theme.of(context).canvasColor,
                      primaryColor: AppColor.primaryColor,
                      headerStyle: AppFont.semibold16.copyWith(
                        color: Theme.of(context).indicatorColor,
                      ),
                      labelStyle: AppFont.reguler14.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                      valueStyle: AppFont.medium14.copyWith(
                        color: Theme.of(context).indicatorColor,
                      ),
                      gradientColor: AppColor.secondaryColor,
                      buttonConfirmStyle: const ButtonConfig(
                        backgroundColor: AppColor.primaryColor,
                        textColor: AppColor.darkText1,
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        fontSize: 14,
                      ),
                      buttonRejectStyle: ButtonConfig(
                        backgroundColor: Theme.of(context).cardColor,
                        textColor: AppColor.darkText1,
                        borderWidth: 0.5,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        borderColor: Theme.of(context).canvasColor,
                        fontSize: 14,
                      ),
                      itemSpacing: 16,
                      dialogPadding: const EdgeInsets.all(24),
                      contentPadding: const EdgeInsets.all(24),
                    ),
                    onError: (method, params, message) {
                      log("Error Method => $method");
                      log("Error params => $params");
                      log("Error Message => $message");
                    },
                  ),
                  initialUrlRequest: URLRequest(
                    url: WebUri(MethodHelper().urlValidator(initialUrl)),
                  ),
                  shouldOverrideUrlLoading: (
                    controller,
                    navigationAction,
                  ) async {
                    // var uri = navigationAction.request.url!;
                    // if (![
                    //   "http",
                    //   "https",
                    //   "file",
                    //   "chrome",
                    //   "data",
                    //   "javascript",
                    //   "about"
                    // ].contains(uri.scheme)) {
                    //   if (await canLaunchUrl(uri)) {
                    //     await launchUrl(
                    //       uri,
                    //     );

                    //     return NavigationActionPolicy.CANCEL;
                    //   }
                    // }

                    return NavigationActionPolicy.ALLOW;
                  },
                  onTitleChanged: (contoller, title) async {
                    await contoller.getUrl();
                    ref
                        .read(titleWebViewProvider.notifier)
                        .changeTitle(title ?? "Dapps");
                  },
                  onWebViewCreated: (controller) {
                    ref
                        .read(web3ControllerProvider.notifier)
                        .initWebController(controller);
                  },
                  onUpdateVisitedHistory: (controller, uri, isReload) {
                    ref
                        .read(web3ControllerProvider.notifier)
                        .initWebController(controller);
                  },
                  pullToRefreshController: data,
                );
              },
              error: (Object error, StackTrace stackTrace) {
                return ErrorView(
                  error: error.toString(),
                  ontap: () {
                    // ignore: unused_result
                    ref.refresh(refreshControllerProvider);
                  },
                );
              },
              loading: () {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primaryColor,
                  ),
                );
              },
            ),
      ),
    );
  }
}
