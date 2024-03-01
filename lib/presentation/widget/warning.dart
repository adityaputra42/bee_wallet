import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class Warning extends StatelessWidget {
  const Warning({super.key, required this.warning, this.color});
  final String warning;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border.all(width: 1.w, color: color ?? AppColor.yellowColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline_rounded,
              size: 28.h, color: color ?? AppColor.yellowColor),
          12.0.width,
          Expanded(
            child: Text(
              warning,
              style: AppFont.medium14
                  .copyWith(color: color ?? AppColor.yellowColor),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
