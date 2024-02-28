// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/data/model/chain_network/chain_network.dart';
import 'package:bee_wallet/data/src/app_chain_logo.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../data/model/token_chain/token_chain.dart';
import '../../../../../data/src/src.dart';
import '../../../../provider/provider.dart';
import '../../../../widget/widget.dart';

final pinAddNetworkController =
    StateProvider<TextEditingController>((ref) => TextEditingController());

class SheetPasswordAddNetwork extends ConsumerWidget {
  const SheetPasswordAddNetwork({super.key, required this.chain});
  final ChainNetwork chain;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImage.logo,
            height: 32.w,
          ),
          8.0.height,
          Text(
            "Enter Security Password",
            style: AppFont.semibold16
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          16.0.height,
          Text(
            "Security Password used for open Wallet, Transaction, and Mnemonik Frase. Remember it and dont give password to anyoone",
            style:
                AppFont.medium12.copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.center,
          ),
          24.0.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: InputPin(
              keyboardType: TextInputType.none,
              controller: ref.watch(pinAddNetworkController),
              obsecure: true,
              onCompleted: (value) async {
                var pin = await DbHelper.instance.getPassword();
                if (pin.password == value) {
                  ref.read(pinAddNetworkController).clear();
                  context.pop();
                  ref.read(chainOtherProvider.notifier).addTokenChain(
                      TokenChain(
                          name: chain.name,
                          contractAddress: null,
                          symbol: chain.symbol,
                          decimal: 18,
                          balance: 0,
                          baseLogo: AppChainLogo.evm,
                          chainId: chain.chainId,
                          logo: AppChainLogo.evm,
                          explorer: chain.explorer,
                          explorerApi: chain.explorerApi,
                          baseChain: 'eth',
                          rpc: chain.rpc,
                          isTestnet: chain.isTestnet));
                } else {
                  ref.read(pinAddNetworkController).clear();
                  MethodHelper().showSnack(
                      context: context,
                      content: "Pin Didn't Match!",
                      backgorund: AppColor.redColor);
                }
              },
            ),
          ),
          16.0.height,
          Numpadcustom(
              controller: ref.watch(pinAddNetworkController),
              delete: () {
                ref.watch(pinAddNetworkController).text =
                    ref.watch(pinAddNetworkController).text != ''
                        ? ref.watch(pinAddNetworkController).text.substring(0,
                            ref.watch(pinAddNetworkController).text.length - 1)
                        : ref.watch(pinAddNetworkController).text;
              })
        ],
      ),
    );
  }
}
