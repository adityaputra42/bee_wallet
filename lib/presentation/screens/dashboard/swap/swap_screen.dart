import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/data/src/app_chain_logo.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';

class SwapScreen extends ConsumerWidget {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
          context: context, title: "Swap", isCanBack: false),
      body: Container(
        margin: EdgeInsets.fromLTRB(24.w, 0, 24.w, 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Theme.of(context).cardColor),
        child: Column(
          children: [
            SizedBox(
              height: 260.w,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(16.w, 16.w, 16.w, 28.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Theme.of(context).colorScheme.background),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "From :",
                                  style: AppFont.reguler12.copyWith(
                                      color: Theme.of(context).hintColor),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Iconify(
                                      Mdi.wallet_outline,
                                      color: Theme.of(context).hintColor,
                                      size: 16.w,
                                    ),
                                    8.0.width,
                                    Text(
                                      "0.00",
                                      style: AppFont.medium12.copyWith(
                                          color: Theme.of(context).hintColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            16.0.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width.w * 0.45,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 42.w,
                                        height: 42.w,
                                        child: ClipPolygon(
                                          sides: 6,
                                          child: Container(
                                            padding: EdgeInsets.all(0.5.h),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            child:
                                                Image.asset(AppChainLogo.bnb),
                                          ),
                                        ),
                                      ),
                                      8.0.width,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "BNB",
                                                style: AppFont.semibold14
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .indicatorColor),
                                              ),
                                              Iconify(
                                                Ic.round_arrow_drop_down,
                                                size: 24.w,
                                                color: Theme.of(context)
                                                    .indicatorColor,
                                              )
                                            ],
                                          ),
                                          Text(
                                            "Binance Smart chain",
                                            style: AppFont.reguler12.copyWith(
                                                color: Theme.of(context)
                                                    .hintColor),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                      style: AppFont.medium24.copyWith(
                                          color:
                                              Theme.of(context).indicatorColor),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.end,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        hintText: '0',
                                        contentPadding: EdgeInsets.zero,
                                        hintStyle: AppFont.medium24.copyWith(
                                            color: Theme.of(context)
                                                .indicatorColor),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.5),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent),
                                        ),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      8.0.height,
                      Container(
                        width: double.infinity,
                       
                        padding: EdgeInsets.fromLTRB(16.w, 24.w, 16.w, 16.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Theme.of(context).colorScheme.background),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "From :",
                                  style: AppFont.reguler12.copyWith(
                                      color: Theme.of(context).hintColor),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Iconify(
                                      Mdi.wallet_outline,
                                      color: Theme.of(context).hintColor,
                                      size: 16.w,
                                    ),
                                    8.0.width,
                                    Text(
                                      "0.00",
                                      style: AppFont.medium12.copyWith(
                                          color: Theme.of(context).hintColor),
                                    ),
                                  ],
                                )
                              ],
                            ),16.0.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width.w * 0.45,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 42.w,
                                        height: 42.w,
                                        child: ClipPolygon(
                                          sides: 6,
                                          child: Container(
                                            padding: EdgeInsets.all(0.5.h),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            child:
                                                Image.asset(AppChainLogo.usdt),
                                          ),
                                        ),
                                      ),
                                      8.0.width,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "USDT",
                                                style: AppFont.semibold14
                                                    .copyWith(
                                                        color: Theme.of(context)
                                                            .indicatorColor),
                                              ),
                                              Iconify(
                                                Ic.round_arrow_drop_down,
                                                size: 24.w,
                                                color: Theme.of(context)
                                                    .indicatorColor,
                                              )
                                            ],
                                          ),
                                          Text(
                                            "Theter USD",
                                            style: AppFont.reguler12.copyWith(
                                                color: Theme.of(context)
                                                    .hintColor),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                      style: AppFont.medium24.copyWith(
                                          color:
                                              Theme.of(context).indicatorColor),
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.end,
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        hintText: '0',
                                        contentPadding: EdgeInsets.zero,
                                        hintStyle: AppFont.medium24.copyWith(
                                            color: Theme.of(context)
                                                .indicatorColor),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.5),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.5),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 0.5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent),
                                        ),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 54.w,
                      height: 54.w,
                      padding: EdgeInsets.all(8.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primaryColor,
                      ),
                      child: Iconify(
                        MaterialSymbols.swap_vert_rounded,
                        size: 36.w,
                        color: AppColor.textStrongDark,
                      ),
                    ),
                  )
                ],
              ),
            ),
            16.0.height,
            PrimaryButton(title: "Swap", onPressed: () {}),
            16.0.height,
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Theme.of(context).colorScheme.background),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Provider',
                        style: AppFont.reguler12
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      Row(
                        children: [
                          Text(
                            '1Inch',
                            style: AppFont.medium12.copyWith(
                                color: Theme.of(context).indicatorColor),
                          ),
                          4.0.width,
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16.w,
                            color: Theme.of(context).indicatorColor,
                          )
                        ],
                      )
                    ],
                  ),
                  12.0.height,
                  SizedBox(
                    height: 1.h,
                    child: Divider(
                      thickness: 1.h,
                      color: AppColor.grayColor,
                    ),
                  ),
                  12.0.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rate',
                        style: AppFont.reguler12
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      Text(
                        '1 ETH = 2967.2783 USDT',
                        style: AppFont.medium12
                            .copyWith(color: Theme.of(context).indicatorColor),
                      ),
                    ],
                  ),
                  8.0.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fee',
                        style: AppFont.reguler12
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      Text(
                        '0.25 %',
                        style: AppFont.medium12
                            .copyWith(color: Theme.of(context).indicatorColor),
                      ),
                    ],
                  ),
                  8.0.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Time',
                        style: AppFont.reguler12
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      Text(
                        '~ 10 min',
                        style: AppFont.medium12
                            .copyWith(color: Theme.of(context).indicatorColor),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
