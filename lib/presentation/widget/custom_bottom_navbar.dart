import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/config.dart';
import '../../data/src/src.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int? selectedIndex;
  final Function(int index)? onTap;
  const CustomBottomNavBar({super.key, this.selectedIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
   
    return Container(
      width: double.infinity,
      height: 72.h,
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: const [
          BoxShadow(spreadRadius: 3, blurRadius: 5, color: Colors.black12)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(0);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppIcon.walletIcon,
                  color: (selectedIndex == 0)
                      ? AppColor.primaryColor
                      : AppColor.grayColor,
                  width: 24.w,
                ),
                4.0.height,
                Text(
                  'Home',
                  style: (selectedIndex == 0)
                      ? AppFont.medium14.copyWith(color: AppColor.primaryColor)
                      : AppFont.reguler14.copyWith(color: AppColor.grayColor),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(1);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppIcon.activityIcon,
                  color: (selectedIndex == 1)
                      ? AppColor.primaryColor
                      : AppColor.grayColor,
                  width: 24.w,
                ),
                4.0.height,
                Text(
                  'Swap',
                  style: (selectedIndex == 1)
                      ? AppFont.medium14.copyWith(color: AppColor.primaryColor)
                      : AppFont.reguler14.copyWith(color: AppColor.grayColor),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(2);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppIcon.dappIcon,
                  color: (selectedIndex == 2)
                      ? AppColor.primaryColor
                      : AppColor.grayColor,
                  width: 24.w,
                ),
                4.0.height,
                Text(
                  'Dapps',
                  style: (selectedIndex == 2)
                      ? AppFont.medium14.copyWith(color: AppColor.primaryColor)
                      : AppFont.reguler14.copyWith(color: AppColor.grayColor),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(3);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppIcon.settingIcon,
                  color: (selectedIndex == 3)
                      ? AppColor.primaryColor
                      : AppColor.grayColor,
                  width: 24.w,
                ),
                4.0.height,
                Text(
                  'Setting',
                  style: (selectedIndex == 3)
                      ? AppFont.medium14.copyWith(color: AppColor.primaryColor)
                      : AppFont.reguler14.copyWith(color: AppColor.grayColor),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
