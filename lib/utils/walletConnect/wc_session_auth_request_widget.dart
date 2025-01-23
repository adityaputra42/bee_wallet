import 'package:flutter/material.dart';

import '../../presentation/widget/widget.dart';
import 'i_bottom_sheet_service.dart';

class WCSessionAuthRequestWidget extends StatelessWidget {
  const WCSessionAuthRequestWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: child,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PrimaryButton(
                onPressed: () =>
                    Navigator.of(context).pop(WCBottomSheetResult.reject),
                title: 'Cancel',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: PrimaryButton(
                onPressed: () =>
                    Navigator.of(context).pop(WCBottomSheetResult.one),
                title: 'Sign One',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: PrimaryButton(
                onPressed: () =>
                    Navigator.of(context).pop(WCBottomSheetResult.all),
                title: 'Sign All',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
