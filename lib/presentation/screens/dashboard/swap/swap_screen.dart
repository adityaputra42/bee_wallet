// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web3_provider/web3_provider.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/json_rpc.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import '../../../../config/config.dart';
import '../../../../utils/util.dart';
import '../../../provider/account/account_provider.dart';
import '../../../provider/swap/swap_provider.dart';
import '../dapps/components/js_bridge_bean.dart';
import '../dapps/components/payment_sheet_page.dart';

class SwapScreen extends ConsumerStatefulWidget {
  const SwapScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SwapScreenState();
}

class _SwapScreenState extends ConsumerState<SwapScreen> {
  InAppWebViewController? _webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
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
    final chain = ref.watch(chainSwapProvider);
    String privateKey = Ecryption().decrypt(account?.keyETH ?? '');
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
          final chain = ref.watch(chainSwapProvider);
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

  _showModalAddChain({
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
          final chain = ref.watch(chainSwapProvider);
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

  _showModalSignTypedTx({
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
          final chain = ref.watch(chainSwapProvider);
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
    final chain = ref.watch(chainSwapProvider);
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
    final chain = ref.watch(chainSwapProvider);
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: InAppWebViewEIP1193(
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
          onUpdateVisitedHistory: (controller, url, androidIsReload) async {
            _webViewController = controller;
          },
          onTitleChanged: (controller, title) async {
            await _webViewController?.getUrl();
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
                String privateKey = Ecryption().decrypt(account?.keyETH ?? '');
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
                String privateKey = Ecryption().decrypt(account?.keyETH ?? '');
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
              MethodHelper().urlValidator("https://petaswap.io/swap"),
            ),
          ),
        ),
      ),
    );
  }
}
