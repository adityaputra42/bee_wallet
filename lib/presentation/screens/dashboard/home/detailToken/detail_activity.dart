import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:web3_webview/web3_webview.dart';

import '../../../../../config/config.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/account/account_provider.dart';

class DetailActivity extends ConsumerWidget {
  DetailActivity({super.key});

  final ChromeSafariBrowser browser = ChromeSafariBrowser();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityDetailProvider);
    final chain = ref.watch(chainDetailProvider);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: WidgetHelper.appBar(
          context: context,
          title: "Transaction Details",
          icon: InkWell(
              onTap: () {},
              child: Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: AppColor.grayColor)),
                child: Icon(
                  Icons.share_outlined,
                  color: AppColor.primaryColor,
                  size: 24,
                ),
              )),
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).cardColor),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _valueTransaction(context, ref),
                _transactionHash(context, ref),
                _fromTo(context, ref),
                _infoFee(context, ref),
                const Spacer(),
                PrimaryButton(
                    title: 'View in Blockchain Explorer',
                    onPressed: () async {
                      await browser.open(
                          url: WebUri('${chain.explorer}/tx/${activity.hash}'));
                      browser.close();
                    })
              ],
            ),
          ),
        ));
  }

  Container _infoFee(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityDetailProvider);
    final chain = ref.watch(chainDetailProvider);
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Blocks',
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                '${activity.blockNumber} (${activity.confirmations} Confirmations)',
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).indicatorColor),
              )
            ],
          ),
          height(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Network Fee',
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                '${chain.chainId == '234' ? (BigInt.from(int.parse(activity.gas!)).toDouble() / pow(10, 18)) : (BigInt.from(int.parse(activity.gas!) * int.parse(activity.gasPrice!)).toDouble() / pow(10, 18))} ${chain.symbol}',
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).indicatorColor),
              )
            ],
          ),
          height(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gas Used',
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                '${BigInt.from(int.parse(activity.gasUsed!)).toDouble() / pow(10, 9)} Gwei',
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).indicatorColor),
              )
            ],
          ),
          height(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gas Price',
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                '${BigInt.from(int.parse(activity.gasPrice!)).toDouble() / pow(10, 9)} Gwei',
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).indicatorColor),
              )
            ],
          ),
          height(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Transaction Time',
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                DateFormat('dd MMM yyyy | hh.mm a').format(
                    DateTime.fromMillisecondsSinceEpoch(
                            int.parse(activity.timeStamp!) * 1000)
                        .toLocal()),
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).indicatorColor),
              )
            ],
          ),
          height(8),
        ],
      ),
    );
  }

  Row _fromTo(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityDetailProvider);
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.surface),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "From :",
                  style: AppFont.medium12
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        MethodHelper().shortAddress(
                            address: activity.from ?? '', length: 6),
                        style: AppFont.medium12
                            .copyWith(color: Theme.of(context).hintColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        MethodHelper().handleCopy(
                            data: activity.from ?? '', context: context);
                      },
                      child: Icon(
                        Icons.copy_rounded,
                        color: AppColor.primaryColor,
                        size: 16,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        width(12),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.surface),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "To :",
                  style: AppFont.medium12
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                height(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        MethodHelper().shortAddress(
                            address: activity.to ?? '', length: 6),
                        style: AppFont.medium12
                            .copyWith(color: Theme.of(context).hintColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    width(4),
                    GestureDetector(
                      onTap: () {
                        MethodHelper().handleCopy(
                            data: activity.to ?? '', context: context);
                      },
                      child: Icon(
                        Icons.copy_rounded,
                        color: AppColor.primaryColor,
                        size: 16,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _transactionHash(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityDetailProvider);
    final chain = ref.watch(chainDetailProvider);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Network",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Image.asset(
                chain.logo ?? "",
                width: 24,
              )
            ],
          ),
          height(8),
          SizedBox(
            width: double.infinity,
            height: 1,
            child: Divider(
              thickness: 1,
              color: AppColor.grayColor,
            ),
          ),
          height(8),
          Text(
            "Transaction Hash :",
            style:
                AppFont.medium12.copyWith(color: Theme.of(context).hintColor),
          ),
          height(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                MethodHelper()
                    .shortAddress(address: activity.hash ?? '', length: 8),
                style: AppFont.medium14
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
              GestureDetector(
                onTap: () {
                  MethodHelper()
                      .handleCopy(data: activity.hash ?? "", context: context);
                },
                child: Icon(
                  Icons.copy_rounded,
                  color: AppColor.primaryColor,
                  size: 16,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container _valueTransaction(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityDetailProvider);
    final chain = ref.watch(chainDetailProvider);
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    String state = activity.from == account?.addressETH ? "Send" : "Receiced";
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Value Transaction",
            style:
                AppFont.medium12.copyWith(color: Theme.of(context).hintColor),
          ),
          height(8),
          Text(
            "$state ${BigInt.parse(activity.value!).toDouble() / pow(10, 18)}  ${activity.symbol == "" ? chain.symbol : activity.symbol}",
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
          )
        ],
      ),
    );
  }
}
