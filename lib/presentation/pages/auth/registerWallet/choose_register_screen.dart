import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/config.dart';
import '../../../../data/src/src.dart';

class ChooseRegisterScreen extends StatelessWidget {
  const ChooseRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [
            73.0.height,
            Image.asset(
              AppImage.logo,
              width: 115.w,
            ),
            16.0.height,
            Text(
              'Add a Wallet to Start Your Crypto\nJourney',
              style: AppFont.reguler16
                  .copyWith(color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
            ),
            16.0.height,
            GestureDetector(
              onTap: () {
                context.goNamed('create_wallet');
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
                      width: 32.w,
                      height: 32.w,
                      padding: EdgeInsets.all(8.r),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColor.primaryGradient),
                      child: Image.asset(
                        AppIcon.walletIcon,
                        width: 16.w,
                        color: AppColor.textStrongDark,
                      ),
                    ),
                    16.0.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Create Wallet",
                            style: AppFont.medium14
                                .copyWith(color: AppColor.primaryColor),
                          ),
                          4.0.height,
                          Text(
                            'Start your transaction with PetaWallet',
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
                context.goNamed('import_account');
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
                      width: 32.w,
                      height: 32.w,
                      padding: EdgeInsets.all(8.r),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppColor.primaryGradient),
                      child: Image.asset(
                        AppIcon.walletIcon,
                        width: 16.w,
                        color: AppColor.textStrongDark,
                      ),
                    ),
                    16.0.width,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "I already have Wallet",
                            style: AppFont.medium14
                                .copyWith(color: AppColor.primaryColor),
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
