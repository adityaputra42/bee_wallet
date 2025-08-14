import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  (ref) => TextEditingController(),
);

class ManageToken extends ConsumerWidget {
  const ManageToken({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chainList = ref.watch(tokenChainOriginProvider).valueOrNull ?? [];
    final chainSelected = ref.watch(listManageTokenProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        title: 'Manage Token',
        icon: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const SheetChangeNetworkToken(),
              backgroundColor: Theme.of(context).colorScheme.surface,
              showDragHandle: true,
              isDismissible: false,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
            );
          },
          child: Container(
            height: 40,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: AppColor.grayColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                chainSelected.isNotEmpty &&
                        chainList.length != chainSelected.length
                    ? SizedBox(
                      width: 20,
                      height: 20,
                      child: ClipPolygon(
                        sides: 6,
                        child: Container(
                          padding: EdgeInsets.all(0.5),
                          color: Theme.of(context).colorScheme.surface,
                          child:
                              (chainSelected.first.logo != null)
                                  ? Image.asset(chainSelected.first.logo!)
                                  : Image.asset(AppImage.logo),
                        ),
                      ),
                    )
                    : Iconify(
                      MaterialSymbols.widgets_outline_rounded,
                      size: 32,
                      color: AppColor.primaryColor,
                    ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Theme.of(context).hintColor,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SearchField(
                      controller: ref.watch(searchManageToken),
                      onChange:
                          (v) => ref
                              .read(listManageTokenProvider.notifier)
                              .onSearch(ref.watch(searchManageToken).text),
                    ),
                  ),
                  width(8),
                  GestureDetector(
                    onTap: () {
                      context.goNamed('add_token');
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        size: 32,
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                  ),
                ],
              ),
              height(16),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).cardColor,
                  ),
                  child:
                      chainSelected.isEmpty
                          ? const Empty(title: "Token not found")
                          : ListView.builder(
                            itemBuilder:
                                (context, index) => Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: cardChain(
                                    context,
                                    ref,
                                    chainSelected[index],
                                  ),
                                ),
                            itemCount: chainSelected.length,
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container cardChain(BuildContext context, WidgetRef ref, TokenChain chain) {
    final listSelected = ref.watch(listTokenChainProvider).valueOrNull ?? [];
    final mnemonic = ref.watch(selectedAccountProvider).valueOrNull?.mnemonic;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 36,
                height: 36,
                child: Stack(
                  children: [
                    SizedBox(
                      width: 34,
                      height: 34,
                      child: ClipPolygon(
                        sides: 6,
                        child: Container(
                          padding: EdgeInsets.all(0.5),
                          color: Theme.of(context).colorScheme.surface,
                          child:
                              (chain.logo != null)
                                  ? Image.asset(chain.logo!)
                                  : Image.asset(AppImage.logo),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                        width: 14,
                        height: 14,
                        child: ClipPolygon(
                          sides: 6,
                          child: Container(
                            padding: EdgeInsets.all(0.1),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.3,
                                color: Theme.of(context).cardColor,
                              ),
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            child:
                                (chain.baseLogo != null)
                                    ? Image.asset(chain.baseLogo!)
                                    : Image.asset(AppImage.logo),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              width(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: chain.symbol ?? "",
                            style: AppFont.medium14.copyWith(
                              color: Theme.of(context).indicatorColor,
                            ),
                          ),
                          TextSpan(
                            text: " (ERC20)",
                            style: AppFont.medium10.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    height(2),
                    Text(
                      chain.name ?? "",
                      style: AppFont.reguler12.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                ),
              ),
              FlutterSwitch(
                width: 48,
                height: 24,
                toggleColor:
                    listSelected.any(
                          (element) =>
                              element.chainId == chain.chainId &&
                              element.symbol == chain.symbol,
                        )
                        ? AppColor.darkText1
                        : AppColor.grayColor,
                activeColor: AppColor.primaryColor,
                inactiveColor: Theme.of(context).cardColor,
                valueFontSize: 20.0,
                toggleSize: 20,
                value:
                    listSelected.any(
                          (element) =>
                              element.chainId == chain.chainId &&
                              element.symbol == chain.symbol,
                        )
                        ? true
                        : false,
                borderRadius: 16,
                padding: 2,
                showOnOff: false,
                onToggle: (val) {
                  ref
                      .read(listTokenChainProvider.notifier)
                      .setChain(
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
                          isTestnet: chain.isTestnet,
                        ),
                      );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
