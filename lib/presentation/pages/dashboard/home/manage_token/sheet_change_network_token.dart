import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/data/model/token_chain/token_chain.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/utils/util.dart';
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
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 16.w),
      child: Column(
        children: [
          Text(
            "Select Network",
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          16.0.height,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  cardSelectAll(context, ref),
                  8.0.height,
                  Column(
                      children: List.generate(
                    chainList.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: cardChain(context, chainList[index], ref),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
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
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
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
                Image.asset(
                  AppIcon.boxIcon,
                  height: 32.w,
                  color: Theme.of(context).hintColor,
                ),
                12.0.width,
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
            borderRadius: BorderRadius.circular(12.r),
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
                Image.asset(
                  chain.logo ?? '',
                  height: 32.w,
                ),
                12.0.width,
                Expanded(
                  child: Text(
                    chain.name ?? '',
                    style: AppFont.reguler14
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
