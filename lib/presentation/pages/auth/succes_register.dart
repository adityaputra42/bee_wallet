import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../config/config.dart';
import '../../../data/src/src.dart';
import '../../widget/widget.dart';

class SuccesRegister extends StatelessWidget {
  const SuccesRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            children: [
              55.0.height,
              Image.asset(
                AppImage.ilustrasi1,
                width: 320.w,
              ),
              16.0.height,
              Text(
                "Congratulations!",
                style:
                    AppFont.semibold24.copyWith(color: AppColor.primaryColor),
              ),
              Text(
                "You've ready to start transaction with Petawallet",
                style: AppFont.reguler14
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              const Spacer(),
              PrimaryButton(
                  title: "Start Transaction",
                  onPressed: () {
                    context.goNamed('choose_register');
                  })
            ],
          ),
        )),
      ),
    );
  }
}
