import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.fromLTRB(24.w, 0.h, 24.w, 0.w),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.65,
        child: Column(
          children: [
            Text(
              "Select Network",
              style: AppFont.medium18
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            16.0.height,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    cardSelectAll(context, ref),
                    12.0.height,
                    Column(
                        children: List.generate(
                      chainList.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
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
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                width: 1.w,
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
                  size: 32.w,
                  color: Theme.of(context).hintColor,
                ),
                8.0.width,
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
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                width: 1.w,
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
                  width: 32.w,
                  height: 32.w,
                  child: ClipPolygon(
                    sides: 6,
                    child: Container(
                      padding: EdgeInsets.all(0.5.h),
                      color: Theme.of(context).colorScheme.surface,
                      child: (chain.logo != null)
                          ? Image.asset(chain.logo!)
                          : Image.asset(AppImage.logo),
                    ),
                  ),
                ),
                8.0.width,
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
