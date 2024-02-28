import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/config.dart';
import '../../../../../../data/src/src.dart';
import '../../../../../widget/widget.dart';

class SheetSuccesBackup extends ConsumerWidget {
  const SheetSuccesBackup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Wallet has been successfully backup.",
            style: AppFont.semibold16
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          24.0.height,
          Image.asset(
            AppImage.logo,
            width: 320.w,
          ),
          24.0.height,
          Text(
            "Amet minim mollit non deserunt ullamco est sit aliqua\ndolor do amet sint.",
            style:
                AppFont.reguler12.copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.center,
          ),
          24.0.height,
          PrimaryButton(
              title: "Start Using Wallet",
              onPressed: () {
                Navigator.pop(context);
                context.goNamed('main');
              })
        ],
      ),
    );
  }
}
