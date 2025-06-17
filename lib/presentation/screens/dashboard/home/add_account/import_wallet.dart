import 'package:bee_wallet/presentation/widget/button_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';

import '../../../../../config/config.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../widget/widget.dart';
import '../../../scan/scann_page.dart';

final seedImportController = StateProvider<TextEditingController>(
  (ref) => TextEditingController(),
);

class ImportWallet extends ConsumerWidget {
  const ImportWallet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Import Wallet"),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: context.h(1),
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              InputText(
                title: "Seed Phrase",
                hintText: "Type your recovery phrase",
                color: Theme.of(context).cardColor,
                controller: ref.watch(seedImportController),
                filled: true,
                filledColor: Theme.of(context).colorScheme.surface,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => ScanPage(
                                  onScan:
                                      (result) =>
                                          ref
                                              .read(
                                                seedImportController.notifier,
                                              )
                                              .state
                                              .text = result,
                                ),
                          ),
                        );
                      },
                      child: Iconify(
                        AntDesign.scan,
                        size: 24,
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                    width(8),
                    GestureDetector(
                      onTap: () {
                        MethodHelper().pasteFromClipboard(
                          ref.watch(seedImportController),
                        );
                      },
                      child: Iconify(
                        Mdi.content_paste,
                        size: 24,
                        color: Theme.of(context).indicatorColor,
                      ),
                    ),
                    width(16),
                  ],
                ),
                onChange: (value) {
                  ref
                      .read(disableImportMnemonicProvider.notifier)
                      .validate(value);
                },
                maxLine: 5,
              ),
              const Spacer(),
              Text(
                "if your seed phrase is not in English, Please convert it to English First",
                style: AppFont.reguler12.copyWith(
                  color: Theme.of(context).hintColor,
                ),
                textAlign: TextAlign.center,
              ),
              height(16),
              ref.watch(selectedAccountProvider).isLoading
                  ? ButtonLoading()
                  : PrimaryButton(
                    title: "Import",
                    disableColor: Theme.of(context).colorScheme.surface,
                    disable: ref.watch(disableImportMnemonicProvider),
                    onPressed: () {
                      if (WalletHelper().validateMnemonic(
                        ref.watch(seedImportController).text,
                      )) {
                        ref
                            .read(selectedAccountProvider.notifier)
                            .importByMnemonic(
                              ref.watch(seedImportController).text,
                            );
                        context.pop();
                      } else {
                        ref.watch(seedImportController).clear();
                        MethodHelper().showSnack(
                          context: context,
                          content: 'Seed pharse is a invalid',
                          backgorund: AppColor.redColor,
                        );
                      }
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
