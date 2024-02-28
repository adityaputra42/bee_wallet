import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/data/model/token_chain/token_chain.dart';
import 'package:bee_wallet/data/src/app_icon.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../config/theme/theme.dart';

final searchListChain = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

class SelectNetworkScreen extends ConsumerWidget {
  const SelectNetworkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listChain = ref.watch(listChainSearchProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
        context: context,
        title: 'Select Network',
        icon: GestureDetector(
            onTap: () {
              context.goNamed("add_network");
            },
            child: Container(
              width: 40.w,
              height: 40.w,
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(width: 1.w, color: AppColor.grayColor)),
              child: Icon(
                Icons.add_circle_outline_rounded,
                color: AppColor.primaryColor,
                size: 20.w,
              ),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            SearchField(
                controller: ref.watch(searchListChain),
                onChange: (v) => ref
                    .read(listChainSearchProvider.notifier)
                    .onSearch(ref.watch(searchListChain).text)),
            16.0.height,
            Expanded(
                child: Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).cardColor),
              child: listChain.isEmpty
                  ? const Empty(title: "Chain Not Found")
                  : ListView(
                      children: [
                        cardSelectAll(context, ref),
                        8.0.height,
                        Column(
                          children: List.generate(
                              listChain.length,
                              (index) => Padding(
                                    padding: EdgeInsets.only(bottom: 8.h),
                                    child: cardChain(
                                        context, listChain[index], ref),
                                  )),
                        )
                      ],
                    ),
            ))
          ],
        ),
      ),
    );
  }

  Widget cardSelectAll(BuildContext context, WidgetRef ref) {
    final listchain = (ref.watch(listTokenChainProvider).valueOrNull ?? [])
        .where((e) => e.contractAddress == null)
        .toList();
    final selectedChain =
        (ref.watch(selectedChainTokenProvider).valueOrNull ?? [])
            .where((e) => e.contractAddress == null)
            .toList();
    return GestureDetector(
      onTap: () {
        ref.read(selectedChainTokenProvider.notifier).changeNework(isAll: true);
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
                width: 1.w,
                color: selectedChain.length == listchain.length
                    ? AppColor.primaryColor
                    : Theme.of(context).colorScheme.background),
            color: Theme.of(context).colorScheme.background),
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
    final selectedChain =
        (ref.watch(selectedChainTokenProvider).valueOrNull ?? []);
    final listTokenChain =
        (ref.watch(listTokenChainProvider).valueOrNull ?? []);

    return GestureDetector(
      onTap: () {
        ref.read(selectedChainTokenProvider.notifier).changeNework(
            isAll: false,
            network: listTokenChain
                .where((element) => element.chainId == chain.chainId)
                .toList()
                .first);
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
                width: 1.w,
                color: listTokenChain.length != selectedChain.length &&
                        selectedChain
                            .any((element) => element.chainId == chain.chainId)
                    ? AppColor.primaryColor
                    : Theme.of(context).colorScheme.background),
            color: Theme.of(context).colorScheme.background),
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
