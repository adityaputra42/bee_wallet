import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ph.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';
import '../../config/config.dart';

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
        horizontal: 36.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
        color: Theme.of(context).cardColor,
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
                Iconify(
                  Mdi.wallet_outline,
                  color: (selectedIndex == 0)
                      ? AppColor.primaryColor
                      : AppColor.grayColor,
                  size: 24.w,
                ),
                4.0.height,
                Text(
                  'Wallet',
                  style: AppFont.medium14.copyWith(
                    color: (selectedIndex == 0)
                        ? AppColor.primaryColor
                        : AppColor.grayColor,
                  ),
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
                Iconify(
                  Ph.swap_bold,
                  color: (selectedIndex == 1)
                      ? AppColor.primaryColor
                      : AppColor.grayColor,
                  size: 24.w,
                ),
                4.0.height,
                Text(
                  'Swap',
                  style: AppFont.medium14.copyWith(
                    color: (selectedIndex == 1)
                        ? AppColor.primaryColor
                        : AppColor.grayColor,
                  ),
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
                Iconify(
                  MaterialSymbols.widgets_outline_rounded,
                  color: (selectedIndex == 2)
                      ? AppColor.primaryColor
                      : AppColor.grayColor,
                  size: 24.w,
                ),
                4.0.height,
                Text(
                  "D'App",
                  style: AppFont.medium14.copyWith(
                    color: (selectedIndex == 2)
                        ? AppColor.primaryColor
                        : AppColor.grayColor,
                  ),
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
                Icon(
                  Icons.settings_outlined,
                  color: (selectedIndex == 3)
                      ? AppColor.primaryColor
                      : AppColor.grayColor,
                  size: 24.w,
                ),
                4.0.height,
                Text(
                  'Setting',
                  style: AppFont.medium14.copyWith(
                    color: (selectedIndex == 3)
                        ? AppColor.primaryColor
                        : AppColor.grayColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
