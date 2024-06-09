// ignore_for_file: depend_on_ref, use_build_context_synchronously
import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:bee_wallet/presentation/provider/dapp/browser_provider.dart';
import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sui/utils/error.dart';
import 'package:web3_provider/web3_provider.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import '../../../../../config/config.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../provider/provider.dart';
import 'js_bridge_bean.dart';
import 'package:http/http.dart' as http;
import 'payment_sheet_page.dart';

class DappsWeb3 extends ConsumerStatefulWidget {
  final String initialUrl;

  const DappsWeb3({super.key, required this.initialUrl});
  @override
  ConsumerState<DappsWeb3> createState() => _DappsWeb3State();
}

class _DappsWeb3State extends ConsumerState<DappsWeb3> {
  InAppWebViewController? _webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
      // userAgent:
      //     "Mozilla/5.0 (Linux; Android 4.4.4; SAMSUNG-SM-N900A Build/tt) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/33.0.0.0 Mobile Safari/537.36",
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
      domStorageEnabled: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  _signTransaction({
    required BridgeParams bridge,
    required VoidCallback cancel,
    required Function(String idHash) success,
    String host = "",
    String favicon = "",
  }) async {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final chain = ref.watch(chainDappProvider);
    String privateKey = EcryptionHelper().decrypt(account?.keyETH ?? '');
    final credentials = EthPrivateKey.fromHex(privateKey);
    final sender = EthereumAddress.fromHex(bridge.from ?? '');
    final signto = EthereumAddress.fromHex(bridge.to ?? '');
    final input = hexToBytes(bridge.data ?? '');
    final web3client = Web3Client(
      chain.rpc ?? '',
      http.Client(),
    );
    String? price = (bridge.gasPrice == null)
        ? (await web3client.getGasPrice()).toString()
        : bridge.gasPrice;

    int? maxGas;

    try {
      maxGas = (bridge.gas ??
          await web3client.estimateGas(
            sender: sender,
            to: signto,
            data: input,
          )) as int?;
    } catch (e) {
      RPCError err = e as RPCError;
      log(err.toString());
      cancel.call();
      return;
    }
    var newPrice = price!.replaceAll(RegExp(r'[^0-9]'), '');
    log("max gas : ${maxGas.toString()} price : $newPrice");
    // String fee =
    FormatterBalance.configFeeValue(
        beanValue: maxGas.toString(), offsetValue: newPrice.toString());
    _showModalConfirm(
        from: account?.addressETH ?? "",
        to: bridge.to ?? '',
        host: host,
        favicon: favicon,
        value: bridge.value ?? BigInt.zero,
        // fee: fee,
        fee: (double.parse(maxGas.toString()) / math.pow(10, 9).toDouble())
            .toString(),
        confirm: () async {
          try {
            String result = await web3client.sendTransaction(
              credentials,
              Transaction(
                  to: signto,
                  value: EtherAmount.inWei(bridge.value ?? BigInt.zero),
                  gasPrice: null,
                  maxGas: maxGas,
                  data: input),
              chainId: int.parse(chain.chainId!),
              fetchChainIdFromNetworkId: false,
            );

            if (result.isNotEmpty) {
              log("result=> $result");
            }
            success.call(result);
          } catch (e) {
            if (e.toString().contains('-32000')) {
              MethodHelper().showSnack(
                  context: context,
                  content: "gasLow",
                  backgorund: AppColor.redColor);
            } else {
              MethodHelper().showSnack(
                  context: context,
                  content: e.toString(),
                  backgorund: AppColor.redColor);
            }
          }
        },
        cancel: () {
          cancel.call();
        });
  }

  _showModalConfirm({
    required String from,
    required String to,
    required BigInt value,
    required String fee,
    required VoidCallback confirm,
    required VoidCallback cancel,
    String? host = "",
    bool isSignMsg = false,
    String? msg = "",
    String? favicon = "",
  }) {
    showDialog(
        context: context,
        builder: (context) {
          final chain = ref.watch(chainDappProvider);
          return PaymentDialog(
            favicon: favicon,
            isSignMsg: isSignMsg,
            host: host,
            msg: msg ?? "",
            estimateGas: fee,
            datas: PaymentDialog.getTransStyleList(
              from: from,
              to: to,
              remark: '',
              fee: "$fee ${chain.symbol}",
            ),
            amount: "${value.tokenString(18)} ${chain.symbol}",
            nextAction: () async {
              confirm.call();
            },
            cancelAction: () {
              cancel.call();
            },
          );
        });
  }

  showModalAddChain({
    required String from,
    required String to,
    required BigInt value,
    required String fee,
    required VoidCallback confirm,
    required VoidCallback cancel,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          final chain = ref.watch(chainDappProvider);
          return PaymentDialog(
            datas: PaymentDialog.getTransStyleList(
              from: from,
              to: to,
              remark: '',
              fee: "$fee ${chain.symbol}",
            ),
            amount: "${value.tokenString(18)} ${chain.symbol}",
            nextAction: () async {
              confirm.call();
            },
            cancelAction: () {
              cancel.call();
            },
          );
        });
  }

  showModalSignTypedTx({
    required String from,
    required String to,
    required BigInt value,
    required String fee,
    required VoidCallback confirm,
    required VoidCallback cancel,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          final chain = ref.watch(chainDappProvider);
          return PaymentDialog(
            datas: PaymentDialog.getTransStyleList(
              from: from,
              to: to,
              remark: '',
              fee: "$fee ${chain.symbol}",
            ),
            amount: "${value.tokenString(18)} ${chain.symbol}",
            nextAction: () async {
              confirm.call();
            },
            cancelAction: () {
              cancel.call();
            },
          );
        });
  }

  String customFunctionInject({
    required int chainId,
    required String rpcUrl,
    required String walletAddress,
    bool? isDebug = true,
  }) {
    final chain = ref.watch(chainDappProvider);
    return """
         {
            ethereum:{
              chainId: ${chain.chainId!},
              rpcUrl: "$rpcUrl",
              address: "$walletAddress",
              isDebug: $isDebug
            }
         }
        """;
  }

  @override
  Widget build(BuildContext context) {
    final chain = ref.watch(chainDappProvider);
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        fontSize: 14,
        title: ref.watch(titleWebViewProvider),
      ),
      body: chain.baseChain != 'eth'
          ? InAppWebView(
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onUpdateVisitedHistory: (controller, url, androidIsReload) async {
                ref
                    .read(browserHistoryProvider.notifier)
                    .initWebController(controller);
              },
              onTitleChanged: (controller, title) async {
                await _webViewController?.getUrl();
                ref
                    .read(titleWebViewProvider.notifier)
                    .changeTitle(title ?? "Dapps");
              },
              initialUrlRequest: URLRequest(
                url: Uri.parse(
                  MethodHelper().urlValidator(widget.initialUrl),
                ),
              ),
            )
          : InAppWebViewEIP1193(
              onWebViewCreated: (controller) {
                _webViewController = controller;
              },
              onUpdateVisitedHistory: (controller, url, androidIsReload) async {
                _webViewController = controller;
                ref
                    .read(browserHistoryProvider.notifier)
                    .initWebController(controller);
              },
              onTitleChanged: (controller, title) async {
                await _webViewController?.getUrl();
                ref
                    .read(titleWebViewProvider.notifier)
                    .changeTitle(title ?? "Dapps");
              },
              chainId: int.parse(chain.chainId!),
              rpcUrl: chain.rpc,
              walletAddress: account?.addressETH,
              signCallback: (params, eip1193, controller) async {
                final id = params["id"];
                switch (eip1193) {
                  case EIP1193.requestAccounts:
                    controller!.setAddress(
                      account?.addressETH ?? '',
                      id,
                    );
                    break;
                  case EIP1193.signTransaction:
                    Map<String, dynamic> object = params["object"];
                    final uri = await controller?.getUrl();
                    final favicon = await controller?.requestImageRef();
                    final host = "${uri?.host}";
                    BridgeParams bridge = BridgeParams.fromJson(object);
                    _signTransaction(
                        bridge: bridge,
                        host: host,
                        favicon: favicon != null ? favicon.url.toString() : "",
                        cancel: () {
                          controller?.cancel(id);
                        },
                        success: (idHash) {
                          controller?.sendResult(idHash, id);
                        });

                    break;
                  case EIP1193.signMessage:
                  case EIP1193.signPersonalMessage:
                    Map<String, dynamic> object = params["object"];
                    String data = object["data"];
                    String privateKey =
                        EcryptionHelper().decrypt(account?.keyETH ?? '');
                    _showModalConfirm(
                        from: account?.addressETH ?? "",
                        to: '',
                        value: BigInt.zero,
                        fee: '0',
                        isSignMsg: true,
                        msg: data,
                        confirm: () async {
                          final credentials = EthPrivateKey.fromHex(privateKey);
                          Uint8List message = credentials
                              .signPersonalMessageToUint8List(hexToBytes(data));

                          String result = hex.encode(message);

                          controller?.sendResult(result, id);
                        },
                        cancel: () {
                          controller?.cancel(id);
                        });
                    break;
                  case EIP1193.signTypedMessage:
                    Map<String, dynamic> object = params["object"];
                    final data = object['data'];
                    String privateKey =
                        EcryptionHelper().decrypt(account?.keyETH ?? '');
                    _showModalConfirm(
                        from: account?.addressETH ?? '',
                        to: '',
                        value: BigInt.zero,
                        fee: '0',
                        confirm: () async {
                          final credentials = EthPrivateKey.fromHex(privateKey);

                          var bytes = utf8.encode(data);

                          Uint8List message = credentials
                              .signToUint8List(Uint8List.fromList(bytes));
                          String result = hex.encode(message);
                          log("result : 0x$result");
                          controller?.sendResult(result, id);
                        },
                        cancel: () {
                          controller?.cancel(id);
                        });
                    break;
                  case EIP1193.addEthereumChain:
                    log(params.toString());
                    if (params['name'] == 'addEthereumChain') {
                      final data = jsonEncode(params);
                      final finalData = jsonDecode(data);
                      log(finalData.toString());

                      // if (web3.evm.listChain.any((element) =>
                      //     element.chainId ==
                      //     int.parse(
                      //             finalData['object']['chainId']
                      //                 .toString()
                      //                 .substring(2),
                      //             radix: 16)
                      //         .toString())) {
                      //   Get.dialog(AlertSwitchNetwork(data: finalData));
                      // } else {
                      //   Get.dialog(AlertAddNetwork(data: finalData));
                      // }
                    }
                    break;
                }
              },
              initialUrlRequest: URLRequest(
                url: Uri.parse(
                  MethodHelper().urlValidator(widget.initialUrl),
                ),
              ),
            ),
    );
  }

  // Future<dynamic> sheetSetting(
  //   BuildContext context,
  // ) {
  //   return showModalBottomSheet(
  //       context: context,
  //       isScrollControlled: true,
  //       backgroundColor: Theme.of(context).colorScheme.surface,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(
  //           top: Radius.circular(16.r),
  //         ),
  //       ),
  //       builder: (context) {
  //         return Builder(builder: (context) {
  //           return StatefulBuilder(builder: (context, setStaxte) {
  //             return Container(
  //               margin: EdgeInsets.only(
  //                 top: 16.h,
  //                 left: 32.w,
  //                 right: 32.w,
  //                 bottom: 54.h,
  //               ),
  //               height: MediaQuery.of(context).size.height / 6,
  //               child: Column(
  //                 children: [
  //                   Text(web3.title.value,
  //                       style: AppFont.semibold16
  //                           .copyWith(color: Theme.of(context).indicatorColor)),
  //                   20.0.height,
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       GestureDetector(
  //                         onTap: () {
  //                           Get.back();
  //                           MethodHelper().handleCopy(
  //                             data: web3.url.value,
  //                           );
  //                         },
  //                         child: Column(
  //                           children: [
  //                             Icon(
  //                               Icons.copy_outlined,
  //                               color: Theme.of(context).indicatorColor,
  //                               size: 30,
  //                             ),
  //                             5.0.height,
  //                             Text("Copy url",
  //                                 style: AppFont.medium14.copyWith(
  //                                     color: Theme.of(context).indicatorColor)),
  //                           ],
  //                         ),
  //                       ),
  //                       GestureDetector(
  //                         onTap: () {
  //                           Get.back();
  //                           web3.webController.reload();
  //                         },
  //                         child: Column(
  //                           children: [
  //                             Icon(
  //                               Icons.refresh_outlined,
  //                               color: Theme.of(context).indicatorColor,
  //                               size: 30,
  //                             ),
  //                             5.0.height,
  //                             Text("Refresh",
  //                                 style: AppFont.medium14.copyWith(
  //                                     color: Theme.of(context).indicatorColor)),
  //                           ],
  //                         ),
  //                       ),
  //                       GestureDetector(
  //                         onTap: () {
  //                           Get.back();
  //                           web3.webController.clearCache();
  //                         },
  //                         child: Column(
  //                           children: [
  //                             Icon(
  //                               Icons.cleaning_services_outlined,
  //                               color: Theme.of(context).indicatorColor,
  //                               size: 30,
  //                             ),
  //                             5.0.height,
  //                             Text("Clear cache",
  //                                 style: AppFont.medium14.copyWith(
  //                                     color: Theme.of(context).indicatorColor)),
  //                           ],
  //                         ),
  //                       ),
  //                       Column(
  //                         children: [
  //                           Icon(
  //                             Icons.help_outline_rounded,
  //                             color: Theme.of(context).indicatorColor,
  //                             size: 30,
  //                           ),
  //                           5.0.height,
  //                           Text("Help",
  //                               style: AppFont.medium14.copyWith(
  //                                   color: Theme.of(context).indicatorColor)),
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                   const Spacer(),
  //                   GestureDetector(
  //                     onTap: () => Get.back(),
  //                     child: Text(
  //                       "Close",
  //                       style: AppFont.semibold16
  //                           .copyWith(color: Theme.of(context).primaryColor),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             );
  //           });
  //         });
  //       });
  // }
}
