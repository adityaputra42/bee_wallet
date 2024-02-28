import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/provider.dart';
import '../../../../widget/widget.dart';

class CreateWalletName extends ConsumerWidget {
  const CreateWalletName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(context: context, title: ""),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Setting your new wallet name',
              style: AppFont.medium14
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            4.0.height,
            Text(
              "Set a name for your wallet with 1 - 20 characters.",
              style: AppFont.reguler14
                  .copyWith(color: Theme.of(context).hintColor),
            ),
            24.0.height,
            InputText(
              hintText: 'Enter wallet name',
              controller: ref.watch(nameWalletProvider),
              onChange: (v) =>
                  ref.read(nameWalletProvider.notifier).onChangeName(v, ref),
            ),
            PrimaryButton(
              title: 'Continue',
              disable: ref.watch(disableCreateWalletProvider),
              loading: ref.watch(loadingCreateAccountProvider),
              onPressed: () async {
                await ref
                    .read(generateMnemonicProvider.notifier)
                    .generateAccount();
                ref.watch(generateMnemonicProvider);
                ref.watch(appRouteProvider).goNamed('backup_create');
              },
              margin: EdgeInsets.only(top: 16.h, bottom: 16.w),
            ),
          ],
        ),
      ),
    );
  }
}
