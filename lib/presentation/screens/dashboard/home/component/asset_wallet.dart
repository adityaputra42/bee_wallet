// ignore_for_file: unused_result

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/data/src/app_chain_logo.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import '../../../../../config/config.dart';
import '../../../../../data/model/token_chain/selected_token_chain.dart';
import '../../../../../data/src/src.dart';
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
          16.0.height,
          Text(
            "\$${0.toStringAsFixed(2)}",
            style: AppFont.semibold30.copyWith(
                fontSize: 32, color: Theme.of(context).indicatorColor),
          ),
          4.0.height,
          Text(
            "Estimate Balance in USD",
            style:
                AppFont.medium12.copyWith(color: Theme.of(context).hintColor),
          ),
          24.0.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                            ? SizedBox(
                                width: 32.w,
                                height: 32.w,
                                child: ClipPolygon(
                                    sides: 6,
                                    child: Image.asset(
                                      chain.first.baseLogo ?? AppChainLogo.evm,
                                      fit: BoxFit.cover,
                                    )),
                              )
                            : Iconify(
                                MaterialSymbols.widgets_outline_rounded,
                                size: 24.w,
                                color: AppColor.grayColor,
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
              child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).cardColor),
            child: RefreshIndicator(
              onRefresh: () async {
                ref.refresh(selectedChainTokenProvider);
              },
              child: listChain.isEmpty
                  ? const Empty(title: "No Data")
                  : ListView.builder(
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: cardChain(context, ref, listChain[index]),
                          ),
                      itemCount: listChain.length),
            ),
          )),
          16.0.height,
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
            borderRadius: BorderRadius.circular(8.r),
            color: Theme.of(context).colorScheme.background),
        child: Row(
          children: [
            SizedBox(
              width: 36.w,
              height: 36.w,
              child: Stack(
                children: [
                  SizedBox(
                    width: 36.w,
                    height: 36.w,
                    child: ClipPolygon(
                      sides: 6,
                      child: Container(
                        padding: EdgeInsets.all(0.5.h),
                        color: Theme.of(context).colorScheme.background,
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
                                    width: 0.3.w,
                                    color: Theme.of(context).cardColor),
                                color:
                                    Theme.of(context).colorScheme.background),
                            child:
                                Image.asset(chain.baseLogo ?? AppImage.logo)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            12.0.width,
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${chain.name}",
                        style: AppFont.semibold14
                            .copyWith(color: Theme.of(context).indicatorColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    16.0.width,
                    Text(
                      "${chain.balance ?? 0} ${chain.symbol}",
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                  ],
                ),
                2.0.height,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${chain.symbol}",
                        style: AppFont.reguler12
                            .copyWith(color: Theme.of(context).hintColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    16.0.width,
                    Text(
                      "~\$ 0.0",
                      style:
                          AppFont.medium12.copyWith(color:Theme.of(context).hintColor),
                    ),
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
