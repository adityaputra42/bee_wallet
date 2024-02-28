import 'dart:math';

import 'package:bee_wallet/presentation/provider/account/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/model.dart';
import '../../../../../data/model/token_chain/token_chain.dart';
import '../../../../../data/src/src.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/provider.dart';
import '../../../../widget/widget.dart';

class DetailNftView extends ConsumerStatefulWidget {
  const DetailNftView({super.key});

  @override
  ConsumerState<DetailNftView> createState() => _DetailNftViewState();
}

class _DetailNftViewState extends ConsumerState<DetailNftView> {
  @override
  void initState() {
    ref.read(nftHistoryProvider.notifier).init();

    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final nftView = ref.watch(selectedViewNftProvider);
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final chain = ref.watch(tokenChainNftProvider);
    final pagingController = ref.watch(nftHistoryProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(context: context, title: "Detail NFT"),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 84.h,
                  width: 84.h,
                  padding: EdgeInsets.all(6.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor,
                  ),
                  child: ClipOval(
                    child: Image.memory(
                      MethodHelper()
                          .convertBase64ToUint8List(nftView.image ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                8.0.width,
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nftView.name ?? '',
                      style: AppFont.medium16
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    4.0.width,
                    Text(
                      "Owned : ${nftView.length}",
                      style:
                          AppFont.medium14.copyWith(color: AppColor.grayColor),
                    ),
                    4.0.width,
                    Row(
                      children: [
                        Text(
                          MethodHelper().shortAddress(
                              address: nftView.contract ?? '', length: 8),
                          style: AppFont.medium14
                              .copyWith(color: AppColor.grayColor),
                        ),
                        8.0.width,
                        GestureDetector(
                          onTap: () {
                            MethodHelper().handleCopy(
                                data: nftView.contract ?? '', context: context);
                          },
                          child: Icon(
                            Icons.copy_rounded,
                            color: AppColor.primaryColor,
                            size: 16.w,
                          ),
                        )
                      ],
                    ),
                  ],
                ))
              ],
            ),
            16.0.height,
            Expanded(
                child: DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 54.h,
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Theme.of(context).cardColor,
                    ),
                    child: TabBar(
                      automaticIndicatorColorAdjustment: false,
                      indicator: BoxDecoration(
                          gradient: AppColor.primaryGradient,
                          borderRadius: BorderRadius.circular(8.r)),
                      isScrollable: false,
                      dividerColor: Theme.of(context).cardColor,
                      indicatorColor: Theme.of(context).cardColor,
                      labelColor: AppColor.textStrongDark,
                      labelPadding: EdgeInsets.zero,
                      labelStyle: AppFont.medium14,
                      unselectedLabelColor: AppColor.grayColor,
                      unselectedLabelStyle: AppFont.reguler14,
                      indicatorSize: TabBarIndicatorSize.tab,
                      onTap: (index) {},
                      tabs: const [
                        Tab(
                          child: Center(
                            child: Text(
                              "Items",
                            ),
                          ),
                        ),
                        Tab(
                          child: Center(
                            child: Text(
                              "Activity",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.0.height,
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Theme.of(context).cardColor),
                    child: TabBarView(children: [
                      SingleChildScrollView(
                        child: SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            spacing: 12.h,
                            runSpacing: 12.h,
                            children: List.generate(
                                nftView.listNft!.length,
                                (index) => cardNft(
                                    nftView.listNft![index], context, ref)),
                          ),
                        ),
                      ),
                      RefreshIndicator(
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
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 64.w),
                                )
                              ],
                            ),
                            itemBuilder: (context, item, index) => cardActivity(
                                context: context,
                                activity: item,
                                address: account?.addressETH ?? "",
                                chain: chain),
                          ),
                        ),
                      )
                    ]),
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget cardActivity(
      {required BuildContext context,
      required Activity activity,
      String? address,
      TokenChain? chain}) {
    String state = activity.from == address ? "Transfer" : "Receiced";
    return GestureDetector(
      onTap: () {},
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

  Widget cardNft(Nft nft, BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedNftProvider.notifier).changeValue(nft);
        ref.watch(selectedNftProvider);
        context.goNamed('detail_nft');
      },
      child: Container(
        height: 220.h,
        width: MediaQuery.of(context).size.width * 0.412,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Theme.of(context).colorScheme.background),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(6.h),
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8.r),
                  bottom: Radius.circular(4.r),
                ),
                child: Image.memory(
                  MethodHelper().convertBase64ToUint8List(
                    nft.imageByte ?? '',
                  ),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nft.name ?? '',
                    style: AppFont.medium14
                        .copyWith(color: Theme.of(context).indicatorColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "#${nft.tokenId}",
                    style: AppFont.reguler12
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                  8.0.height,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
