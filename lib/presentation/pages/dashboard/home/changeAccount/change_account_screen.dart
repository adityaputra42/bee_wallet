import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/presentation/provider/account/account_provider.dart';
import 'package:bee_wallet/presentation/provider/backup/backup_provider.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/account/account.dart';
import '../../../../widget/widget.dart';
import '../add_account/sheet_add_wallet.dart';

class ChangeAccountScreen extends ConsumerWidget {
  const ChangeAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountList = ref.watch(accountListProvider).valueOrNull ?? [];
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "My Wallet",
            style: AppFont.medium16
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          16.0.height,
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: cardAccount(
                    context: context, ref: ref, account: accountList[index]),
              ),
              itemCount: accountList.length,
            ),
          )),
          PrimaryButton(
              title: "Add Wallet",
              onPressed: () {
                Navigator.pop(context);
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const SheetAddWallet(),
                    backgroundColor: Theme.of(context).colorScheme.background,
                    showDragHandle: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.r))));
              })
        ],
      ),
    );
  }

  Widget cardAccount({
    required BuildContext context,
    required WidgetRef ref,
    required Account account,
  }) {
    final selectedAccount = ref.watch(selectedAccountProvider).valueOrNull;
    return GestureDetector(
      onTap: () {
        ref.read(selectedAccountProvider.notifier).changeAccount(account);
        context.pop();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
                width: 1.w,
                color: account.mnemonic == selectedAccount?.mnemonic
                    ? AppColor.primaryColor
                    : Theme.of(context).cardColor),
            color: Theme.of(context).cardColor),
        child: Row(
          children: [
            Container(
              width: 42.w,
              height: 42.w,
              // padding: EdgeInsets.all(3.h),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.w, color: AppColor.primaryColor)),
              child: Center(
                child: Blockies(
                    size: 0.55,
                    data: account.addressETH ?? '-',
                    shape: BlockiesShape.circle),
              ),
            ),
            8.0.width,
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
                    style: AppFont.reguler12.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
            account.backup == true
                ? const SizedBox()
                : GestureDetector(onTap: () {
                  ref.read(accountBackupProvider.notifier).changeAccount(account);
                  ref.watch(accountBackupProvider);
                  context.goNamed('backup_setting');
                },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          gradient: AppColor.primaryGradient),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "No Backup",
                            style: AppFont.medium12
                                .copyWith(color: AppColor.textStrongDark),
                          ),
                          4.0.width,
                          Icon(
                            Icons.error_rounded,
                            size: 16.w,
                            color: AppColor.textStrongDark,
                          ),
                        ],
                      ),
                    ),
                ),
            4.0.width,
            GestureDetector(
              onTap: () {
                ref
                    .read(accountSelectedEditProvider.notifier)
                    .selectEditAccount(account);
                ref.watch(accountSelectedEditProvider);

                context.pop();
                context.goNamed('detail_wallet');
              },
              child: Icon(Icons.more_vert_rounded,
                  size: 24.w, color: AppColor.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
