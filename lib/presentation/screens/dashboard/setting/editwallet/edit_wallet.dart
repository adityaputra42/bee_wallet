import 'package:bee_wallet/presentation/widget/input_text.dart';
import 'package:bee_wallet/presentation/widget/primary_button.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/config.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../provider/editWallet/edit_wallet_provider.dart';
import '../../../../widget/button_loading.dart';

class EditWalletScreen extends ConsumerWidget {
  const EditWalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountSelectedEditProvider);
    final enableEdit = ref.watch(enableEditWalletProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Edit Wallet"),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: AppColor.primaryColor),
                ),
                child: Center(
                  child: Blockies(
                    size: 1.03,
                    data: account.addressETH ?? '-',
                    shape: BlockiesShape.circle,
                  ),
                ),
              ),
              height(12),
              Text(
                account.name ?? '',
                style: AppFont.semibold20.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
              ),
              height(4),
              Text(
                'EVM : ${MethodHelper().shortAddress(address: account.addressETH ?? '', length: 6)}',
                style: AppFont.reguler16.copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
              height(16),
              GestureDetector(
                onTap: () {
                  if (account.backup == false) {
                    context.goNamed("backup_setting");
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color:
                          account.backup == true
                              ? AppColor.greenColor
                              : AppColor.yellowColor,
                    ),
                    // color: account?.backup == true
                    //     ? AppColor.greenColor
                    //     : AppColor.yellowColor,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        account.backup == true
                            ? Icons.check_circle_outline_rounded
                            : Icons.error_outline_outlined,
                        size: 24,
                        color:
                            account.backup == true
                                ? AppColor.greenColor
                                : AppColor.yellowColor,
                      ),
                      width(8),
                      Expanded(
                        child: Text(
                          account.backup == true
                              ? "Your account has been backed up"
                              : "Please backup your sheed pharse, to secure your account.",
                          style: AppFont.reguler12.copyWith(
                            color:
                                account.backup == true
                                    ? AppColor.greenColor
                                    : AppColor.yellowColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              height(16),
              InputText(
                filled: true,
                filledColor: Theme.of(context).colorScheme.surface,
                title: "Account Name",
                hintText: "Entry Account Name",
                enable: enableEdit,
                controller: ref.watch(accountNameProvider),
                color: Theme.of(context).colorScheme.surface,
              ),
              const Spacer(),
              ref.watch(selectedAccountProvider).isLoading
                  ? ButtonLoading()
                  : PrimaryButton(
                    title: enableEdit == true ? "Save" : "Edit",
                    onPressed: () {
                      if (enableEdit == true) {
                        ref
                            .read(accountSelectedEditProvider.notifier)
                            .changeEditAccount(
                              context,
                              ref.watch(accountNameProvider).text,
                            );
                      } else {
                        ref
                            .read(enableEditWalletProvider.notifier)
                            .changeState(true);
                      }
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
