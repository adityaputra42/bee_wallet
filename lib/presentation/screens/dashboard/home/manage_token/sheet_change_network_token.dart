import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bee_wallet/data/model/token_chain/token_chain.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import '../../../../../config/config.dart';
import '../../../../../data/src/src.dart';

class SheetChangeNetworkToken extends ConsumerWidget {
  const SheetChangeNetworkToken({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chainList = (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
        .where((e) => e.contractAddress == null)
        .toList();
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.65,
        child: Column(
          children: [
            Text(
              "Select Network",
              style: AppFont.medium18
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            height(16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    cardSelectAll(context, ref),
                    height(12),
                    Column(
                        children: List.generate(
                      chainList.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: cardChain(context, chainList[index], ref),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardSelectAll(BuildContext context, WidgetRef ref) {
    final listchain = (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
        .where((e) => e.contractAddress == null)
        .toList();
    final selectedChain = ref
        .watch(listManageTokenProvider)
        .where((e) => e.contractAddress == null)
        .toList();
    return GestureDetector(
      onTap: () {
        ref.read(listManageTokenProvider.notifier).changeSelected(isAll: true);
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: 1,
                color: listchain.length == selectedChain.length
                    ? AppColor.primaryColor
                    : Theme.of(context).cardColor),
            color: Theme.of(context).cardColor),
        child: Column(
          children: [
            Row(
              children: [
                Iconify(
                  MaterialSymbols.widgets_outline_rounded,
                  size: 32,
                  color: Theme.of(context).hintColor,
                ),
                width(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All",
                        style: AppFont.medium14
                            .copyWith(color: Theme.of(context).indicatorColor),
                      ),
                      Text(
                        "Select all added network",
                        style: AppFont.reguler12
                            .copyWith(color: Theme.of(context).hintColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardChain(BuildContext context, TokenChain chain, WidgetRef ref) {
    final selectedChain = ref
        .watch(listManageTokenProvider)
        .where((e) => e.contractAddress == null)
        .toList();
    final listchain = (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
        .where((e) => e.contractAddress == null)
        .toList();
    return GestureDetector(
      onTap: () {
        ref
            .read(listManageTokenProvider.notifier)
            .changeSelected(isAll: false, chain: chain);
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: 1,
                color: listchain.length != selectedChain.length &&
                        selectedChain
                            .any((element) => element.chainId == chain.chainId)
                    ? AppColor.primaryColor
                    : Theme.of(context).cardColor),
            color: Theme.of(context).cardColor),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 32,
                  height: 32,
                  child: ClipPolygon(
                    sides: 6,
                    child: Container(
                      padding: EdgeInsets.all(0.5),
                      color: Theme.of(context).colorScheme.surface,
                      child: (chain.logo != null)
                          ? Image.asset(chain.logo!)
                          : Image.asset(AppImage.logo),
                    ),
                  ),
                ),
                width(8),
                Expanded(
                  child: Text(
                    chain.name ?? '',
                    style: AppFont.medium14
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
