import 'package:bee_wallet/presentation/widget/button_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/config.dart';
import '../../../../utils/util.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget.dart';

class CreateWalletName extends ConsumerWidget {
  const CreateWalletName({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Create New Wallet"),
      bottomNavigationBar: ref.watch(generateMnemonicProvider).isLoading
          ? ButtonLoading()
          : PrimaryButton(
              title: 'Continue',
              disable: ref.watch(disableCreateWalletProvider),
              onPressed: () async {
                await ref
                    .read(generateMnemonicProvider.notifier)
                    .generateAccount();
                ref.watch(generateMnemonicProvider);
              },
              margin: EdgeInsets.fromLTRB(16, 8, 16, 32)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create new account',
              style: AppFont.medium14
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            height(4),
            Text(
              "Please Insert your account name to generate your account mnemonic",
              style: AppFont.reguler14
                  .copyWith(color: Theme.of(context).hintColor),
            ),
            height(24),
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
