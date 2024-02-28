import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/config.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../widget/widget.dart';

class BackupScreen extends ConsumerWidget {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    return Scaffold(
      appBar: WidgetHelper.appBar(
          context: context,
          isCanBack: false,
          title: "Backup",
          icon: GestureDetector(
            onTap: () {
              context.goNamed('main');
            },
            child: Text(
              "Skip",
              style: AppFont.medium14.copyWith(color: AppColor.primaryColor),
            ),
          )),
      body: Padding(
        padding: EdgeInsetsDirectional.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.0.height,
            Text(
              'Backup Mnemonic Phrase',
              style: AppFont.medium14
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            4.0.height,
            Text(
              'The mnemonuc ohrase is the master key to your wallet. It can be used to recober your wallet on any compatible device',
              style: AppFont.reguler12
                  .copyWith(color: Theme.of(context).hintColor),
            )
          ],
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        title: 'Backup Manually',
        onPressed: () {
          if (account?.mnemonic != null) {
            // ref
            //     .read(parseMnemonicProvider.notifier)
            //     .addPharse(account?.mnemonic ?? '');
            // ref.watch(parseMnemonicProvider);
            context.goNamed('sheed_parse_create');
          } else {
            MethodHelper().showSnack(
                context: context,
                content: "Error ",
                backgorund: AppColor.redColor);
          }
        },
        margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 36.h),
      ),
    );
  }
}
