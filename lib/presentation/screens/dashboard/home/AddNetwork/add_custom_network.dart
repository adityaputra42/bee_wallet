import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../data/model/token_chain/token_chain.dart';
import '../../../../../data/src/app_chain_logo.dart';

class AddCustomNetwork extends ConsumerWidget {
  const AddCustomNetwork({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        title: 'Add Custom Network',
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Theme.of(context).cardColor),
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Warning(
                          warning:
                              "Crypto Wallet does not verify custom networks or their security. Only add a network you trust"),
                      16.0.height,
                      InputText(
                        title: "Network name",
                        controller: ref.watch(nameChainControllerProvider),
                        hintText: "Input Network Name",
                        color: Theme.of(context).colorScheme.surface,
                        onChange: (v) {
                          ref
                              .read(nameChainControllerProvider.notifier)
                              .onChange(v);
                        },
                        validator: (v) {
                          return ref
                              .read(nameChainControllerProvider.notifier)
                              .onValidate(v);
                        },
                      ),
                      16.0.height,
                      InputText(
                        title: "RPC URL",
                        controller: ref.watch(rpcChainControllerProvider),
                        hintText: "Input a RPC URL",
                        color: Theme.of(context).colorScheme.surface,
                        onChange: (v) {
                          ref
                              .read(rpcChainControllerProvider.notifier)
                              .onChange(v);
                        },
                        validator: (v) {
                          return ref
                              .read(rpcChainControllerProvider.notifier)
                              .onValidate(v);
                        },
                      ),
                      16.0.height,
                      InputText(
                        title: "Chain ID",
                        controller: ref.watch(chainIdControllerProvider),
                        hintText: "Input a Chain ID",
                        keyboardType: TextInputType.number,
                        color: Theme.of(context).colorScheme.surface,
                        onChange: (v) {
                          ref
                              .read(chainIdControllerProvider.notifier)
                              .onChange(v);
                        },
                        validator: (v) {
                          return ref
                              .read(chainIdControllerProvider.notifier)
                              .onValidate(v);
                        },
                      ),
                      16.0.height,
                      InputText(
                        title: "Currency symbol",
                        controller: ref.watch(symbolChainControllerProvider),
                        hintText: "Input Currency Symbol",
                        color: Theme.of(context).colorScheme.surface,
                        onChange: (v) {
                          ref
                              .read(symbolChainControllerProvider.notifier)
                              .onChange(v);
                        },
                        validator: (v) {
                          return ref
                              .read(symbolChainControllerProvider.notifier)
                              .onValidate(v);
                        },
                      ),
                      16.0.height,
                      InputText(
                        title: "Block Explorer URL",
                        controller: ref.watch(explorerChainControllerProvider),
                        hintText: "Input Block Explorer URL",
                        color: Theme.of(context).colorScheme.surface,
                        onChange: (v) {
                          ref
                              .read(explorerChainControllerProvider.notifier)
                              .onChange(v);
                        },
                        validator: (v) {
                          return ref
                              .read(explorerChainControllerProvider.notifier)
                              .onValidate(v);
                        },
                      ),
                    ],
                  ),
                  PrimaryButton(
                    title: "Add",
                    disable: ref.watch(disableAddTokenProvider),
                    onPressed: () {
                      ref.read(chainOtherProvider.notifier).addTokenChain(
                          TokenChain(
                              name: ref.watch(nameChainControllerProvider).text,
                              contractAddress: null,
                              symbol:
                                  ref.watch(symbolChainControllerProvider).text,
                              decimal: 18,
                              balance: 0,
                              baseLogo: AppChainLogo.evm,
                              chainId:
                                  ref.watch(chainIdControllerProvider).text,
                              logo: AppChainLogo.evm,
                              explorer: ref
                                  .watch(explorerChainControllerProvider)
                                  .text,
                              explorerApi: ref
                                  .watch(explorerChainControllerProvider)
                                  .text,
                              baseChain: 'eth',
                              rpc: ref.watch(rpcChainControllerProvider).text,
                              isTestnet: false));
                      MethodHelper().showSnack(
                          context: context,
                          content: "Success Add Network",
                          backgorund: AppColor.greenColor);
                      context.pop();
                      context.pop();
                    },
                    margin: EdgeInsets.only(top: 16.h),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
