import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context).cardColor),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(width: 1, color: AppColor.primaryColor)),
                    child: Center(
                      child: Blockies(
                          size: 0.68,
                          data: account?.addressETH ?? '-',
                          shape: BlockiesShape.circle),
                    ),
                  ),
                  width(16),
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
                        height(2),
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
              height(12),
              InkWell(
                onTap: () {
                  if (account?.backup == false) {
                    context.goNamed("backup_setting");
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
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
                        size: 24,
                        color: account?.backup == true
                            ? AppColor.greenColor
                            : AppColor.yellowColor,
                      ),
                      width(8),
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
              height(16),
              SizedBox(
                height: 1,
                child: Divider(
                  thickness: 1,
                  color: Theme.of(context).highlightColor,
                ),
              ),
              height(16),
              cardMenu(
                context,
                title: "Edit Wallet",
                onTap: () {
                  context.goNamed('edit_wallet');
                },
              ),
              height(12),
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
                              BorderRadius.vertical(top: Radius.circular(16))));
                },
              ),
              height(12),
              cardMenu(
                context,
                title: 'Network Setting',
                onTap: () {
                  context.goNamed('network_setting');
                },
              ),
              height(12),
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
                              BorderRadius.vertical(top: Radius.circular(16))));
                },
              ),
              height(12),
              cardMenu(
                context,
                title: 'Fingerprint',
                widget: FlutterSwitch(
                  width: 42,
                  height: 20,
                  toggleColor: Theme.of(context).canvasColor,
                  activeColor: AppColor.primaryColor,
                  inactiveColor: Theme.of(context).cardColor,
                  valueFontSize: 20.0,
                  toggleSize: 16,
                  value: false,
                  borderRadius: 16,
                  padding: 2,
                  showOnOff: false,
                  onToggle: (val) {},
                ),
              ),
              height(12),
              cardMenu(
                context,
                title: 'Dark Mode',
                widget: FlutterSwitch(
                  width: 42,
                  height: 20,
                  toggleColor: isDark
                      ? AppColor.darkText1
                      : Theme.of(context).canvasColor,
                  activeColor: AppColor.primaryColor,
                  inactiveColor: Theme.of(context).cardColor,
                  valueFontSize: 20.0,
                  toggleSize: 16,
                  value: isDark,
                  borderRadius: 16,
                  padding: 2,
                  showOnOff: false,
                  onToggle: (val) {
                    ref.read(darkThemeProvider.notifier).changeTheme(val);
                  },
                ),
              ),
              height(12),
              cardMenu(context, title: 'Suport'),
              height(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
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
              height(16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
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
      ),
    );
  }

  Widget cardMenu(BuildContext context,
      {required String title, Widget? widget, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.surface),
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
                  size: 16,
                ),
          ],
        ),
      ),
    );
  }
}
