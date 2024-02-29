import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          children: [
            80.0.height,
            Image.asset(
              AppImage.logo,
              width: 96.w,
            ),
            24.0.height,
            Text(
              'Welcome to Crypto Wallet',
              style: AppFont.semibold24
                  .copyWith(color: Theme.of(context).indicatorColor),
              textAlign: TextAlign.center,
            ),
            8.0.height,
            Text(
              'Please set up your account to explore more features in the crypto wallet.',
              style: AppFont.reguler16
                  .copyWith(color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
            ),
            76.0.height,
            GestureDetector(
              onTap: () {
                ref.read(typeRegisterProvider.notifier).state =
                    TypeRegister.create;
                context.goNamed("create_pin_register");
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  children: [
                    Container(
                        width: 48.w,
                        height: 48.w,
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Theme.of(context).colorScheme.background),
                        child: Iconify(
                          Mdi.wallet_outline,
                          size: 32.w,
                          color: AppColor.primaryColor,
                        )),
                    16.0.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create New Wallet",
                            style: AppFont.semibold16.copyWith(
                                color: Theme.of(context).indicatorColor),
                          ),
                          4.0.height,
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
            16.0.height,
            GestureDetector(
              onTap: () {
                ref.read(typeRegisterProvider.notifier).state =
                    TypeRegister.import;
                context.goNamed("create_pin_register");
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  children: [
                    Container(
                        width: 48.w,
                        height: 48.w,
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Theme.of(context).colorScheme.background),
                        child: Iconify(
                          Mdi.wallet_outline,
                          size: 32.w,
                          color: AppColor.primaryColor,
                        )),
                    16.0.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Import an Existing Wallet",
                            style: AppFont.semibold16.copyWith(
                                color: Theme.of(context).indicatorColor),
                          ),
                          4.0.height,
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
