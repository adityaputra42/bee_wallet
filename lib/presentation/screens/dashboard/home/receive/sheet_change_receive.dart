import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/data/model/token_chain/selected_token_chain.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../config/config.dart';
import '../../../../provider/provider.dart';

class SheetChangeReceive extends ConsumerWidget {
  const SheetChangeReceive({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chainList = ref.watch(selectedChainTokenProvider).valueOrNull ?? [];

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 16.w),
      child: Column(
        children: [
          Text(
            "Change Asset",
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          16.0.height,
          // SearchField(),
          // 12.0.height,
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: cardChain(context, chainList[index], ref),
              ),
              itemCount: chainList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardChain(
      BuildContext context, SelectedTokenChain chain, WidgetRef ref) {
    final chainDetail = ref.watch(chainDetailProvider);
    return GestureDetector(
      onTap: () {
        ref.read(chainDetailProvider.notifier).setChainDetail(chain);
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
                width: 1.w,
                color: chainDetail.chainId == chain.chainId &&
                        chainDetail.symbol == chain.symbol
                    ? AppColor.primaryColor
                    : Theme.of(context).cardColor),
            color: Theme.of(context).cardColor),
        child: Column(
          children: [
            Row(
              children: [
               SizedBox(
              width: 34.w,
              height: 34.w,
              child: Stack(
                children: [
                  Container(
                    width: 32.w,
                    height: 32.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(chain.logo ?? ''))),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 14.w,
                      height: 14.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1.w, color: Theme.of(context).cardColor),
                          image: DecorationImage(
                              image: AssetImage(chain.baseLogo ?? ''))),
                    ),
                  ),
                ],
              ),
            ),
                12.0.width,
                Expanded(
                  child: Text(
                    chain.name ?? '',
                    style: AppFont.reguler14
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                ),
                // SizedBox(
                //   width: 16.w,
                //   height: 16.w,
                //   child: Checkbox(
                //     value: chainDetail.chainId == chain.chainId ? true : false,
                //     onChanged: (v) {},
                //     activeColor: AppColor.primaryColor,
                //     shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(2.r)),
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
