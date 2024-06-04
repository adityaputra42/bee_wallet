import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/data/model/token_chain/token_chain.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/utils/util.dart';
import '../../../../../config/config.dart';
import '../../../../../data/src/src.dart';
import '../../../../widget/widget.dart';

class SheetNetworkAddToken extends ConsumerWidget {
  const SheetNetworkAddToken({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chainList = (ref.watch(tokenChainOriginProvider).valueOrNull ?? [])
        .where((e) => e.contractAddress == null)
        .toList();
    return Padding(
      padding: EdgeInsets.fromLTRB(
          24.w, 0.h, 24.w, MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Column(
          children: [
            Text(
              "Select Network",
              style: AppFont.semibold16
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            16.0.height,
            const SearchField(),
            16.0.height,
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Theme.of(context).cardColor),
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: cardChain(context, chainList[index], ref),
                  ),
                  itemCount: chainList.length,
                ),
              ),
            ),
            24.0.height,
          ],
        ),
      ),
    );
  }

  Widget cardChain(BuildContext context, TokenChain chain, WidgetRef ref) {
    final selectedChain = ref.watch(networkAddTokenProvider);

    return GestureDetector(
      onTap: () {
        ref.read(networkAddTokenProvider.notifier).changeSelected(chain: chain);
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                width: 1.w,
                color: selectedChain.chainId == chain.chainId
                    ? AppColor.primaryColor
                    : Theme.of(context).colorScheme.background),
            color: Theme.of(context).colorScheme.background),
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
                      color: Theme.of(context).colorScheme.background,
                      child: Image.asset(chain.logo ?? AppImage.logo),
                    ),
                  ),
                ),
                12.0.width,
                Expanded(
                  child: Text(
                    chain.name ?? '',
                    style: AppFont.medium16
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
