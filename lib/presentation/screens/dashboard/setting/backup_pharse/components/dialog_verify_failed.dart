import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/config.dart';
import '../../../../../../data/src/src.dart';
import '../../../../../widget/widget.dart';

class DialogVerifyFailed extends StatelessWidget {
  const DialogVerifyFailed({super.key});

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return SizedBox(
        width: 430.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImage.logo,
              width: 80.w,
            ),
            16.0.height,
            Text(
              "Losing the mnemonic phrase will result in asset loss. We stongly recommend that you back up the mnemonic phrase before using the wallet",
              style: AppFont.reguler12
                  .copyWith(color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
            ),
            16.0.height,
            PrimaryButton(
                title: "Close",
                onPressed: () {
                  Navigator.pop(context);
                }),
            8.0.height,
            SecondaryButton(
                title: "Skip for now",
                onPressed: () {
                  Navigator.pop(context);
                  context.goNamed('main');
                })
          ],
        ),
      );
    }

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      content: content(),
    );
  }
}
