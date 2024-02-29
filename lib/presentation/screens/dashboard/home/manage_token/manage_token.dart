import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:bee_wallet/data/model/token_chain/selected_token_chain.dart';
import 'package:bee_wallet/data/model/token_chain/token_chain.dart';
import 'package:bee_wallet/presentation/provider/account/account_provider.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../data/src/src.dart';
import 'sheet_change_network_token.dart';

final searchManageToken = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

class ManageToken extends ConsumerWidget {
  const ManageToken({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chainList = ref.watch(tokenChainOriginProvider).valueOrNull ?? [];
    final chainSelected = ref.watch(listManageTokenProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
        context: context,
        title: 'Manage Token',
        icon: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const SheetChangeNetworkToken(),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  showDragHandle: true,
                  isDismissible: false,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r))));
            },
            child: Container(
              height: 40.w,
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(width: 1.w, color: AppColor.grayColor)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  chainSelected.isNotEmpty &&
                          chainList.length != chainSelected.length
                      ? Image.asset(
                          chainSelected.first.logo ?? "",
                          height: 32.w,
                        )
                      : Iconify(
                          MaterialSymbols.widgets_outline_rounded,
                          size: 32.w,
                          color: AppColor.primaryColor,
                        ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Theme.of(context).hintColor,
                    size: 20.w,
                  ),
                ],
              ),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SearchField(
                    controller: ref.watch(searchManageToken),
                    onChange: (v) => ref
                        .read(listManageTokenProvider.notifier)
                        .onSearch(ref.watch(searchManageToken).text),
                  ),
                ),
                8.0.width,
                GestureDetector(
                  onTap: () {
                    context.goNamed('add_token');
                  },
                  child: Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Theme.of(context).cardColor),
                    child: Icon(
                      Icons.add_rounded,
                      size: 32.w,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                )
              ],
            ),
            16.0.height,
            Expanded(
                child: chainSelected.isEmpty
                    ? const Empty(title: "Token not found")
                    : ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: cardChain(context, ref, chainSelected[index]),
                        ),
                        itemCount: chainSelected.length,
                      ))
          ],
        ),
      ),
    );
  }

  Container cardChain(BuildContext context, WidgetRef ref, TokenChain chain) {
    final listSelected = ref.watch(listTokenChainProvider).valueOrNull ?? [];
    final mnemonic = ref.watch(selectedAccountProvider).valueOrNull?.mnemonic;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Theme.of(context).cardColor),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 36.w,
                height: 36.w,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 34.w,
                      height: 34.w,
                      child: ClipPolygon(
                        sides: 6,
                        child: Container(
                          padding: EdgeInsets.all(0.5.h),
                          color: Theme.of(context).colorScheme.background,
                          child: (chain.logo != null)
                              ? Image.asset(chain.logo!)
                              : Image.asset(AppImage.logo),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 14.w,
                        height: 14.w,
                        child: ClipPolygon(
                          sides: 6,
                          child: Container(
                            padding: EdgeInsets.all(0.1.h),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.3.w,
                                    color: Theme.of(context).cardColor),
                                color:
                                    Theme.of(context).colorScheme.background),
                            child: (chain.baseLogo != null)
                                ? Image.asset(chain.baseLogo!)
                                : Image.asset(AppImage.logo),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              12.0.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: chain.symbol ?? "",
                          style: AppFont.medium14.copyWith(
                              color: Theme.of(context).indicatorColor)),
                      TextSpan(
                          text: " (ERC20)",
                          style: AppFont.medium10
                              .copyWith(color: Theme.of(context).hintColor))
                    ])),
                    2.0.height,
                    Text(
                      chain.name ?? "",
                      style: AppFont.reguler12
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
              ),
              FlutterSwitch(
                width: 48.w,
                height: 24.h,
                toggleColor: AppColor.grayColor,
                activeColor: AppColor.primaryColor,
                inactiveColor: Theme.of(context).cardColor,
                valueFontSize: 20.0,
                toggleSize: 20.h,
                value: listSelected.any((element) =>
                        element.chainId == chain.chainId &&
                        element.symbol == chain.symbol)
                    ? true
                    : false,
                borderRadius: 16,
                padding: 2.h,
                showOnOff: false,
                onToggle: (val) {
                  ref.read(listTokenChainProvider.notifier).setChain(
                      SelectedTokenChain(
                          name: chain.name,
                          contractAddress: chain.contractAddress,
                          symbol: chain.symbol,
                          decimal: chain.decimal,
                          balance: chain.balance,
                          mnemonicAccount: mnemonic ?? '',
                          logo: chain.logo,
                          baseLogo: chain.baseLogo,
                          chainId: chain.chainId,
                          rpc: chain.rpc,
                          explorer: chain.explorer,
                          explorerApi: chain.explorerApi,
                          baseChain: chain.baseChain,
                          isTestnet: chain.isTestnet));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
