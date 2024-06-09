import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../provider/account/account_provider.dart';
import 'sheet_edit_wallet.dart';

class DetailAccount extends ConsumerWidget {
  const DetailAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountSelectedEditProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Wallet Details"),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Balance",
                    style: AppFont.medium12
                        .copyWith(color: Theme.of(context).hintColor),
                  ),
                  4.0.height,
                  Text(
                    "\$${0.toStringAsFixed(2)}",
                    style: AppFont.semibold30.copyWith(
                        color: Theme.of(context).indicatorColor, fontSize: 32),
                  ),
                  4.0.height,
                  Text(
                    "\$${0.toStringAsFixed(2)} (+0.000%) Today",
                    style:
                        AppFont.medium12.copyWith(color: AppColor.greenColor),
                  )
                ],
              ),
            ),
            16.0.height,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36.w,
                        height: 36.w,
                        // padding: EdgeInsets.all(3.h),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1.w, color: AppColor.primaryColor)),
                        child: Center(
                          child: Blockies(
                              size: 0.45,
                              data: account.addressETH ?? '-',
                              shape: BlockiesShape.circle),
                        ),
                      ),
                      12.0.width,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              account.name ?? '',
                              style: AppFont.semibold14.copyWith(
                                color: Theme.of(context).indicatorColor,
                              ),
                            ),
                            2.0.height,
                            Text(
                              'EVM : ${MethodHelper().shortAddress(address: account.addressETH ?? '', length: 8)}',
                              style: AppFont.reguler10.copyWith(
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const SheetEditWallet(),
                              backgroundColor:
                                  Theme.of(context).colorScheme.surface,
                              isScrollControlled: true,
                              showDragHandle: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16.r))));
                        },
                        child: Icon(
                          Icons.edit_document,
                          size: 24.w,
                          color: Theme.of(context).hintColor,
                        ),
                      )
                    ],
                  ),
                  16.0.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Backup Status",
                        style: AppFont.medium12.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            gradient: AppColor.primaryGradient),
                        child: Text(
                          account.backup == true ? "Backed up" : 'No Backup',
                          style: AppFont.reguler12
                              .copyWith(color: AppColor.textStrongDark),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
