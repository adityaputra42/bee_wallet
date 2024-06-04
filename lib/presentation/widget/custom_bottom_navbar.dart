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
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Theme.of(context).indicatorColor,
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
                            : AppColor.grayColor,
                        size: 24.w,
                      ),
                      (selectedIndex == 0)
                          ? Container(
                              margin: EdgeInsets.only(top: 1.h),
                              width: 6.w,
                              height: 6.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primaryColor),
                            )
                          : const SizedBox()
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
                            : AppColor.grayColor,
                        size: 24.w,
                      ),
                      (selectedIndex == 1)
                          ? Container(
                              margin: EdgeInsets.only(top: 1.h),
                              width: 6.w,
                              height: 6.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primaryColor),
                            )
                          : const SizedBox()
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
                            : AppColor.grayColor,
                        size: 24.w,
                      ),
                      (selectedIndex == 2)
                          ? Container(
                              margin: EdgeInsets.only(top: 1.h),
                              width: 6.w,
                              height: 6.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primaryColor),
                            )
                          : const SizedBox()
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
                            : AppColor.grayColor,
                        size: 24.w,
                      ),
                      (selectedIndex == 3)
                          ? Container(
                              margin: EdgeInsets.only(top: 1.h),
                              width: 6.w,
                              height: 6.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primaryColor),
                            )
                          : const SizedBox()
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
