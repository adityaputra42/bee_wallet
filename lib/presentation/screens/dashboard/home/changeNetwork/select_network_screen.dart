import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/data/model/token_chain/token_chain.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';

import '../../../../../config/theme/theme.dart';
import '../../../../../data/src/src.dart';

final searchListChain = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

class SelectNetworkScreen extends ConsumerWidget {
  const SelectNetworkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listChain = ref.watch(listChainSearchProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(context: context, title: "Change Network"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            16.0.height,
            Row(
              children: [
                Expanded(
                  child: SearchField(
                      controller: ref.watch(searchListChain),
                      onChange: (v) => ref
                          .read(listChainSearchProvider.notifier)
                          .onSearch(ref.watch(searchListChain).text)),
                ),
                12.0.width,
                GestureDetector(
                  onTap: () {},
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
                child: listChain.isEmpty
                    ? const Empty(title: "Chain Not Found")
                    : ListView(
                        children: [
                          cardSelectAll(context, ref),
                          12.0.height,
                          Column(
                            children: List.generate(
                                listChain.length,
                                (index) => Padding(
                                      padding: EdgeInsets.only(bottom: 12.h),
                                      child: cardChain(
                                          context, listChain[index], ref),
                                    )),
                          )
                        ],
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
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                width: 1.w,
                color: selectedChain.length == listchain.length
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
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                width: 1.w,
                color: listTokenChain.length != selectedChain.length &&
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
                  width: 36.w,
                  height: 36.w,
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
                12.0.width,
                Expanded(
                  child: Text(
                    chain.name ?? '',
                    style: AppFont.medium16
                        .copyWith(color: Theme.of(context).indicatorColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                8.0.width,
                Text(
                  chain.symbol ?? '',
                  style: AppFont.medium14
                      .copyWith(color: Theme.of(context).indicatorColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
