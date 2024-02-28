import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../data/src/src.dart';

class SheetFingerprint extends ConsumerWidget {
  const SheetFingerprint({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Unlock Private Key",
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          16.0.height,
          Text(
            "You can use your fingerprint to confirm making payments through this app.",
            style: AppFont.reguler14
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          16.0.height,
          Image.asset(
            AppImage.fingerprint,
            width: 64.w,
          ),
          16.0.height,
          Text(
            "Touch the fingerprint sensor",
            style:
                AppFont.reguler12.copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.center,
          ),
          28.0.height,
          Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 12.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "User Pattern",
                style: AppFont.medium14.copyWith(color: AppColor.primaryColor),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
