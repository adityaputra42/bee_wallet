import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../../utils/util.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget.dart';

class CreateWalletName extends ConsumerWidget {
  const CreateWalletName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(context: context, title: "Create New Wallet"),
      bottomNavigationBar: PrimaryButton(
          title: 'Continue',
          disable: ref.watch(disableCreateWalletProvider),
          loading: ref.watch(loadingCreateAccountProvider),
          onPressed: () async {
            await ref.read(generateMnemonicProvider.notifier).generateAccount();
            ref.watch(generateMnemonicProvider);
           
          },
          margin: EdgeInsets.fromLTRB(24.w, 8.h, 24.w, 32.h)),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create new account',
              style: AppFont.medium14
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            4.0.height,
            Text(
              "Please Insert your account name to generate your account mnemonic",
              style: AppFont.reguler14
                  .copyWith(color: Theme.of(context).hintColor),
            ),
            24.0.height,
            InputText(
              title: "Account Name",
              hintText: 'Enter your name account',
              controller: ref.watch(nameWalletProvider),
              onChange: (v) =>
                  ref.read(nameWalletProvider.notifier).onChangeName(v, ref),
            ),
          ],
        ),
      ),
    );
  }
}
