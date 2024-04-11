// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../config/config.dart';
import '../../../../../data/src/src.dart';
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
        title: 'Receive',
        icon: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const SheetChangeReceive(),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  showDragHandle: true,
                  isDismissible: false,
                  isScrollControlled: true,
                  useSafeArea: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r))));
            },
            child: Container(
              height: 36.w,
              padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(width: 1.w, color: AppColor.grayColor)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: ClipPolygon(
                      sides: 6,
                      child: Container(
                        padding: EdgeInsets.all(0.1.h),
                        color: Theme.of(context).colorScheme.background,
                        child: (chain.logo != null)
                            ? Image.asset(chain.logo!)
                            : Image.asset(AppImage.logo),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Theme.of(context).hintColor,
                    size: 20.w,
                  ),
                ],
              ),
            )),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 36.h),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButton(
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
              ),
            ),
            12.0.width,
            Expanded(
              child: PrimaryButton(
                title: "Share",
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
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          children: [
            SizedBox(
              width: 50.w,
              height: 50.w,
              child: Stack(
                children: [
                  SizedBox(
                    width: 48.w,
                    height: 48.w,
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
                      width: 20.w,
                      height: 20.w,
                      child: ClipPolygon(
                        sides: 6,
                        child: Container(
                          padding: EdgeInsets.all(0.1.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.1.w,
                                  color: Theme.of(context).cardColor),
                              color: Theme.of(context).colorScheme.background),
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
            16.0.height,
            Text(
              "${chain.name} (${chain.symbol})",
              style: AppFont.semibold16
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            16.0.height,
            Warning(
                warning:
                    "Send only ${chain.symbol} Chain to this address, or you might loose your funds."),
            24.0.height,
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  36.0.height,
                  Container(
                    width: 244.w,
                    height: 244.w,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                    child: QrImageView(
                      embeddedImage: const AssetImage(
                        AppImage.logo,
                      ),
                      data: chain.baseChain == 'eth'
                          ? (account?.addressETH ?? '')
                          : chain.baseChain == 'sol'
                              ? (account?.addressSolana ?? "")
                              : '',
                      version: QrVersions.auto,
                      backgroundColor: Theme.of(context).cardColor,
                      foregroundColor: Theme.of(context).indicatorColor,
                      embeddedImageStyle:
                          QrEmbeddedImageStyle(size: Size(32.w, 32.w)),
                      size: 244.h,
                      gapless: false,
                    ),
                  ),
                  24.0.height,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Theme.of(context).colorScheme.background),
                    child: Text(
                      MethodHelper().shortAddress(
                          address: chain.baseChain == 'eth'
                              ? (account?.addressETH ?? '')
                              : chain.baseChain == 'sol'
                                  ? (account?.addressSolana ?? "")
                                  : chain.baseChain == 'sui'
                                      ? (account?.addressSui ?? "")
                                      : '',
                          length: 12),
                      style: AppFont.semibold16
                          .copyWith(color: Theme.of(context).hintColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  16.0.height
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
