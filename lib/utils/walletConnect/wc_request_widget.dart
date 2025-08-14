import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reown_walletkit/reown_walletkit.dart';

import '../../presentation/widget/widget.dart';
import 'i_bottom_sheet_service.dart';
import 'verify_widget.dart';

class WCRequestWidget extends StatelessWidget {
  const WCRequestWidget({
    super.key,
    required this.child,
    this.verifyContext,
    this.onAccept,
    this.onReject,
  });

  final Widget child;
  final VerifyContext? verifyContext;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        VerifyContextWidget(
          verifyContext: verifyContext,
        ),
        height(16),
        child,
        height(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SecondaryButton(
                onPressed: onReject ??
                    () => Navigator.of(context).pop(WCBottomSheetResult.reject),
                title: "Reject",
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: PrimaryButton(
                onPressed: onAccept ??
                    () => Navigator.of(context).pop(WCBottomSheetResult.one),
                title: "Approve",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
