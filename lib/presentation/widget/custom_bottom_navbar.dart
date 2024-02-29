import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';
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
        color: Theme.of(context).colorScheme.background,
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
            child: Iconify(
              Mdi.wallet_outline,
              color: (selectedIndex == 0)
                  ? AppColor.primaryColor
                  : AppColor.grayColor,
              size: 32.w,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(1);
              }
            },
            child: Iconify(
              AntDesign.swap_outlined,
              color: (selectedIndex == 1)
                  ? AppColor.primaryColor
                  : AppColor.grayColor,
              size: 32.w,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(2);
              }
            },
            child: Icon(
              Icons.widgets_outlined,
              color: (selectedIndex == 2)
                  ? AppColor.primaryColor
                  : AppColor.grayColor,
              size: 32.w,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap!(3);
              }
            },
            child: Icon(
              Icons.settings_outlined,
              color: (selectedIndex == 3)
                  ? AppColor.primaryColor
                  : AppColor.grayColor,
              size: 32.w,
            ),
          ),
        ],
      ),
    );
  }
}
