import 'package:bee_wallet/data/src/app_image.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget.dart';
import 'components/new_dapps.dart';
import 'components/sheet_select_network.dart';

final indexbarDapp = StateProvider.autoDispose<int>((ref) => 0);

class DappScreen extends ConsumerWidget {
  const DappScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listChain = ref.watch(listChainSearchProvider);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          shadowColor: AppColor.grayColor,
          title: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: SearchField(
                controller: ref.watch(searchWebProvider),
                onEditingComplete: () {
                  if (ref.watch(searchWebProvider).text.isNotEmpty) {
                    if (ref.watch(chainDappProvider).chainId != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DappsWeb3(
                                    initialUrl:
                                        ref.watch(searchWebProvider).text,
                                  )));
                    } else {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => SheetSelectNetworkDapp(
                                url: ref.watch(searchWebProvider).text,
                              ),
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          showDragHandle: true,
                          isDismissible: false,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16.r))));
                    }
                  }
                },
              )),
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          toolbarHeight: 76.h,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.0.height,
            overview(ref),
            16.0.height,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "History",
                    style: AppFont.medium14
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                  Text(
                    "See All",
                    style:
                        AppFont.medium14.copyWith(color: AppColor.primaryColor),
                  ),
                ],
              ),
            ),
            16.0.height,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    5,
                    (index) => Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? 16.w : 0,
                              right: index == 4 ? 16.w : 12.w),
                          child: SizedBox(
                            width: 54.w,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 42.w,
                                  height: 42.w,
                                  child: ClipPolygon(
                                      sides: 6,
                                      child:
                                          Image.asset(AppImage.defaultBrowser)),
                                ),
                                8.0.height,
                                Text(
                                  "Pancake",
                                  style: AppFont.reguler12.copyWith(
                                      color: Theme.of(context).indicatorColor),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        )),
              ),
            ),
            16.0.height,
            Expanded(
              child: DefaultTabController(
                length: listChain.length,
                initialIndex: ref.watch(indexbarDapp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
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
                            ref.read(indexbarDapp.notifier).state = index;
                            ref
                                .read(tokenChainNftProvider.notifier)
                                .onChange(listChain[index]);
                          },
                          tabs: List.generate(
                              listChain.length,
                              (index) => Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 8.h),
                                    margin: EdgeInsets.only(
                                        left:
                                            listChain[index] == listChain.first
                                                ? 16.w
                                                : 0,
                                        right:
                                            listChain[index] == listChain.last
                                                ? 16.w
                                                : 12.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color: ref.watch(indexbarDapp) == index
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
                                          style: AppFont.medium12.copyWith(
                                              color: ref.watch(indexbarDapp) ==
                                                      index
                                                  ? AppColor.textStrongLight
                                                  : Theme.of(context)
                                                      .hintColor),
                                        ),
                                      ],
                                    ),
                                  ))),
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(16.w),
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).cardColor),
                      child: ListView.builder(
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 8.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Theme.of(context).colorScheme.background),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 36.w,
                                height: 36.w,
                                child: ClipPolygon(
                                  sides: 6,
                                  child: Container(
                                    padding: EdgeInsets.all(0.5.h),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    child: Image.asset(
                                      AppImage.logo,
                                    ),
                                  ),
                                ),
                              ),
                              8.0.width,
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pancake Swap",
                                    style: AppFont.medium12.copyWith(
                                        color:
                                            Theme.of(context).indicatorColor),
                                  ),
                                  1.0.height,
                                  Text(
                                    "Exchange trading web earn stacking fjasiufg97 er8jashckj",
                                    style: AppFont.reguler10.copyWith(
                                        color: Theme.of(context).hintColor),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ))
                            ],
                          ),
                        ),
                        itemCount: 6,
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget overview(WidgetRef ref) {
    return SizedBox(
      height: 122.h,
      child: Stack(
        children: [
          CarouselSlider(
              items: List.generate(
                  ref.watch(newsDappProvider).length,
                  (index) => Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 1.h),
                        width: double.infinity,
                        height: 120.h,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0.5.w,
                                  blurRadius: 0.3.w,
                                  color: Colors.white12)
                            ],
                            borderRadius: BorderRadius.circular(8.r),
                            image: DecorationImage(
                                image: NetworkImage(
                                    ref.watch(newsDappProvider)[index]),
                                fit: BoxFit.cover)),
                      )),
              options: CarouselOptions(
                  height: 122.h,
                  viewportFraction: 1,
                  autoPlay: true,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    ref.read(indexCarouselProvider.notifier).changeIndex(index);
                  })),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(ref.watch(newsDappProvider).length,
                      (indexValue) {
                    int index = indexValue - 1;
                    index++;
                    return indicator(index, ref);
                  })),
            ),
          )
        ],
      ),
    );
  }

  Widget indicator(int index, WidgetRef ref) {
    return Container(
      width: ref.watch(indexCarouselProvider) == index ? 30.w : 6.w,
      height: 6.w,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          color: ref.watch(indexCarouselProvider) == index
              ? AppColor.primaryColor
              : AppColor.grayColor,
          borderRadius: BorderRadius.circular(3.w)),
    );
  }
}
