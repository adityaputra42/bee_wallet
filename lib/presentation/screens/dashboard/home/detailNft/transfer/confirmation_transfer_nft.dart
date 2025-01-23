import 'package:bee_wallet/presentation/widget/button_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../../config/config.dart';
import '../../../../../provider/provider.dart';
import '../../../../../widget/widget.dart';

class ConfrimTransferNft extends ConsumerWidget {
  const ConfrimTransferNft({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nft = ref.watch(selectedNftProvider);
    final token = ref.watch(chainNftTransferProvider);
    final selectedFee = ref.watch(selectedFeeNftProvider);
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
                        width: 48,
                        height: 48,
                        child: ClipPolygon(
                          sides: 6,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                            ),
                            child: ClipPolygon(
                              sides: 6,
                              child: Container(
                                padding: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                ),
                                child: Image.memory(
                                  MethodHelper().convertBase64ToUint8List(
                                      nft.imageByte ?? ''),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      width(8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nft.name ?? '',
                              style: AppFont.medium14.copyWith(
                                  color: Theme.of(context).indicatorColor),
                            ),
                            height(4),
                            Text(
                              "Token ID : ${nft.tokenId}",
                              style: AppFont.reguler12
                                  .copyWith(color: Theme.of(context).hintColor),
                            ),
                          ],
                        ),
                      ),
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
                                address: nft.owner ?? '', length: 5),
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
                                address: ref.watch(receiveNftProvider).text,
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
                      color: Theme.of(context).colorScheme.surface),
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
                            "~ ${selectedFee == 0 ? ref.watch(slowNetworkFeeNftProvider).toStringAsFixed(8) : selectedFee == 1 ? ref.watch(averageNetworkFeeNftProvider).toStringAsFixed(8) : selectedFee == 2 ? ref.watch(fastNetworkFeeNftProvider).toStringAsFixed(8) : ref.watch(networkFeeNftProvider).toStringAsFixed(8)} ${token.symbol}",
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
                                    .read(selectedFeeNftProvider.notifier)
                                    .setSelectedFee(0);
                              },
                              child: Container(
                                height: 64,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(6),
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
                                              : Theme.of(context).hintColor,
                                        ),
                                      ),
                                      height(2),
                                      Text(
                                        '~${((ref.watch(slowNetworkFeeNftProvider) * BigInt.from(10).pow(9).toDouble()) / double.parse(ref.watch(gasLimitNFTProvider).text)).toStringAsFixed(1)}  Gwei',
                                        style: AppFont.reguler12.copyWith(
                                          color: selectedFee == 0
                                              ? AppColor.primaryColor
                                              : Theme.of(context).hintColor,
                                        ),
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
                                    .read(selectedFeeNftProvider.notifier)
                                    .setSelectedFee(1);
                              },
                              child: Container(
                                height: 64,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(6),
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
                                              : Theme.of(context).hintColor,
                                        ),
                                      ),
                                      height(2),
                                      Text(
                                        '~${((ref.watch(averageNetworkFeeNftProvider) * BigInt.from(10).pow(9).toDouble()) / double.parse(ref.watch(gasLimitNFTProvider).text)).toStringAsFixed(1)} Gwei',
                                        style: AppFont.reguler12.copyWith(
                                          color: selectedFee == 1
                                              ? AppColor.primaryColor
                                              : Theme.of(context).hintColor,
                                        ),
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
                                    .read(selectedFeeNftProvider.notifier)
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
                                              : Theme.of(context).hintColor,
                                        ),
                                      ),
                                      height(2),
                                      Text(
                                        '~ ${((ref.watch(fastNetworkFeeNftProvider) * BigInt.from(10).pow(9).toDouble()) / double.parse(ref.watch(gasLimitNFTProvider).text)).toStringAsFixed(1)} Gwei',
                                        style: AppFont.reguler12.copyWith(
                                          color: selectedFee == 2
                                              ? AppColor.primaryColor
                                              : Theme.of(context).hintColor,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ),
                          width(8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                context.goNamed('custom_gas_fee_nft');
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
                                              : Theme.of(context).hintColor,
                                        ),
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
            ref.watch(transferNftProvider).isLoading
                ? ButtonLoading()
                : PrimaryButton(
                    title: "Send",
                    onPressed: () {
                      ref.read(transferNftProvider.notifier).tranfer(context);
                    },
                  )
          ],
        ),
      ),
    );
  }
}
