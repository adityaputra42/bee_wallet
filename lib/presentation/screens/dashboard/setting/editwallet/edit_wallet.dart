import 'package:bee_wallet/presentation/widget/input_text.dart';
import 'package:bee_wallet/presentation/widget/primary_button.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/config.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../provider/editWallet/edit_wallet_provider.dart';

class EditWalletScreen extends ConsumerWidget {
  const EditWalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(accountSelectedEditProvider);
    final enableEdit = ref.watch(enableEditWalletProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Edit Wallet"),
      body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(16.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Theme.of(context).cardColor),
          child: Column(
            children: [
              Container(
                width: 80.w,
                height: 80.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 1.w, color: AppColor.primaryColor)),
                child: Center(
                  child: Blockies(
                      size: 1.03,
                      data: account.addressETH ?? '-',
                      shape: BlockiesShape.circle),
                ),
              ),
              12.0.height,
              Text(
                account.name ?? '',
                style: AppFont.semibold20.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
              ),
              4.0.height,
              Text(
                'EVM : ${MethodHelper().shortAddress(address: account.addressETH ?? '', length: 6)}',
                style: AppFont.reguler16.copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
              16.0.height,
              GestureDetector(
                onTap: () {
                  if (account.backup == false) {
                    context.goNamed("backup_setting");
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      width: 1.w,
                      color: account.backup == true
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
                        size: 24.w,
                        color: account.backup == true
                            ? AppColor.greenColor
                            : AppColor.yellowColor,
                      ),
                      8.0.width,
                      Expanded(
                        child: Text(
                          account.backup == true
                              ? "Your account has been backed up"
                              : "Please backup your sheed pharse, to secure your account.",
                          style: AppFont.reguler12.copyWith(
                            color: account.backup == true
                                ? AppColor.greenColor
                                : AppColor.yellowColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              24.0.height,
              InputText(
                title: "Account Name",
                hintText: "Entry Account Name",
                enable: enableEdit,
                controller: ref.watch(accountNameProvider),
                color: Theme.of(context).colorScheme.surface,
              ),
              const Spacer(),
              PrimaryButton(
                  loading: ref.watch(selectedAccountProvider).isLoading,
                  title: enableEdit == true ? "Save" : "Edit",
                  onPressed: () {
                    if (enableEdit == true) {
                      ref
                          .read(accountSelectedEditProvider.notifier)
                          .changeEditAccount(
                              context, ref.watch(accountNameProvider).text);
                    } else {
                      ref
                          .read(enableEditWalletProvider.notifier)
                          .changeState(true);
                    }
                  })
            ],
          )),
    );
  }
}
