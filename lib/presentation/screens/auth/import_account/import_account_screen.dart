import 'package:bee_wallet/presentation/widget/button_loading.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';

import '../../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/config.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget.dart';
import '../../scan/scann_page.dart';

class ImportAccountScreen extends ConsumerWidget {
  const ImportAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
          context: context, title: "Import an Existing Wallet"),
      bottomNavigationBar: ref.watch(importAccountProvider).isLoading
          ? ButtonLoading()
          : PrimaryButton(
              margin: EdgeInsets.fromLTRB(16, 8, 16, 32),
              title: "Import",
              disable: ref.watch(disableImportProvider),
              onPressed: () {
                ref.read(importAccountProvider.notifier).import(context);
              },
            ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(16),
            Text(
              "Import via Seed Phrase",
              style: AppFont.semibold18
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            height(4),
            Text(
              "To import an existing wallet, please enter the recovery seed phrase here:",
              style: AppFont.reguler14
                  .copyWith(color: Theme.of(context).hintColor),
            ),
            height(24),
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
                        size: 36,
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
            height(16),
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
