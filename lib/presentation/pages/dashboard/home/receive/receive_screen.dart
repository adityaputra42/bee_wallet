// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../config/config.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../provider/provider.dart';
import '../../../../widget/widget.dart';
import 'sheet_change_receive.dart';

class ReceiveScreen extends ConsumerWidget {
  const ReceiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chain = ref.watch(chainDetailProvider);
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
        context: context,
        title: "Receive",
      ),
      body: Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).cardColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Theme.of(context).colorScheme.background),
              child: Row(
                children: [
                  Container(
                    width: 28.w,
                    height: 28.w,
                    padding: EdgeInsets.all(6.h),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.secondaryColor.withOpacity(0.1),
                    ),
                    child: Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 16.w,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  8.0.width,
                  Text(
                    "${account?.name}-${account?.id}",
                    style: AppFont.medium14
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                ],
              ),
            ),
            16.0.height,
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const SheetChangeReceive(),
                    backgroundColor: Theme.of(context).colorScheme.background,
                    showDragHandle: true,
                    isDismissible: false,
                    // isScrollControlled: true,
                    // useSafeArea: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.r))));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Theme.of(context).colorScheme.background),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      chain.logo ?? '',
                      width: 24.w,
                    ),
                    8.0.width,
                    Text(
                      "${chain.name} (${chain.symbol})",
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    8.0.width,
                    Icon(
                      Icons.expand_more_rounded,
                      size: 24.w,
                      color: AppColor.primaryColor,
                    )
                  ],
                ),
              ),
            ),
            36.0.height,
            SizedBox(
              width: 244.w,
              height: 244.w,
              child: QrImageView(
                embeddedImage: AssetImage(
                  chain.logo ?? '',
                ),
                data: chain.baseChain == 'eth'
                    ? (account?.addressETH ?? '')
                    : chain.baseChain == 'sol'
                        ? (account?.addressSolana ?? "")
                        : '',
                version: QrVersions.auto,
                foregroundColor: Theme.of(context).hintColor,
                embeddedImageStyle:
                    QrEmbeddedImageStyle(size: Size(32.w, 32.w)),
                size: 244.h,
                gapless: false,
              ),
            ),
            36.0.height,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: Theme.of(context).colorScheme.background),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Address :",
                          style: AppFont.medium14.copyWith(
                              color: Theme.of(context).indicatorColor),
                        ),
                        2.0.height,
                        Text(
                          MethodHelper().shortAddress(
                              address: chain.baseChain == 'eth'
                                  ? (account?.addressETH ?? '')
                                  : chain.baseChain == 'sol'
                                      ? (account?.addressSolana ?? "")
                                      : chain.baseChain == 'sui'
                                          ? (account?.addressSui ?? "")
                                          : '',
                              length: 8),
                          style: AppFont.medium12
                              .copyWith(color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  ),
                  PrimaryButton(
                    title: "Copy",
                    onPressed: () {
                      MethodHelper().handleCopy(
                          data: chain.baseChain == 'eth'
                              ? (account?.addressETH ?? '')
                              : chain.baseChain == 'sol'
                                  ? (account?.addressSolana ?? "")
                                  : chain.baseChain == 'sui'
                                      ? (account?.addressSui ?? "")
                                      : '',
                          context: context);
                    },
                    width: ScreenUtil().screenWidth * 0.3,
                  )
                ],
              ),
            ),
            const Spacer(),
            PrimaryButton(
              title: "Share My Address",
              onPressed: () {
                Share.share(
                  chain.baseChain == 'eth'
                      ? (account?.addressETH ?? '')
                      : chain.baseChain == 'sol'
                          ? (account?.addressSolana ?? "")
                          : '',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
