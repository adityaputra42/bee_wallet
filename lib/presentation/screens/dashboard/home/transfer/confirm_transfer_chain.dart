import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/presentation/provider/account/account_provider.dart';
import 'package:bee_wallet/presentation/provider/transfer/transfer_provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';

import '../../../../../data/src/src.dart';
import '../../../../../utils/util.dart';

class ConfirmTransferChain extends ConsumerWidget {
  const ConfirmTransferChain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chain = ref.watch(chainTransferProvider);
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final selectedFee = ref.watch(selectedFeeProvider);
    return Scaffold(
      appBar: WidgetHelper.appBar(context: context, title: "Confirm Transfer"),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Theme.of(context).cardColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Theme.of(context).colorScheme.surface),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 34.w,
                        height: 34.w,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 32.w,
                              height: 32.w,
                              child: ClipPolygon(
                                sides: 6,
                                child: Container(
                                  padding: EdgeInsets.all(0.5.h),
                                  color:
                                      Theme.of(context).colorScheme.surface,
                                  child: (chain.logo != null)
                                      ? Image.asset(chain.logo!)
                                      : Image.asset(AppImage.logo),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                width: 16.w,
                                height: 16.w,
                                child: ClipPolygon(
                                  sides: 6,
                                  child: Container(
                                    padding: EdgeInsets.all(0.1.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.1.w,
                                            color: Theme.of(context).cardColor),
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface),
                                    child: (chain.baseLogo != null)
                                        ? Image.asset(chain.baseLogo!)
                                        : Image.asset(AppImage.logo),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      8.0.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${ref.watch(amountSendProvider)} ${chain.symbol}",
                            style: AppFont.medium14.copyWith(
                                color: Theme.of(context).indicatorColor),
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
                      borderRadius: BorderRadius.circular(8.r),
                      color: Theme.of(context).colorScheme.surface),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "From",
                            style: AppFont.reguler14.copyWith(
                                color: Theme.of(context).indicatorColor),
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
                            style: AppFont.medium14.copyWith(
                                color: Theme.of(context).indicatorColor),
                          )
                        ],
                      ),
                      8.0.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "To",
                            style: AppFont.reguler14.copyWith(
                                color: Theme.of(context).indicatorColor),
                          ),
                          Text(
                            MethodHelper().shortAddress(
                                address: ref.watch(receiveAddressProvider).text,
                                length: 5),
                            style: AppFont.medium14.copyWith(
                                color: Theme.of(context).indicatorColor),
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
                    borderRadius: BorderRadius.circular(8.r),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Network Fee",
                            style: AppFont.reguler14.copyWith(
                                color: Theme.of(context).indicatorColor),
                          ),
                          Text(
                            "~ ${selectedFee == 0 ? ref.watch(slowNetworkFeeProvider).toStringAsFixed(8) : selectedFee == 1 ? ref.watch(averageNetworkFeeProvider).toStringAsFixed(8) : selectedFee == 2 ? ref.watch(fastNetworkFeeProvider).toStringAsFixed(8) : ref.watch(networkFeeProvider).toStringAsFixed(8)} ${chain.symbol}",
                            style: AppFont.medium14.copyWith(
                                color: Theme.of(context).indicatorColor),
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
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: Theme.of(context).cardColor,
                                    border: Border.all(
                                      width: 1.w,
                                      color: selectedFee == 0
                                          ? AppColor.primaryColor
                                          : Theme.of(context).cardColor,
                                    )),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Low',
                                        style: AppFont.reguler12.copyWith(
                                            color: selectedFee == 0
                                                ? AppColor.primaryColor
                                                : Theme.of(context).hintColor),
                                      ),
                                      2.0.height,
                                      Text(
                                        '~${((ref.watch(slowNetworkFeeProvider) * BigInt.from(10).pow(9).toDouble()) / double.parse(ref.watch(gasLimitProvider).text)).toStringAsFixed(1)}  Gwei',
                                        style: AppFont.reguler12.copyWith(
                                            color: selectedFee == 0
                                                ? AppColor.primaryColor
                                                : Theme.of(context).hintColor),
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
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: Theme.of(context).cardColor,
                                    border: Border.all(
                                      width: 1.w,
                                      color: selectedFee == 1
                                          ? AppColor.primaryColor
                                          : Theme.of(context).cardColor,
                                    )),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Middle',
                                        style: AppFont.reguler12.copyWith(
                                            color: selectedFee == 1
                                                ? AppColor.primaryColor
                                                : Theme.of(context).hintColor),
                                      ),
                                      2.0.height,
                                      Text(
                                        '~${((ref.watch(averageNetworkFeeProvider) * BigInt.from(10).pow(9).toDouble()) / double.parse(ref.watch(gasLimitProvider).text)).toStringAsFixed(1)} Gwei',
                                        style: AppFont.reguler12.copyWith(
                                            color: selectedFee == 1
                                                ? AppColor.primaryColor
                                                : Theme.of(context).hintColor),
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
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(6.r),
                                    border: Border.all(
                                      width: 1.w,
                                      color: selectedFee == 2
                                          ? AppColor.primaryColor
                                          : Theme.of(context).cardColor,
                                    )),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'High',
                                        style: AppFont.reguler12.copyWith(
                                            color: selectedFee == 2
                                                ? AppColor.primaryColor
                                                : Theme.of(context).hintColor),
                                      ),
                                      2.0.height,
                                      Text(
                                        '~ ${((ref.watch(fastNetworkFeeProvider) * BigInt.from(10).pow(9).toDouble()) / double.parse(ref.watch(gasLimitProvider).text)).toStringAsFixed(1)} Gwei',
                                        style: AppFont.reguler12.copyWith(
                                            color: selectedFee == 2
                                                ? AppColor.primaryColor
                                                : Theme.of(context).hintColor),
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
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(6.r),
                                    border: Border.all(
                                      width: 1.w,
                                      color: selectedFee == 3
                                          ? AppColor.primaryColor
                                          : Theme.of(context).cardColor,
                                    )),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Custom',
                                        style: AppFont.reguler12.copyWith(
                                            color: selectedFee == 3
                                                ? AppColor.primaryColor
                                                : Theme.of(context).hintColor),
                                      ),
                                      2.0.height,
                                      Icon(
                                        Icons.mode_edit_rounded,
                                        color: selectedFee == 3
                                            ? AppColor.primaryColor
                                            : Theme.of(context).hintColor,
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
              ],
            ),
            PrimaryButton(
              margin: EdgeInsets.only(top: 16.w),
              title: "Send",
              loading: ref.watch(transferChainProvider).isLoading,
              onPressed: () {
                ref.read(transferChainProvider.notifier).tranfer(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
