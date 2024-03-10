import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';

import '../../../../../config/config.dart';
import '../../../../widget/widget.dart';
import 'sheet_password_add_wallet.dart';

class SheetAddWallet extends ConsumerWidget {
  const SheetAddWallet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, 24.h),
      child: Column(
        children: [
          Text(
            "Add Wallet",
            style: AppFont.medium16
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          16.0.height,
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const SheetPasswordAddWallet(
                        typeAddWallet: TypeAddWallet.createNew,
                      ),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  showDragHandle: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r))));
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                children: [
                  Container(
                    width: 42.w,
                    height: 42.w,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Theme.of(context).colorScheme.background),
                    child: Iconify(
                      Mdi.wallet_outline,
                      color: AppColor.primaryColor,
                      size: 28.w,
                    ),
                  ),
                  16.0.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create New Wallet",
                          style: AppFont.semibold14
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
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const SheetPasswordAddWallet(
                        typeAddWallet: TypeAddWallet.import,
                      ),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  showDragHandle: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.r))));
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Row(
                children: [
                   Container(
                    width: 42.w,
                    height: 42.w,
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Theme.of(context).colorScheme.background),
                    child: Iconify(
                      Mdi.wallet_outline,
                      color: AppColor.primaryColor,
                      size: 28.w,
                    ),
                  ),
                  16.0.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Import Wallet",
                          style: AppFont.semibold14
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
          const Spacer(),
          SecondaryButton(
              title: "Cancel",
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
