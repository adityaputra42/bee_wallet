import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/presentation/provider/account/account_provider.dart';
import 'package:bee_wallet/presentation/provider/transfer/transfer_provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';

import '../../../../../utils/util.dart';

class SheetConfirmTransfer extends ConsumerWidget {
  const SheetConfirmTransfer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chain = ref.watch(chainTransferProvider);
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final selectedFee = ref.watch(selectedFeeProvider);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          16.w, 0.h, 16.w, MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Send",
            style: AppFont.semibold16
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          16.0.height,
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Theme.of(context).cardColor),
            child: Row(
              children: [
                Image.asset(
                  chain.logo ?? '',
                  width: 32.w,
                ),
                8.0.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${ref.watch(amountSendProvider)} ${chain.symbol}",
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    Text(
                      "${chain.name}",
                      style: AppFont.reguler12
                          .copyWith(color: Theme.of(context).hintColor),
                    )
                  ],
                )
              ],
            ),
          ),
          16.0.height,
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Theme.of(context).cardColor),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "From",
                      style: AppFont.reguler14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    Text(
                      MethodHelper().shortAddress(
                          address: chain.baseChain == 'eth'
                              ? (account?.addressETH ?? '')
                              : chain.baseChain == 'sol'
                                  ? (account?.addressSolana ?? "")
                                  : chain.baseChain == 'sui'
                                      ? (account?.addressSui ?? "")
                                      : '',
                          length: 5),
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    )
                  ],
                ),
                8.0.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "To",
                      style: AppFont.reguler14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    Text(
                      MethodHelper().shortAddress(
                          address: ref.watch(receiveAddressProvider).text,
                          length: 5),
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    )
                  ],
                ),
              ],
            ),
          ),
          16.0.height,
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Theme.of(context).cardColor),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Network Fee",
                      style: AppFont.reguler14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    Text(
                      "~ ${selectedFee == 0 ? ref.watch(slowNetworkFeeProvider).toStringAsFixed(8) : selectedFee == 1 ? ref.watch(averageNetworkFeeProvider).toStringAsFixed(8) : selectedFee == 2 ? ref.watch(fastNetworkFeeProvider).toStringAsFixed(8) : ref.watch(networkFeeProvider).toStringAsFixed(8)} ${chain.symbol}",
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    )
                  ],
                ),
                8.0.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(selectedFeeProvider.notifier)
                              .setSelectedFee(0);
                        },
                        child: Container(
                          height: 64.h,
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                  width: 1.w,
                                  color: selectedFee == 0
                                      ? AppColor.primaryColor
                                      : Theme.of(context).hintColor)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Low',
                                  style: AppFont.reguler12.copyWith(
                                      color: Theme.of(context).hintColor),
                                ),
                                2.0.height,
                                Text(
                                  '~${((ref.watch(slowNetworkFeeProvider) * BigInt.from(10).pow(9).toDouble()) / double.parse(ref.watch(gasLimitProvider).text)).toStringAsFixed(1)}  Gwei',
                                  style: AppFont.reguler12.copyWith(
                                      color: Theme.of(context).hintColor),
                                )
                              ]),
                        ),
                      ),
                    ),
                    8.0.width,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(selectedFeeProvider.notifier)
                              .setSelectedFee(1);
                        },
                        child: Container(
                          height: 64.h,
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                  width: 1.w,
                                  color: selectedFee == 1
                                      ? AppColor.primaryColor
                                      : Theme.of(context).hintColor)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Middle',
                                  style: AppFont.reguler12.copyWith(
                                      color: Theme.of(context).hintColor),
                                ),
                                2.0.height,
                                Text(
                                  '~${((ref.watch(averageNetworkFeeProvider) * BigInt.from(10).pow(9).toDouble()) / double.parse(ref.watch(gasLimitProvider).text)).toStringAsFixed(1)} Gwei',
                                  style: AppFont.reguler12.copyWith(
                                      color: Theme.of(context).hintColor),
                                )
                              ]),
                        ),
                      ),
                    ),
                    8.0.width,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ref
                              .read(selectedFeeProvider.notifier)
                              .setSelectedFee(2);
                        },
                        child: Container(
                          height: 64.h,
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                  width: 1.w,
                                  color: selectedFee == 2
                                      ? AppColor.primaryColor
                                      : Theme.of(context).hintColor)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'High',
                                  style: AppFont.reguler12.copyWith(
                                      color: Theme.of(context).hintColor),
                                ),
                                2.0.height,
                                Text(
                                  '~ ${((ref.watch(fastNetworkFeeProvider) * BigInt.from(10).pow(9).toDouble()) / double.parse(ref.watch(gasLimitProvider).text)).toStringAsFixed(1)} Gwei',
                                  style: AppFont.reguler12.copyWith(
                                      color: Theme.of(context).hintColor),
                                )
                              ]),
                        ),
                      ),
                    ),
                    8.0.width,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          context.goNamed('custom_gas_fee');
                        },
                        child: Container(
                          height: 64.h,
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                  width: 1.w,
                                  color: selectedFee == 3
                                      ? AppColor.primaryColor
                                      : Theme.of(context).hintColor)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Custom',
                                  style: AppFont.reguler12.copyWith(
                                      color: Theme.of(context).hintColor),
                                ),
                                2.0.height,
                                Icon(
                                  Icons.mode_edit_rounded,
                                  color: Theme.of(context).hintColor,
                                  size: 20.w,
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.0.height,
          Row(
            children: [
              Expanded(
                  child: SecondaryButton(
                title: "Cancel",
                onPressed: () {
                  context.pop();
                },
              )),
              8.0.width,
              Expanded(
                  child: PrimaryButton(
                title: "Send",
                loading: ref.watch(transferLoadingProvider),
                onPressed: () {
                  ref.read(transferChainProvider.notifier).tranfer(context);
                },
              ))
            ],
          ),
          24.0.height,
        ],
      ),
    );
  }
}
