import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';

import '../../../../../config/config.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../widget/widget.dart';

final seedImportController =
    StateProvider<TextEditingController>((ref) => TextEditingController());

class ImportWallet extends ConsumerWidget {
  const ImportWallet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: WidgetHelper.appBar(context: context, title: "Import Wallet"),
        body: Container(
            width: double.infinity,
            height: ScreenUtil().screenHeight,
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).cardColor),
            child: Column(
              children: [
                InputText(
                  title: "Seed Phrase",
                  hintText: "Type your recovery phrase",
                  color: Theme.of(context).colorScheme.background,
                  controller: ref.watch(seedImportController),
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Iconify(
                          AntDesign.scan,
                          size: 24.w,
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                      8.0.width,
                      GestureDetector(
                        onTap: () {
                          MethodHelper().pasteFromClipboard(
                              ref.watch(seedImportController));
                        },
                        child: Iconify(
                          Mdi.content_paste,
                          size: 24.w,
                          color: Theme.of(context).indicatorColor,
                        ),
                      ),
                      16.0.width,
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
                  style: AppFont.reguler12
                      .copyWith(color: Theme.of(context).hintColor),
                  textAlign: TextAlign.center,
                ),
                16.0.height,
                PrimaryButton(
                  title: "Import",
                  disable: ref.watch(disableImportMnemonicProvider),
                  loading: ref.watch(selectedAccountProvider).isLoading,
                  onPressed: () {
                    if (WalletHelper().validateMnemonic(
                        ref.watch(seedImportController).text)) {
                      ref
                          .read(selectedAccountProvider.notifier)
                          .importByMnemonic(
                              ref.watch(seedImportController).text);
                      context.pop();
                    } else {
                      ref.watch(seedImportController).clear();
                      MethodHelper().showSnack(
                          context: context,
                          content: 'Seed pharse is a invalid',
                          backgorund: AppColor.redColor);
                    }
                  },
                )
              ],
            )));
  }
}
