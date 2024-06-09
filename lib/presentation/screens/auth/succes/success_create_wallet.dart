import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/data/src/src.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImage.ilustrasi1,
                  width: 320.w,
                ),
                100.0.height,
                Text(
                  "Yeay 🎉",
                  style: AppFont.semibold24
                      .copyWith(color: Theme.of(context).indicatorColor),
                ),
                8.0.height,
                Text(
                  "successfully created a new wallet",
                  style: AppFont.reguler16
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                48.0.height,
                PrimaryButton(
                    title: "Back Up Now",
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
                    }),
                16.0.height,
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
