import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/data/src/src.dart';
import 'package:bee_wallet/presentation/provider/tokenChain/token_chain_provider.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../data/model/token_chain/token_chain.dart';
import '../../../../../data/src/app_chain_logo.dart';
import '../../../../widget/widget.dart';
import 'sheet_network_add_token.dart';

final indexTabTokenProvider = StateProvider<int>((ref) => 0);

class AddToken extends ConsumerWidget {
  AddToken({super.key});
  final DebouncerHelper debouncer = DebouncerHelper(milliseconds: 500);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chain = ref.watch(networkAddTokenProvider);

    return Scaffold(
      appBar: WidgetHelper.appBar(
        context: context,
        title: 'Add Custom Token',
      ),
      bottomNavigationBar: PrimaryButton(
        title: "Add",
        onPressed: () {
          ref.read(listManageTokenProvider.notifier).addToken(
              context,
              TokenChain(
                  name: ref.watch(nameTokenProvider).text,
                  contractAddress: ref.watch(contractAddressProvider).text,
                  symbol: ref.watch(symbolTokenProvider).text,
                  decimal: int.parse(ref.watch(decimalTokenProvider).text),
                  balance: 0,
                  baseLogo: chain.baseLogo,
                  chainId: chain.chainId,
                  logo: chain.chainId == '234'
                      ? AppChainLogo.petaDefault
                      : AppChainLogo.evm,
                  explorer: chain.explorer,
                  explorerApi: chain.explorerApi,
                  baseChain: chain.baseChain,
                  rpc: chain.rpc,
                  isTestnet: null));
        },
        margin: EdgeInsets.fromLTRB(16.w, 8.w, 16.w, 32.h),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Network",
                  style: AppFont.medium12
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const SheetNetworkAddToken(),
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        showDragHandle: true,
                        isDismissible: false,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.r))));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${chain.name} (ERC20)",
                        style: AppFont.medium12
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16.w,
                        color: Theme.of(context).hintColor,
                      )
                    ],
                  ),
                )
              ],
            ),
            16.0.height,
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).cardColor),
              child: Column(
                children: [
                  InputText(
                    title: "Contact Address",
                    crossTitle: Image.asset(
                      AppIcon.scan,
                      width: 24.w,
                    ),
                    controller: ref.watch(contractAddressProvider),
                    onChange: (value) {
                      debouncer.run(() {
                        ref.read(contractAddressProvider.notifier).getTokenInfo(
                            context: context,
                            contractAddress: value,
                            rpc: chain.rpc ?? '');
                      });
                    },
                    hintText: "Add Contract Address",
                    color: Theme.of(context).colorScheme.background,
                  ),
                  16.0.height,
                  InputText(
                    title: "Name",
                    hintText: "Add Name",
                    enable: false,
                    controller: ref.watch(nameTokenProvider),
                    color: Theme.of(context).colorScheme.background,
                  ),
                  16.0.height,
                  InputText(
                    title: "Symbol",
                    hintText: "Add Symbol",
                    controller: ref.watch(symbolTokenProvider),
                    enable: false,
                    color: Theme.of(context).colorScheme.background,
                  ),
                  16.0.height,
                  InputText(
                    title: "Decimals",
                    hintText: "Add Decimals",
                    controller: ref.watch(decimalTokenProvider),
                    enable: false,
                    color: Theme.of(context).colorScheme.background,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
