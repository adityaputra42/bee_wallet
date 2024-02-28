import 'package:carousel_slider/carousel_slider.dart';

import '../../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../provider/provider.dart';
import '../../../widget/widget.dart';
import 'components/new_dapps.dart';
import 'components/sheet_select_network.dart';

class DappScreen extends ConsumerWidget {
  const DappScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          shadowColor: AppColor.grayColor,
          title: Padding(
              padding: EdgeInsets.fromLTRB(0, 12.h, 0, 0),
              child: SearchField(
                controller: ref.watch(searchWebProvider),
                // onChange: (value) => controller.setSearch(value),
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
        body: ListView(
          children: [
            16.0.height,
            overview(ref),
            16.0.height,
            _hot(context, ref),
            16.0.height,
            _deFi(context, ref),
            16.0.height,
            _bsc(context, ref),
            16.0.height,
            _eth(context, ref),
            16.0.height,
          ],
        ));
  }

  Column _hot(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Text(
            'Hot',
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
        ),
        8.0.height,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
            ref.watch(favoriteDappProvider).length,
            (index) => Padding(
              padding:
                  EdgeInsets.only(left: index == 0 ? 16.w : 0, right: 16.w),
              child: cardDappHot(
                  ref.watch(favoriteDappProvider)[index], context, ref),
            ),
          )),
        )
      ],
    );
  }

  Widget _deFi(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DeFi',
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          8.0.height,
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 16.h,
            runSpacing: 16.h,
            direction: Axis.horizontal,
            children: List.generate(
              ref.watch(favoriteDappProvider).length,
              (index) => cardDapp(
                  context, ref.watch(favoriteDappProvider)[index], ref),
            ),
          )
        ],
      ),
    );
  }

  Widget _bsc(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'BSC',
                style: AppFont.medium14
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
              Row(
                children: [
                  Text(
                    'More',
                    style:
                        AppFont.medium14.copyWith(color: AppColor.primaryColor),
                  ),
                  4.0.width,
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20.w,
                    color: AppColor.primaryColor,
                  )
                ],
              )
            ],
          ),
          8.0.height,
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 16.h,
            runSpacing: 16.h,
            direction: Axis.horizontal,
            children: List.generate(
              ref.watch(favoriteDappProvider).length,
              (index) => cardDapp(
                  context, ref.watch(favoriteDappProvider)[index], ref),
            ),
          )
        ],
      ),
    );
  }

  Widget _eth(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ETH',
                style: AppFont.medium14
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
              Row(
                children: [
                  Text(
                    'More',
                    style:
                        AppFont.medium14.copyWith(color: AppColor.primaryColor),
                  ),
                  4.0.width,
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20.w,
                    color: AppColor.primaryColor,
                  )
                ],
              )
            ],
          ),
          8.0.height,
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            spacing: 16.h,
            runSpacing: 16.h,
            direction: Axis.horizontal,
            children: List.generate(
              ref.watch(favoriteDappProvider).length,
              (index) => cardDapp(
                  context, ref.watch(favoriteDappProvider)[index], ref),
            ),
          )
        ],
      ),
    );
  }

  Widget cardDapp(
      BuildContext context, Map<String, dynamic> favorite, WidgetRef ref) {
    return SizedBox(
      width: ScreenUtil().screenWidth * 0.42,
      child: GestureDetector(
        onTap: () {
          if (ref.watch(chainDappProvider).chainId != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DappsWeb3(initialUrl: favorite['link'])));
          } else {
            showModalBottomSheet(
                context: context,
                builder: (context) =>
                    SheetSelectNetworkDapp(url: favorite['link']),
                backgroundColor: Theme.of(context).colorScheme.background,
                showDragHandle: true,
                isDismissible: false,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16.r))));
          }
        },
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColor.cardLight,
                  image: DecorationImage(
                      image: AssetImage(favorite['image']), fit: BoxFit.cover)),
            ),
            8.0.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    favorite['title'],
                    style: AppFont.medium12
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                  Text(
                    favorite['subtitle'],
                    style: AppFont.reguler10
                        .copyWith(color: Theme.of(context).hintColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget overview(WidgetRef ref) {
    return SizedBox(
      height: 198.h,
      child: Stack(
        children: [
          CarouselSlider(
              items: List.generate(
                  ref.watch(newsDappProvider).length,
                  (index) => Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 1.h),
                        width: double.infinity,
                        height: 196.h,
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
                  height: 198.h,
                  viewportFraction: 1,
                  autoPlay: true,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    ref.read(indexCarouselProvider.notifier).changeIndex(index);
                  })),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 12.h),
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
      width: ref.watch(indexCarouselProvider) == index ? 40.w : 8.w,
      height: 8.w,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
          color: ref.watch(indexCarouselProvider) == index
              ? AppColor.primaryColor
              : AppColor.grayColor,
          borderRadius: BorderRadius.circular(3.w)),
    );
  }

  Widget cardDappHot(
      Map<String, dynamic> favorite, BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (ref.watch(chainDappProvider).chainId != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DappsWeb3(initialUrl: favorite['link'])));
        } else {
          showModalBottomSheet(
              context: context,
              builder: (context) =>
                  SheetSelectNetworkDapp(url: favorite['link']),
              backgroundColor: Theme.of(context).colorScheme.background,
              showDragHandle: true,
              isDismissible: false,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(16.r))));
        }
      },
      child: Column(
        children: [
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColor.cardLight,
                image: DecorationImage(
                    image: AssetImage(favorite['image']), fit: BoxFit.cover)),
          ),
          8.0.height,
          Text(
            favorite['title'],
            style: AppFont.reguler10
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
        ],
      ),
    );
  }
}
