import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import 'package:iconify_flutter_plus/icons/mdi.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

import '../../../../config/config.dart';
import '../../../../data/src/src.dart';

enum TypeRegister { create, import }

final typeRegisterProvider =
    StateProvider<TypeRegister>((ref) => TypeRegister.create);

class GetStartedScreen extends ConsumerWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            height(80),
            Image.asset(
              AppImage.logo,
              width: 96,
            ),
            height(24),
            Text(
              'Welcome to Crypto Wallet',
              style: AppFont.semibold24
                  .copyWith(color: Theme.of(context).indicatorColor),
              textAlign: TextAlign.center,
            ),
            height(8),
            Text(
              'Please set up your account to explore more features in the crypto wallet.',
              style: AppFont.reguler16
                  .copyWith(color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
            ),
            height(76),
            InkWell(
              onTap: () {
                ref.read(typeRegisterProvider.notifier).state =
                    TypeRegister.create;
                context.goNamed("create_pin_register");
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(
                        width: 48,
                        height: 48,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.surface),
                        child: Iconify(
                          Mdi.wallet_outline,
                          size: 32,
                          color: AppColor.primaryColor,
                        )),
                    width(32),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create New Wallet",
                            style: AppFont.semibold16.copyWith(
                                color: Theme.of(context).indicatorColor),
                          ),
                          height(4),
                          Text(
                            'Start your transaction with BeeWallet',
                            style: AppFont.reguler12
                                .copyWith(color: Theme.of(context).hintColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            height(16),
            InkWell(
              onTap: () {
                ref.read(typeRegisterProvider.notifier).state =
                    TypeRegister.import;
                context.goNamed("create_pin_register");
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(
                        width: 48,
                        height: 48,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.surface),
                        child: Iconify(
                          Mdi.wallet_outline,
                          size: 32,
                          color: AppColor.primaryColor,
                        )),
                    width(16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Import an Existing Wallet",
                            style: AppFont.semibold16.copyWith(
                                color: Theme.of(context).indicatorColor),
                          ),
                          height(4),
                          Text(
                            'Setting your mnemonik phrase to import wallet',
                            style: AppFont.reguler12
                                .copyWith(color: Theme.of(context).hintColor),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
