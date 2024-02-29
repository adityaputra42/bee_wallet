import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/data/src/app_image.dart';
import 'package:bee_wallet/presentation/widget/primary_button.dart';
import 'package:bee_wallet/presentation/widget/secondary_button.dart';
import 'package:bee_wallet/utils/util.dart';

class DialogEstimateFeeFailed extends StatelessWidget {
  const DialogEstimateFeeFailed({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return SizedBox(
        width: 430.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImage.warning,
              width: 80.w,
            ),
            16.0.height,
            Text(
              "Gas Estimation Failed",
              style: AppFont.medium14
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            16.0.height,
            Text(
              "Gas estimation errored: “Exeution Reverted”. The transaction execution will likely fail. Do you want to force sending",
              style: AppFont.reguler12
                  .copyWith(color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
            ),
            16.0.height,
            PrimaryButton(title: "Proceed", onPressed: () {}),
            8.0.height,
            SecondaryButton(title: "Cancel", onPressed: () {})
          ],
        ),
      );
    }

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      content: content(),
    );
  }
}
