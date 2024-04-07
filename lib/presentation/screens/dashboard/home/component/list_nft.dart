// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/utils/util.dart';

import '../../../../../config/config.dart';
import '../../../../../data/model/model.dart';
import '../../../../widget/widget.dart';
import 'sheet_add_nft.dart';

final indexbarNft = StateProvider.autoDispose<int>((ref) => 0);
final searchNft = StateProvider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

class ListNft extends ConsumerWidget {
  const ListNft({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listChain = ref.watch(listChainSearchProvider);
    return DefaultTabController(
      length: listChain.length,
      initialIndex: ref.watch(indexbarNft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 48.h,
            child: TabBar(
                automaticIndicatorColorAdjustment: false,
                isScrollable: true,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                labelColor: Theme.of(context).indicatorColor,
                labelPadding: EdgeInsets.zero,
                labelStyle: AppFont.semibold14,
                unselectedLabelColor: AppColor.grayColor,
                unselectedLabelStyle: AppFont.medium14,
                indicatorSize: TabBarIndicatorSize.label,
                onTap: (index) {
                  ref.read(indexbarNft.notifier).state = index;
                  ref
                      .read(tokenChainNftProvider.notifier)
                      .onChange(listChain[index]);
                  ref.read(searchNft).clear();
                },
                tabs: List.generate(
                    listChain.length,
                    (index) => Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.h),
                          margin: EdgeInsets.only(
                              left: listChain[index] == listChain.first
                                  ? 24.w
                                  : 0,
                              right: listChain[index] == listChain.last
                                  ? 24.w
                                  : 12.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: ref.watch(indexbarNft) == index
                                ? AppColor.primaryColor
                                : Theme.of(context).cardColor,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 24.w,
                                height: 24.w,
                                child: ClipPolygon(
                                  sides: 6,
                                  child: Container(
                                    padding: EdgeInsets.all(0.5.h),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    child: Image.asset(
                                      listChain[index].logo ?? '',
                                    ),
                                  ),
                                ),
                              ),
                              8.0.width,
                              Text(
                                listChain[index].symbol ?? '',
                                style: AppFont.medium14.copyWith(
                                    color: ref.watch(indexbarNft) == index
                                        ? AppColor.textStrongDark
                                        : Theme.of(context).hintColor),
                              ),
                            ],
                          ),
                        ))),
          ),
          8.0.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: SearchField(
                  controller: ref.watch(searchNft),
                  onChange: (v) =>
                      ref.read(listViewNftProvider.notifier).onSearch(v),
                )),
                8.0.width,
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => const SheetAddNft(),
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        isScrollControlled: true,
                        showDragHandle: true,
                        useSafeArea: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.r))));
                  },
                  child: Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        // border: Border.all(width: 1.w,color: AppColor.primaryColor),
                        color: Theme.of(context).cardColor),
                    child: Icon(
                      Icons.add_rounded,
                      size: 32.w,
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).cardColor),
            child: ref.watch(listNftProvider).when(
              data: (data) {
                final nftViews = ref.watch(listViewNftProvider);
                return nftViews.isEmpty
                    ? const Empty(
                        title: "NFT Not found",
                        width: 120,
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: cardNft(context, nftViews[index], ref),
                        ),
                        itemCount: nftViews.length,
                      );
              },
              error: (Object error, StackTrace stackTrace) {
                return ErrorView(
                  error: error.toString(),
                  ontap: () {
                    ref.refresh(listNftProvider);
                  },
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ))
        ],
      ),
    );
  }

  Widget cardNft(
    BuildContext context,
    NftView nft,
    WidgetRef ref,
  ) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedViewNftProvider.notifier).changeValue(nft);
        ref.watch(selectedViewNftProvider);
        context.goNamed("detail_nft_view");
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Theme.of(context).colorScheme.background),
        child: Row(
          children: [
            SizedBox(
              width: 42.w,
              height: 42.w,
              child: ClipPolygon(
                sides: 6,
                child: Container(
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                  ),
                  child: ClipPolygon(
                    sides: 6,
                    child: Container(
                      padding: EdgeInsets.all(1.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                      ),
                      child: Image.memory(
                        MethodHelper()
                            .convertBase64ToUint8List(nft.image ?? ''),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ),
            8.0.width,
            Expanded(
              child: Text(
                nft.name ?? "",
                style: AppFont.medium16
                    .copyWith(color: Theme.of(context).indicatorColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            16.0.width,
            Text(
              "${nft.length} Items",
              style: AppFont.medium14.copyWith(
                  fontFamily: "Roboto", color: Theme.of(context).hintColor),
            )
          ],
        ),
      ),
    );
  }
}
