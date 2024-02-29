import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/config.dart';
import '../../../../utils/util.dart';
import '../../../provider/account/account_provider.dart';
import '../../../provider/theme/theme_provider.dart';
import '../../../widget/widget.dart';
import 'changePin/sheet_password_change_pin.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
          context: context, title: "Setting", isCanBack: false),
      body: Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).cardColor),
        child: ListView(
          children: [
            account?.backup == true ? const SizedBox() : warningBackUp(context),
            cardSettingSecurity(context, ref),
            16.0.height,
            cardSettingUmum(context, ref),
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

  Container cardSettingUmum(BuildContext context, WidgetRef ref) {
    var isDark = ref.watch(darkThemeProvider);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).colorScheme.background),
      child: Column(
        children: [
          cardMenu(
            context,
            title: "Change Pin",
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const SheetPasswordChangePin(),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  isScrollControlled: true,
                  showDragHandle: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r))));
            },
          ),
          SizedBox(
            width: double.infinity,
            height: 1.w,
            child: Divider(
              thickness: 1.w,
              color: AppColor.grayColor.withOpacity(0.3),
            ),
          ),
          cardMenu(
            context,
            title: 'Fingerprint',
            widget: FlutterSwitch(
              width: 42.w,
              height: 20.h,
              toggleColor: Theme.of(context).hintColor,
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
          SizedBox(
            width: double.infinity,
            height: 1.w,
            child: Divider(
              thickness: 1.w,
              color: AppColor.grayColor.withOpacity(0.3),
            ),
          ),
          cardMenu(
            context,
            title: 'Dark Mode',
            widget: FlutterSwitch(
              width: 42.w,
              height: 20.h,
              toggleColor: Theme.of(context).hintColor,
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
          SizedBox(
            width: double.infinity,
            height: 1.w,
            child: Divider(
              thickness: 1.w,
              color: AppColor.grayColor.withOpacity(0.3),
            ),
          ),
          cardMenu(context, title: 'Suport')
        ],
      ),
    );
  }

  Container cardSettingSecurity(BuildContext context, WidgetRef ref) {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).colorScheme.background),
      child: Column(
        children: [
          cardMenu(context,
              title: "Backup this Wallet",
              widget: account?.backup == true
                  ? Row(
                      children: [
                        Text(
                          "Backuped",
                          style: AppFont.reguler10
                              .copyWith(color: AppColor.primaryColor),
                        ),
                        8.0.width,
                        Container(
                          width: 20.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                              gradient: AppColor.primaryGradient,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(2.r))),
                        ),
                        2.0.width,
                        Container(
                          width: 20.w,
                          height: 4.h,
                          decoration: const BoxDecoration(
                            gradient: AppColor.primaryGradient,
                          ),
                        ),
                        2.0.width,
                        Container(
                          width: 20.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                              gradient: AppColor.primaryGradient,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(2.r))),
                        ),
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        context.goNamed('backup_setting');
                      },
                      child: Row(
                        children: [
                          Text(
                            "Backup Now",
                            style: AppFont.reguler10
                                .copyWith(color: AppColor.primaryColor),
                          ),
                          8.0.width,
                          Container(
                            width: 20.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                                gradient: AppColor.primaryGradient,
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(2.r))),
                          ),
                          2.0.width,
                          Container(
                            width: 20.w,
                            height: 4.h,
                            decoration:
                                const BoxDecoration(color: AppColor.grayColor
                                    // gradient: AppColor.primaryGradient,
                                    ),
                          ),
                          2.0.width,
                          Container(
                            width: 20.w,
                            height: 4.h,
                            decoration: BoxDecoration(
                                color: AppColor.grayColor,
                                borderRadius: BorderRadius.horizontal(
                                    right: Radius.circular(2.r))),
                          ),
                          8.0.width,
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Theme.of(context).hintColor,
                            size: 16.w,
                          )
                        ],
                      ),
                    )),
          SizedBox(
            width: double.infinity,
            height: 1.w,
            child: Divider(
              thickness: 1.w,
              color: AppColor.grayColor.withOpacity(0.3),
            ),
          ),
          cardMenu(
            context,
            title: 'Show Seed Phrase',
            onTap: () {
              context.goNamed('show_parse');
            },
          ),
          SizedBox(
            width: double.infinity,
            height: 1.w,
            child: Divider(
              thickness: 1.w,
              color: AppColor.grayColor.withOpacity(0.3),
            ),
          ),
          cardMenu(context, title: 'Wallet Connect'),
        ],
      ),
    );
  }

  Padding cardMenu(BuildContext context,
      {required String title, Widget? widget, Function()? onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
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

  Container warningBackUp(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColor.yellowColor.withOpacity(0.2)),
      child: Column(
        children: [
          Icon(
            Icons.error_rounded,
            color: AppColor.yellowColor,
            size: 32.w,
          ),
          8.0.height,
          Text(
            'Your Wallet is not backed up!',
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          4.0.height,
          Text(
            'Remeber to backup your wallet by a secure seed phrase.',
            style:
                AppFont.reguler12.copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.center,
          ),
          16.0.height,
          PrimaryButton(
              title: "Backup Wallet",
              onPressed: () {
                context.goNamed('backup_setting');
              })
        ],
      ),
    );
  }
}
