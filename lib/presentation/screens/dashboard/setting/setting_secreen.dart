import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/config.dart';
import '../../../../utils/util.dart';
import '../../../provider/account/account_provider.dart';
import '../../../provider/theme/theme_provider.dart';
import 'changePin/sheet_password_change_pin.dart';
import 'show_pharse/sheet_password_show.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    var isDark = ref.watch(darkThemeProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
          context: context, title: "Setting", isCanBack: false),
      body: Container(
        margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Theme.of(context).cardColor),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(width: 1.w, color: AppColor.primaryColor)),
                  child: Center(
                    child: Blockies(
                        size: 0.6,
                        data: account?.addressETH ?? '-',
                        shape: BlockiesShape.circle),
                  ),
                ),
                16.0.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        account?.name ?? '',
                        style: AppFont.semibold18.copyWith(
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                      2.0.height,
                      Text(
                        'EVM : ${MethodHelper().shortAddress(address: account?.addressETH ?? '', length: 5)}',
                        style: AppFont.reguler14.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            16.0.height,
            GestureDetector(
              onTap: () {
                if (account?.backup == false) {
                  context.goNamed("backup_setting");
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    width: 1.w,
                    color: account?.backup == true
                        ? AppColor.greenColor
                        : AppColor.yellowColor,
                  ),
                  // color: account?.backup == true
                  //     ? AppColor.greenColor
                  //     : AppColor.yellowColor,
                ),
                child: Row(
                  children: [
                    Icon(
                      account?.backup == true
                          ? Icons.check_circle_outline_rounded
                          : Icons.error_outline_outlined,
                      size: 24.w,
                      color: account?.backup == true
                          ? AppColor.greenColor
                          : AppColor.yellowColor,
                    ),
                    8.0.width,
                    Expanded(
                      child: Text(
                        account?.backup == true
                            ? "Your account has been backed up"
                            : "Please backup your sheed pharse, to secure your account.",
                        style: AppFont.reguler12.copyWith(
                          color: account?.backup == true
                              ? AppColor.greenColor
                              : AppColor.yellowColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            24.0.height,
            SizedBox(
              height: 1.w,
              child: Divider(
                thickness: 1.w,
                color: Theme.of(context).hintColor,
              ),
            ),
            16.0.height,
            cardMenu(
              context,
              title: "Edit Wallet",
              onTap: () {
               
              },
            ),
            12.0.height,
            cardMenu(
              context,
              title: 'Show Seed Phrase',
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const SheetPasswordShow(),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    isScrollControlled: true,
                    showDragHandle: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.r))));
              },
            ),
            12.0.height,
            cardMenu(context, title: 'Wallet Connect'),
            12.0.height,
            cardMenu(
              context,
              title: "Change Pin",
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const SheetPasswordChangePin(),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    isScrollControlled: true,
                    showDragHandle: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.r))));
              },
            ),
            12.0.height,
            cardMenu(
              context,
              title: 'Fingerprint',
              widget: FlutterSwitch(
                width: 42.w,
                height: 20.h,
                toggleColor: Theme.of(context).canvasColor,
                activeColor: AppColor.primaryColor,
                inactiveColor: Theme.of(context).cardColor,
                valueFontSize: 20.0,
                toggleSize: 16.h,
                value: false,
                borderRadius: 16,
                padding: 2.h,
                showOnOff: false,
                onToggle: (val) {},
              ),
            ),
            12.0.height,
            cardMenu(
              context,
              title: 'Dark Mode',
              widget: FlutterSwitch(
                width: 42.w,
                height: 20.h,
                toggleColor: isDark
                    ? AppColor.textStrongDark
                    : Theme.of(context).canvasColor,
                activeColor: AppColor.primaryColor,
                inactiveColor: Theme.of(context).cardColor,
                valueFontSize: 20.0,
                toggleSize: 16.h,
                value: isDark,
                borderRadius: 16,
                padding: 2.h,
                showOnOff: false,
                onToggle: (val) {
                  ref.read(darkThemeProvider.notifier).changeTheme(val);
                },
              ),
            ),
            12.0.height,
            cardMenu(context, title: 'Suport'),
            16.0.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Version",
                    style: AppFont.medium12
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
                  Text(
                    "v1.0.0",
                    style: AppFont.medium12
                        .copyWith(color: Theme.of(context).hintColor),
                  )
                ],
              ),
            ),
            16.0.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TokenScriptCompability",
                    style: AppFont.medium12
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
                  Text(
                    "2023/12",
                    style: AppFont.medium12
                        .copyWith(color: Theme.of(context).hintColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget cardMenu(BuildContext context,
      {required String title, Widget? widget, Function()? onTap}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Theme.of(context).colorScheme.surface),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style:
                  AppFont.medium12.copyWith(color: Theme.of(context).hintColor),
            ),
            widget ??
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).hintColor,
                  size: 16.w,
                ),
          ],
        ),
      ),
    );
  }
}
