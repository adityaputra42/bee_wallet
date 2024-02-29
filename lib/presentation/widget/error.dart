import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';
import '../../data/src/src.dart';
import 'primary_button.dart';
class ErrorView extends StatelessWidget {
  const ErrorView({super.key, this.ontap, this.error});
  final Function()? ontap;
  final String? error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppImage.logo,
              width: 144.w,
            ),
            16.0.height,
            Text(
              "Oops...",
              style: AppFont.semibold24
                  .copyWith(color: Theme.of(context).indicatorColor),
              textAlign: TextAlign.center,
            ),
            .0.height,
            Text(
              error != null ? "Error : $error" : "something went wrong",
              style: AppFont.reguler14
                  .copyWith(color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
            ),
            24.0.height,
            PrimaryButton(
              title: "Retry",
              height: 42,
              onPressed: ontap ?? () {},
              margin: EdgeInsets.symmetric(horizontal: 64.w),
            )
          ],
        ),
      ),
    );
  }
}
