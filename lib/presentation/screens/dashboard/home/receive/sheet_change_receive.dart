import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/data/model/token_chain/selected_token_chain.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../config/config.dart';
import '../../../../../data/src/src.dart';
import '../../../../provider/provider.dart';
import '../../../../widget/search_field.dart';

class SheetChangeReceive extends ConsumerWidget {
  const SheetChangeReceive({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chainList = ref.watch(selectedChainTokenProvider).valueOrNull ?? [];

    return Padding(
      padding: EdgeInsets.fromLTRB(
          24.w, 0.h, 24.w, MediaQuery.of(context).viewInsets.bottom),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Column(
          children: [
            Text(
              "Change Asset",
              style: AppFont.semibold16
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            16.0.height,
            SearchField(),
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
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                width: 1.w,
                color: chainDetail.chainId == chain.chainId &&
                        chainDetail.symbol == chain.symbol
                    ? AppColor.primaryColor
                    : Theme.of(context).colorScheme.background),
            color: Theme.of(context).colorScheme.background),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 34.w,
                  height: 34.w,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 32.w,
                        height: 32.w,
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
                          width: 16.w,
                          height: 16.w,
                          child: ClipPolygon(
                            sides: 6,
                            child: Container(
                              padding: EdgeInsets.all(0.1.h),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.1.w,
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
