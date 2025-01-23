import 'package:bee_wallet/presentation/widget/button_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.surface),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 34,
                        height: 34,
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 32,
                              height: 32,
                              child: ClipPolygon(
                                sides: 6,
                                child: Container(
                                  padding: EdgeInsets.all(0.5),
                                  color: Theme.of(context).colorScheme.surface,
                                  child: (chain.logo != null)
                                      ? Image.asset(chain.logo!)
                                      : Image.asset(AppImage.logo),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: ClipPolygon(
                                  sides: 6,
                                  child: Container(
                                    padding: EdgeInsets.all(0.1),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.1,
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
                      width(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${ref.watch(totalAmountProvider)} ${chain.symbol}",
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
                height(16),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
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
                      height(8),
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
                height(16),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
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
                      height(8),
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
                                height: 64,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Theme.of(context).cardColor,
                                    border: Border.all(
                                      width: 1,
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
                                      height(2),
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
                          width(8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                ref
                                    .read(selectedFeeProvider.notifier)
                                    .setSelectedFee(1);
                              },
                              child: Container(
                                height: 64,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Theme.of(context).cardColor,
                                    border: Border.all(
                                      width: 1,
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
                                      height(2),
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
                          width(8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                ref
                                    .read(selectedFeeProvider.notifier)
                                    .setSelectedFee(2);
                              },
                              child: Container(
                                height: 64,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      width: 1,
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
                                      height(2),
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
                          width(8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.goNamed('custom_gas_fee');
                              },
                              child: Container(
                                height: 64,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      width: 1,
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
                                      height(2),
                                      Icon(
                                        Icons.mode_edit_rounded,
                                        color: selectedFee == 3
                                            ? AppColor.primaryColor
                                            : Theme.of(context).hintColor,
                                        size: 20,
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
            ref.watch(transferChainProvider).isLoading
                ? ButtonLoading()
                : PrimaryButton(
                    margin: EdgeInsets.only(top: 16),
                    title: "Send",
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
