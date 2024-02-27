import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.height = 48,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    required this.onPressed,
    this.disable = false,
    this.activeColor = AppColor.primaryColor,
    this.disableColor = AppColor.grayColor,
    this.icon,
    this.loading = false,
  });

  final String title;
  final double width;
  final EdgeInsets margin;
  final double height;
  final Function() onPressed;
  final Color activeColor;
  final Color disableColor;
  final bool disable;
  final bool loading;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height.h,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          gradient: disable
              ? AppColor.disableButtonGradient
              : AppColor.primaryButtonGradient),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
        onPressed: disable || loading ? () {} : onPressed,
        child: loading
            ? Padding(
                padding: EdgeInsets.all(8.h),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.textStrongDark,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox(),
                  icon != null ? 8.0.width : 0.0.width,
                  Text(
                    title,
                    style: AppFont.medium14.copyWith(
                        color: disable
                            ? AppColor.textStrongDark
                            : AppColor.textStrongDark),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }
}
