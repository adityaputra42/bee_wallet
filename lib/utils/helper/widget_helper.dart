import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../config/config.dart';

class WidgetHelper {
  static appBar(
      {required BuildContext context,
      Function()? onTap,
      Function()? onTapTitle,
      required String title,
      Widget? icon,
      Widget? iconTitle,
      Color? color,
      double? fontSize,
      bool isCanBack = true}) {
    return AppBar(
      elevation: 0,
      // shadowColor: AppColor.grayColor,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            isCanBack
                ? GestureDetector(
                    onTap: onTap ??
                        () {
                          context.pop();
                        },
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      padding: EdgeInsets.all(8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                              width: 1.w, color: AppColor.grayColor)),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColor.primaryColor,
                        size: 20.w,
                      ),
                    ))
                : 40.0.width,
            16.0.width,
            Expanded(
              child: GestureDetector(
                onTap: onTapTitle ?? () {},
                child: iconTitle != null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: AppFont.medium16.copyWith(
                                color: Theme.of(context).indicatorColor,
                                fontSize: fontSize ?? 16),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                          iconTitle
                        ],
                      )
                    : Text(
                        title,
                        style: AppFont.medium16.copyWith(
                            color: Theme.of(context).indicatorColor,
                            fontSize: fontSize ?? 16),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
            ),
            16.0.width,
            icon ?? 40.0.width,
          ],
        ),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: color ?? Theme.of(context).colorScheme.background,
      toolbarHeight: 60.h,
    );
  }
}
