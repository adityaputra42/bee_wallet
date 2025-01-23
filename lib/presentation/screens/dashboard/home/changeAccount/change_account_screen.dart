import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/presentation/provider/account/account_provider.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/account/account.dart';
import '../../../../provider/backup/backup_provider.dart';
import '../../../../widget/widget.dart';
import '../add_account/sheet_add_wallet.dart';

class ChangeAccountScreen extends ConsumerWidget {
  const ChangeAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountList = ref.watch(accountListProvider).valueOrNull ?? [];
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "My Account",
              style: AppFont.medium16
                  .copyWith(color: Theme.of(context).indicatorColor),
              textAlign: TextAlign.center,
            ),
            height(16),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(bottom: 16),
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
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      showDragHandle: true,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16))));
                })
          ],
        ),
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
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: 1,
                color: account.mnemonic == selectedAccount?.mnemonic
                    ? AppColor.primaryColor
                    : Theme.of(context).cardColor),
            color: Theme.of(context).cardColor),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: AppColor.primaryColor)),
              child: Center(
                child: Blockies(
                    size: 0.55,
                    data: account.addressETH ?? '-',
                    shape: BlockiesShape.circle),
              ),
            ),
            width(8),
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
                  height(2),
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
                : GestureDetector(
                    onTap: () {
                      ref
                          .read(accountBackupProvider.notifier)
                          .changeAccount(account);
                      ref.watch(accountBackupProvider);
                      context.goNamed('backup_setting');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border:
                            Border.all(width: 1, color: AppColor.yellowColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "No Backup",
                            style: AppFont.medium12
                                .copyWith(color: AppColor.yellowColor),
                          ),
                          width(4),
                          Icon(
                            Icons.error_outline_rounded,
                            size: 16,
                            color: AppColor.yellowColor,
                          ),
                        ],
                      ),
                    ),
                  ),
            // 4.0.width,
            // GestureDetector(
            //   onTap: () {
            //     ref
            //         .read(accountSelectedEditProvider.notifier)
            //         .selectEditAccount(account);
            //     ref.watch(accountSelectedEditProvider);

            //     context.pop();
            //     context.goNamed('detail_wallet');
            //   },
            //   child: Icon(Icons.more_vert_rounded,
            //       size: 24, color: AppColor.primaryColor),
            // )
          ],
        ),
      ),
    );
  }
}
