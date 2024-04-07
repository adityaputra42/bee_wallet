import 'package:bee_wallet/presentation/screens/dashboard/scan/scann_page.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';

import '../../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget.dart';

class ImportAccountScreen extends ConsumerWidget {
  const ImportAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
          context: context, title: "Import an Existing Wallet"),
      bottomNavigationBar: PrimaryButton(
        margin: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 32.h),
        title: "Import",
        loading: ref.watch(loadingImportProvider),
        disable: ref.watch(disableImportProvider),
        onPressed: () {
          ref.read(loadingImportProvider.notifier).changeLoading(true);
          if (WalletHelper()
              .validateMnemonic(ref.watch(pharseControllerProvider).text)) {
            ref.read(importAccountProvider.notifier).import(context);
          } else {
            MethodHelper().showSnack(
                context: context,
                content: 'Seed Pharse is a invalid',
                backgorund: AppColor.redColor);
          }
          ref.read(loadingImportProvider.notifier).changeLoading(false);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.0.height,
            Text(
              "Import via Seed Phrase",
              style: AppFont.semibold18
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            4.0.height,
            Text(
              "To import an existing wallet, please enter the recovery seed phrase here:",
              style: AppFont.reguler14
                  .copyWith(color: Theme.of(context).hintColor),
            ),
            24.0.height,
            InputText(
              title: "Secret Pharse",
              icon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScanPage(
                                    onScan: (result) => ref
                                        .read(pharseControllerProvider.notifier)
                                        .setValue(result))));
                      },
                      child: Iconify(
                        AntDesign.scan,
                        size: 36.w,
                        color: AppColor.primaryColor,
                      )),
                ],
              ),
              hintText: "Type your recovery phrase",
              controller: ref.watch(pharseControllerProvider),
              onChange: (v) {
                ref.read(disableImportProvider.notifier).validateButton();
              },
              maxLine: 5,
            ),
            16.0.height,
            InputText(
              hintText: "Enter your name account",
              title: "Account Name",
              controller: ref.watch(accountNameControllerProvider),
              onChange: (v) {
                ref.read(disableImportProvider.notifier).validateButton();
              },
            )
          ],
        ),
      ),
    );
  }
}
