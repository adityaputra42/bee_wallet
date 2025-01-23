import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
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
        width: 430,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImage.logo,
              width: 80,
            ),
            height(16),
            Text(
              "Losing the mnemonic phrase will result in asset loss. We stongly recommend that you back up the mnemonic phrase before using the wallet",
              style: AppFont.reguler12
                  .copyWith(color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
            ),
            height(16),
            PrimaryButton(
                title: "Close",
                onPressed: () {
                  Navigator.pop(context);
                }),
            height(8),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      content: content(),
    );
  }
}
