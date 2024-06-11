import 'dart:math';

import 'package:blockies_ethereum/blockies_ethereum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/ant_design.dart';
import 'package:iconify_flutter_plus/icons/prime.dart';
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
import '../../scan/scann_page.dart';

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        title: "${chain.name}",
        icon: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScanPage(
                    onScan: (result) {
                      ref
                          .read(receiveAddressProvider.notifier)
                          .setValue(result);
                      ref.watch(receiveAddressProvider);
                      ref
                          .read(chainTransferProvider.notifier)
                          .setChainTransfer(chain);
                      ref.watch(chainTransferProvider);
                      context.goNamed('choose_receiver');
                    },
                  ),
                ),
              );
            },
            child: Container(
              width: 36.w,
              height: 36.w,
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(width: 1.w, color: AppColor.grayColor)),
              child: Iconify(
                AntDesign.scan,
                color: Theme.of(context).indicatorColor,
                size: 20.w,
              ),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            SizedBox(
              width: 50.w,
              height: 50.w,
              child: Stack(
                children: [
                  SizedBox(
                    width: 48.w,
                    height: 48.w,
                    child: ClipPolygon(
                      sides: 6,
                      child: Container(
                        padding: EdgeInsets.all(0.5.h),
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
                      width: 20.w,
                      height: 20.w,
                      child: ClipPolygon(
                        sides: 6,
                        child: Container(
                          padding: EdgeInsets.all(0.1.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.3.w,
                                  color: Theme.of(context).cardColor),
                              color: Theme.of(context).colorScheme.surface),
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
            8.0.height,
            Text(
              "${chain.balance} ${chain.symbol}",
              style: AppFont.medium32.copyWith(
                color: Theme.of(context).indicatorColor,
              ),
            ),
            4.0.height,
            Text(
              "~\$ ${0.toStringAsFixed(2)}",
              style: AppFont.reguler16
                  .copyWith(color: Theme.of(context).hintColor),
            ),
            16.0.height,
            Row(
              children: [
                Expanded(
                    child: PrimaryButton(
                  icon: Iconify(
                    Prime.qrcode,
                    size: 24.w,
                    color: AppColor.textStrongLight,
                  ),
                  title: "Receive",
                  onPressed: () {
                    context.goNamed('receive_token');
                  },
                )),
                12.0.width,
                Expanded(
                    child: PrimaryButton(
                  title: "Transfer",
                  icon: Iconify(
                    AntDesign.send_outlined,
                    size: 24.w,
                    color: AppColor.textStrongLight,
                  ),
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
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Theme.of(context).cardColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transaction History",
                          style: AppFont.medium14.copyWith(
                              color: Theme.of(context).indicatorColor),
                        ),
                        8.0.height,
                        SizedBox(
                          height: 1.w,
                          child: Divider(
                            thickness: 1.w,
                            color: AppColor.grayColor,
                          ),
                        ),
                        8.0.height,
                        Expanded(
                          child: RefreshIndicator(
                            color: AppColor.primaryColor,
                            backgroundColor: Theme.of(context).indicatorColor,
                            onRefresh: () async => pagingController.refresh(),
                            child: PagedListView<int, Activity>(
                              pagingController: pagingController,
                              builderDelegate:
                                  PagedChildBuilderDelegate<Activity>(
                                firstPageProgressIndicatorBuilder: (context) =>
                                    const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                noItemsFoundIndicatorBuilder: (context) =>
                                    const Empty(
                                  title: "No transactions found",
                                ),
                                firstPageErrorIndicatorBuilder: (context) =>
                                    Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      AppImage.empty,
                                      width: 200.w,
                                    ),
                                    16.0.height,
                                    Text(
                                      "Oops...",
                                      style: AppFont.semibold24.copyWith(
                                          color:
                                              Theme.of(context).indicatorColor),
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
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 64.w),
                                    )
                                  ],
                                ),
                                itemBuilder: (context, item, index) => Padding(
                                  padding: EdgeInsets.only(bottom: 8.h),
                                  child: cardActivity(
                                      context: context,
                                      activity: item,
                                      address: account?.addressETH ?? "",
                                      chain: chain),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))),
            8.0.height,
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
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).colorScheme.surface),
        child: Row(
          children: [
            Container(
              width: 42.w,
              height: 42.w,
              padding: EdgeInsets.all(6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).cardColor,
              ),
              child: Icon(
                state == "Transfer" ? Icons.arrow_upward : Icons.arrow_downward,
                size: 24.w,
                color: Theme.of(context).indicatorColor,
              ),
            ),
            12.0.width,
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state,
                      style: AppFont.semibold16
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    Text(
                      "${state == "Transfer" ? "-" : "+"}${(BigInt.parse(activity.value!).toDouble() / pow(10, 18)).toStringAsFixed(5)} ${activity.symbol == "" ? chain?.symbol : activity.symbol}",
                      style: AppFont.medium16.copyWith(
                          color: state == "Transfer"
                              ? AppColor.redColor
                              : AppColor.greenColor),
                    ),
                  ],
                ),
                2.0.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "to : ${activity.to != null ? MethodHelper().shortAddress(address: activity.to ?? "~", length: 5) : "~"}",
                      style: AppFont.reguler14
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                    Text(
                      DateFormat("dd MMM yyyy - HH:mm").format(
                          DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(activity.timeStamp!) * 1000)
                              .toLocal()),
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).hintColor),
                    )
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
                    color: Theme.of(context).colorScheme.surface),
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
                    color: Theme.of(context).colorScheme.surface),
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
