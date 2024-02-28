// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/data/src/app_chain_logo.dart';
import 'package:bee_wallet/utils/util.dart';
import '../../../../../config/config.dart';
import '../../../../../data/model/token_chain/selected_token_chain.dart';
import '../../../../provider/provider.dart';
import '../../../../widget/widget.dart';

final searSelectedChain = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

class AssetWallet extends ConsumerWidget {
  const AssetWallet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listChain = ref.watch(chainSelectedSearchProvider);
    final chain = ref.watch(selectedChainTokenProvider).valueOrNull ?? [];
    final chainList = (ref.watch(listTokenChainProvider).valueOrNull ?? []);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Balance",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              4.0.width,
              Icon(
                Icons.visibility_outlined,
                size: 14.w,
                color: Theme.of(context).hintColor,
              )
            ],
          ),
          4.0.height,
          Text(
            "\$${0.toStringAsFixed(2)}",
            style: AppFont.semibold30.copyWith(
                fontSize: 32, color: Theme.of(context).indicatorColor),
          ),
          4.0.height,
          Text(
            "\$${0.toStringAsFixed(2)} (+0.000%) Today",
            style: AppFont.medium12.copyWith(color: AppColor.greenColor),
          ),
          24.0.height,
          Row(
            children: [
              Expanded(
                  child: SearchField(
                controller: ref.watch(searSelectedChain),
                onChange: (v) {
                  ref.read(chainSelectedSearchProvider.notifier).onSearch(v);
                },
              )),
              8.0.width,
              GestureDetector(
                onTap: () {
                  context.goNamed('select_network');
                },
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    height: 48.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Theme.of(context).cardColor),
                    child: Row(
                      children: [
                        chainList.length != chain.length && chain.isNotEmpty
                            ? Image.asset(
                                chain.first.baseLogo ?? AppChainLogo.evm)
                            : Text(
                                "All",
                                style: AppFont.medium14
                                    .copyWith(color: AppColor.grayColor),
                              ),
                        2.0.width,
                        Icon(Icons.expand_more,
                            size: 24.w, color: AppColor.grayColor)
                      ],
                    )),
              ),
              8.0.width,
              GestureDetector(
                onTap: () {
                  context.goNamed('manage_token');
                },
                child: Container(
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      // border: Border.all(width: 1.w,color: AppColor.primaryColor),
                      color: Theme.of(context).cardColor),
                  child: Icon(
                    Icons.tune,
                    size: 24.w,
                    color: AppColor.grayColor,
                  ),
                ),
              )
            ],
          ),
          16.0.height,
          Expanded(
              child: RefreshIndicator(
            onRefresh: () async {
              ref.refresh(selectedChainTokenProvider);
            },
            child: listChain.isEmpty
                ? const Empty(title: "No Data")
                : ListView.builder(
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: cardChain(context, ref, listChain[index]),
                        ),
                    itemCount: listChain.length),
          ))
        ],
      ),
    );
  }

  Widget cardChain(
      BuildContext context, WidgetRef ref, SelectedTokenChain chain) {
    return GestureDetector(
      onTap: () {
        ref.read(chainDetailProvider.notifier).setChainDetail(chain);
        ref.watch(chainDetailProvider);
        context.goNamed('detail_token');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).cardColor),
        child: Row(
          children: [
            SizedBox(
              width: 36.w,
              height: 36.w,
              child: Stack(
                children: [
                  Container(
                    width: 34.w,
                    height: 34.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(chain.logo ?? ''))),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 14.w,
                      height: 14.w,
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
            8.0.width,
            Expanded(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${chain.symbol} (${chain.name})",
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    Text(
                      0.toStringAsFixed(0),
                      style: AppFont.medium16
                          .copyWith(color: Theme.of(context).indicatorColor),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${chain.balance ?? 0} ${chain.symbol}",
                      style: AppFont.reguler12
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                    Text(
                      "+2,75%",
                      style:
                          AppFont.medium12.copyWith(color: AppColor.greenColor),
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
}
