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
      margin: EdgeInsets.fromLTRB(16.w, 0.w, 16.w, 16.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              spreadRadius: 0.5,
              blurRadius: 0.3,
              color: Theme.of(context).indicatorColor.withOpacity(0.15))
        ],
        borderRadius: BorderRadius.circular(8.r),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(0);
                }
              },
              child: SizedBox(
                height: 48.h,
                width: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Iconify(
                        Mdi.wallet_outline,
                        color: (selectedIndex == 0)
                            ? AppColor.primaryColor
                            : Theme.of(context).hintColor,
                        size: 24.w,
                      ),
                      2.0.height,
                      Text(
                        "Home",
                        style: AppFont.medium12.copyWith(
                            color: (selectedIndex == 0)
                                ? AppColor.primaryColor
                                : Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(1);
                }
              },
              child: SizedBox(
                height: 48.h,
                width: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Iconify(
                        Ph.swap_bold,
                        color: (selectedIndex == 1)
                            ? AppColor.primaryColor
                            : Theme.of(context).hintColor,
                        size: 24.w,
                      ),
                      2.0.height,
                      Text(
                        "Swap",
                        style: AppFont.medium12.copyWith(
                            color: (selectedIndex == 1)
                                ? AppColor.primaryColor
                                : Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(2);
                }
              },
              child: SizedBox(
                height: 48.h,
                width: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Iconify(
                        MaterialSymbols.widgets_outline_rounded,
                        color: (selectedIndex == 2)
                            ? AppColor.primaryColor
                            : Theme.of(context).hintColor,
                        size: 24.w,
                      ),
                      2.0.height,
                      Text(
                        "D'App",
                        style: AppFont.medium12.copyWith(
                            color: (selectedIndex == 2)
                                ? AppColor.primaryColor
                                : Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (onTap != null) {
                  onTap!(3);
                }
              },
              child: SizedBox(
                height: 48.h,
                width: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        color: (selectedIndex == 3)
                            ? AppColor.primaryColor
                            : Theme.of(context).hintColor,
                        size: 24.w,
                      ),
                      2.0.height,
                      Text(
                        "Settings",
                        style: AppFont.medium12.copyWith(
                            color: (selectedIndex == 3)
                                ? AppColor.primaryColor
                                : Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
