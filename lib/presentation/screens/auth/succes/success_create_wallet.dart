import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/data/src/src.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../provider/account/account_provider.dart';

class SuccesCreateAccount extends ConsumerWidget {
  const SuccesCreateAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImage.ilustrasi1,
                  width: 320,
                ),
                height(100),
                Text(
                  "Yeay 🎉",
                  style: AppFont.semibold24
                      .copyWith(color: Theme.of(context).indicatorColor),
                ),
                height(8),
                Text(
                  "successfully created a new wallet",
                  style: AppFont.reguler16
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                height(48),
                PrimaryButton(
                    title: "Back Up Now",
                    onPressed: () {
                      if (account?.mnemonic != null) {
                        context.goNamed('sheed_parse_create');
                      } else {
                        MethodHelper().showSnack(
                            context: context,
                            content: "Error ",
                            backgorund: AppColor.redColor);
                      }
                    }),
                height(16),
                SecondaryButton(
                    title: "Remind Me Later",
                    onPressed: () {
                      context.goNamed('main');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
