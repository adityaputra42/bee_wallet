import 'dart:math';

import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:bee_wallet/data/model/model.dart';
import 'package:bee_wallet/presentation/provider/account/account_provider.dart';
import 'package:bee_wallet/presentation/widget/widget.dart';
import 'package:intl/intl.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/token_chain/selected_token_chain.dart';
import '../../../../../data/src/src.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/provider.dart';
import '../../../../provider/transfer/transfer_provider.dart';

class DetailTokenScreen extends ConsumerStatefulWidget {
  const DetailTokenScreen({super.key});

  @override
  ConsumerState<DetailTokenScreen> createState() => _DetailTokenScreenState();
}

class _DetailTokenScreenState extends ConsumerState<DetailTokenScreen> {
  @override
  void initState() {
    ref.read(chainHistoryProvider.notifier).init();

    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final chain = ref.watch(chainDetailProvider);
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final pagingController = ref.watch(chainHistoryProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
        context: context,
        title: "${chain.name} (${chain.symbol})",
        icon: GestureDetector(
            onTap: () {
              context.goNamed('detail_trade_token');
            },
            child: Container(
              width: 40.w,
              height: 40.w,
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(width: 1.w, color: AppColor.grayColor)),
              child: Icon(
                Icons.candlestick_chart_outlined,
                color: AppColor.primaryColor,
                size: 24.w,
              ),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            cardChain(context),
            16.0.height,
            SizedBox(
              width: 50.w,
              height: 50.w,
              child: Stack(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(chain.logo ?? ''))),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1.w, color: Theme.of(context).cardColor),
                          image: DecorationImage(
                              image: AssetImage(chain.baseLogo ?? ''))),
                    ),
                  ),
                ],
              ),
            ),
            8.0.height,
            Text(
              "${chain.balance} ${chain.symbol}",
              style: AppFont.medium32.copyWith(
                color: Theme.of(context).indicatorColor,
              ),
            ),
            4.0.height,
            Text(
              "\$${0.toStringAsFixed(2)} (+0.000%) Today",
              style: AppFont.medium12.copyWith(color: AppColor.greenColor),
            ),
            16.0.height,
            Row(
              children: [
                Expanded(
                    child: SecondaryButton(
                  borderColor: AppColor.grayColor,
                  textColor: Theme.of(context).hintColor,
                  title: "Swap",
                  onPressed: () {
                    // SuiHelper()
                    //     .getTransaction(account: account!, isTestnet: true);
                  },
                )),
                8.0.width,
                Expanded(
                    child: SecondaryButton(
                  borderColor: AppColor.grayColor,
                  textColor: Theme.of(context).hintColor,
                  title: "Receive",
                  onPressed: () {
                    context.goNamed('receive_token');
                  },
                )),
                8.0.width,
                Expanded(
                    child: SecondaryButton(
                  borderColor: AppColor.grayColor,
                  textColor: Theme.of(context).hintColor,
                  title: "Send",
                  onPressed: () {
                    ref
                        .read(chainTransferProvider.notifier)
                        .setChainTransfer(chain);
                    ref.watch(chainTransferProvider);
                    context.goNamed('choose_receiver');
                  },
                )),
              ],
            ),
            16.0.height,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Transaction",
                style: AppFont.medium14
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
            ),
            16.0.height,
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Theme.of(context).cardColor),
                    child: RefreshIndicator(
                      color: AppColor.primaryColor,
                      backgroundColor: Theme.of(context).indicatorColor,
                      onRefresh: () async => pagingController.refresh(),
                      child: PagedListView<int, Activity>(
                        pagingController: pagingController,
                        builderDelegate: PagedChildBuilderDelegate<Activity>(
                          firstPageProgressIndicatorBuilder: (context) =>
                              const Center(
                            child: CircularProgressIndicator(),
                          ),
                          noItemsFoundIndicatorBuilder: (context) =>
                              const Empty(
                            title: "No transactions found",
                          ),
                          firstPageErrorIndicatorBuilder: (context) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                AppImage.trouble,
                                width: 200.w,
                              ),
                              16.0.height,
                              Text(
                                "Oops...",
                                style: AppFont.semibold24.copyWith(
                                    color: Theme.of(context).indicatorColor),
                                textAlign: TextAlign.center,
                              ),
                              .0.height,
                              Text(
                                "Error : ${pagingController.error}",
                                style: AppFont.reguler14.copyWith(
                                    color: Theme.of(context).hintColor),
                                textAlign: TextAlign.center,
                              ),
                              24.0.height,
                              PrimaryButton(
                                title: "Try Again",
                                height: 42,
                                onPressed: () {
                                  pagingController.refresh();
                                },
                                margin: EdgeInsets.symmetric(horizontal: 64.w),
                              )
                            ],
                          ),
                          // Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       "Error occurred",
                          //       style: AppFont.semibold16.copyWith(
                          //           color: Theme.of(context).indicatorColor),
                          //     ),
                          //     12.0.height,
                          //     Text(
                          //       "${pagingController.error}",
                          //       style: AppFont.reguler12.copyWith(
                          //           color: Theme.of(context).hintColor),
                          //       textAlign: TextAlign.center,
                          //     ),
                          //     TextButton(
                          //       onPressed: () {
                          //         pagingController.refresh();
                          //       },
                          //       child: Text(
                          //         "Coba Lagi",
                          //         style: AppFont.medium14.copyWith(
                          //             color: Theme.of(context).indicatorColor),
                          //       ),
                          //     )
                          //   ],
                          // ),
                          itemBuilder: (context, item, index) => cardActivity(
                              context: context,
                              activity: item,
                              address: account?.addressETH ?? "",
                              chain: chain),
                        ),
                      ),
                    )))

            //    ListView.builder(
            //     itemBuilder: (context, index) => cardActivity(context),
            //     itemCount: 10,
            //   ),
            // ))
          ],
        ),
      ),
    );
  }

  Widget cardActivity(
      {required BuildContext context,
      required Activity activity,
      String? address,
      SelectedTokenChain? chain}) {
    String state = activity.from == address ? "Transfer" : "Receiced";
    return GestureDetector(
      onTap: () {
        ref.read(activityDetailProvider.notifier).setActivity(activity);
        ref.watch(activityDetailProvider);
        context.goNamed('detail_activity');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Theme.of(context).colorScheme.background),
        child: Row(
          children: [
            Container(
              width: 36.w,
              height: 36.w,
              padding: EdgeInsets.all(6.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).cardColor,
              ),
              child: Icon(
                state == "Transfer" ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16.w,
                color: AppColor.primaryColor,
              ),
            ),
            8.0.width,
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$state  ${activity.symbol == "" ? chain?.symbol : activity.symbol}',
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    Text(
                      DateFormat("hh:mm a")
                          .format(DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(activity.timeStamp!) * 1000)
                              .toLocal())
                          .toLowerCase(),
                      style: AppFont.medium12
                          .copyWith(color: Theme.of(context).hintColor),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "to : ${activity.to != null ? MethodHelper().shortAddress(address: activity.to ?? "~", length: 5) : "~"}",
                      style: AppFont.reguler12
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                    Text(
                      "${(BigInt.parse(activity.value!).toDouble() / pow(10, 18)).toStringAsFixed(5)} ${activity.symbol == "" ? chain?.symbol : activity.symbol}",
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget cardChain(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final account = ref.watch(selectedAccountProvider).valueOrNull;
      final chain = ref.watch(chainDetailProvider);
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).cardColor),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                height: 44.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Theme.of(context).colorScheme.background),
                child: Row(
                  children: [
                    Container(
                      width: 28.w,
                      height: 28.w,
                      // padding: EdgeInsets.all(3.h),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1.w, color: AppColor.primaryColor)),
                      child: Center(
                        child: Blockies(
                            size: 0.34,
                            data: account?.addressETH ?? '-',
                            shape: BlockiesShape.circle),
                      ),
                    ),
                    8.0.width,
                    Text(
                      "${account?.name}-${account?.id}",
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                  ],
                ),
              ),
            ),
            8.0.width,
            GestureDetector(
              onTap: () {
                MethodHelper().handleCopy(
                    data: chain.baseChain == 'eth'
                        ? (account?.addressETH ?? '')
                        : chain.baseChain == 'sol'
                            ? (account?.addressSolana ?? "")
                            : chain.baseChain == 'sui'
                                ? (account?.addressSui ?? "")
                                : '',
                    context: context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                height: 44.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Theme.of(context).colorScheme.background),
                child: Row(
                  children: [
                    Text(
                      MethodHelper().shortAddress(
                          address: chain.baseChain == 'eth'
                              ? (account?.addressETH ?? '')
                              : chain.baseChain == 'sol'
                                  ? (account?.addressSolana ?? "")
                                  : chain.baseChain == 'sui'
                                      ? (account?.addressSui ?? "")
                                      : '',
                          length: 4),
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    8.0.width,
                    Icon(
                      Icons.copy_rounded,
                      color: AppColor.primaryColor,
                      size: 16.w,
                    )
                  ],
                ),
              ),
            ),
            8.0.width,
            Icon(
              Icons.more_vert_rounded,
              size: 24.w,
              color: AppColor.primaryColor,
            )
          ],
        ),
      );
    });
  }
}
