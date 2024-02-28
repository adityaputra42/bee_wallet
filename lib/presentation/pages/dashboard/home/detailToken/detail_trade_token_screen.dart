import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bee_wallet/config/config.dart';
import 'package:bee_wallet/presentation/provider/chain/chain_provider.dart';

import '../../../../../utils/util.dart';

class DetailTradeTokenScreen extends ConsumerWidget {
  const DetailTradeTokenScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chain = ref.watch(chainDetailProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
        context: context,
        title: "${chain.name} (${chain.symbol})",
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            overviewChart(context),
            16.0.height,
            Expanded(
                child: DefaultTabController(
              length: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 48.h,
                    child: TabBar(
                      automaticIndicatorColorAdjustment: false,
                      isScrollable: false,
                      dividerColor: AppColor.primaryColor,
                      indicatorColor: AppColor.primaryColor,
                      labelColor: Theme.of(context).indicatorColor,
                      labelPadding: EdgeInsets.zero,
                      labelStyle: AppFont.semibold14,
                      unselectedLabelColor: AppColor.grayColor,
                      unselectedLabelStyle: AppFont.medium14,
                      indicatorSize: TabBarIndicatorSize.tab,
                      onTap: (index) {},
                      tabs: const [
                        Tab(
                          child: Text(
                            "Performance",
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Status",
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.0.height,
                  Expanded(
                      child: TabBarView(children: [
                    cardPerformance(context),
                    cardStatus(context)
                  ]))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Container cardStatus(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).cardColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Status",
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          16.0.height,
          SizedBox(
            width: double.infinity,
            height: 1.h,
            child: Divider(
              thickness: 1.h,
              color: AppColor.grayColor,
            ),
          ),
          16.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Market Cap",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                "\$251.688B USD",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
            ],
          ),
          16.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Currect Volume",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                "\$8.859B USD",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
            ],
          ),
          16.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Max Volume",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                "\$65.212B USD",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
            ],
          ),
          16.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1 Year Low",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                "\$1,165.98 USD",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
            ],
          ),
          16.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1 Year High",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                "\$2,128.61 USD",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
            ],
          ),
          16.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Contract Address",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Row(
                children: [
                  Text(
                    MethodHelper().shortAddress(
                        address: "0xfjas68i2ubdfghsf86cr8hjfbdgufodasnicu",
                        length: 5),
                    style: AppFont.medium12
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                  8.0.width,
                  Icon(
                    Icons.copy_rounded,
                    size: 16.w,
                    color: AppColor.primaryColor,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container cardPerformance(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).cardColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Performance",
            style: AppFont.medium14
                .copyWith(color: Theme.of(context).indicatorColor),
          ),
          16.0.height,
          SizedBox(
            width: double.infinity,
            height: 1.h,
            child: Divider(
              thickness: 1.h,
              color: AppColor.grayColor,
            ),
          ),
          16.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1 Day",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                "\$0.00 USD",
                style: AppFont.medium12.copyWith(color: AppColor.greenColor),
              ),
            ],
          ),
          16.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1 Week",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                "\$0.00 USD",
                style: AppFont.medium12.copyWith(color: AppColor.greenColor),
              ),
            ],
          ),
          16.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1 Month",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                "\$0.00 USD",
                style: AppFont.medium12.copyWith(color: AppColor.greenColor),
              ),
            ],
          ),
          16.0.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "1 Year",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              Text(
                "\$0.00 USD",
                style: AppFont.medium12.copyWith(color: AppColor.greenColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget overviewChart(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final chain = ref.watch(chainDetailProvider);
      return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).cardColor),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  chain.logo ?? '',
                  width: 32.w,
                ),
                8.0.width,
                Expanded(
                  child: Text(
                    '${chain.name} (${chain.symbol})',
                    style: AppFont.semibold16
                        .copyWith(color: Theme.of(context).indicatorColor),
                  ),
                )
              ],
            ),
            16.0.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${99.09382739.toStringAsFixed(2)}',
                        style: AppFont.semibold16
                            .copyWith(color: Theme.of(context).indicatorColor),
                      ),
                      4.0.height,
                      Text(
                        '+0.423%',
                        style: AppFont.reguler12
                            .copyWith(color: AppColor.greenColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 42.h,
                  width: ScreenUtil().screenWidth * 0.2,
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none),
                    hint: Text(time[2],
                        style: AppFont.medium12
                            .copyWith(color: Theme.of(context).indicatorColor)),
                    items: time
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item,
                                  style: AppFont.medium12.copyWith(
                                      color: Theme.of(context).indicatorColor)),
                            ))
                        .toList(),
                    onChanged: (value) {},
                    buttonStyleData: ButtonStyleData(
                      height: 30.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: Theme.of(context).colorScheme.background),
                      padding: EdgeInsets.only(right: 2.w),
                    ),
                    iconStyleData: IconStyleData(
                      icon: const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: AppColor.grayColor,
                      ),
                      iconSize: 24.w,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      height: 24.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 160.h,
              child: Sparkline(
                data: const [1.7, 1.0, 2.2, 1.4, 1.9, 1.8, 1.2],
                fillMode: FillMode.below,
                useCubicSmoothing: true,
                sharpCorners: true,
                cubicSmoothingFactor: 0.2,
                min: 0,
                max: 3,
                lineColor: AppColor.greenColor,
                fillGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColor.greenColor,
                    AppColor.greenColor.withOpacity(0.1),
                  ],
                ),
              ),
            ),
            16.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mon",
                  style: AppFont.medium12
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  "Mon",
                  style: AppFont.medium12
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  "Tue",
                  style: AppFont.medium12
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  "Wed",
                  style: AppFont.medium12
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  "Thu",
                  style: AppFont.medium12
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  "Fre",
                  style: AppFont.medium12
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  "Sat",
                  style: AppFont.medium12
                      .copyWith(color: Theme.of(context).hintColor),
                ),
              ],
            ),
            16.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "24h Vol (USDT)",
                  style: AppFont.reguler14
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  "24h High",
                  style: AppFont.reguler14
                      .copyWith(color: Theme.of(context).hintColor),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "503.92M",
                  style: AppFont.reguler12
                      .copyWith(color: Theme.of(context).indicatorColor),
                ),
                Text(
                  "\$ 0.525903",
                  style: AppFont.reguler12
                      .copyWith(color: Theme.of(context).indicatorColor),
                ),
              ],
            ),
            8.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Market Cap",
                  style: AppFont.reguler14
                      .copyWith(color: Theme.of(context).hintColor),
                ),
                Text(
                  "24h Low",
                  style: AppFont.reguler14
                      .copyWith(color: Theme.of(context).hintColor),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "14.22B",
                  style: AppFont.reguler12
                      .copyWith(color: Theme.of(context).indicatorColor),
                ),
                Text(
                  "\$ 0.215353",
                  style: AppFont.reguler12
                      .copyWith(color: Theme.of(context).indicatorColor),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}

final List<String> time = [
  '1h',
  '6h',
  '12h',
  '1d',
  '3d',
  '7d',
  '14d',
  '30d',
];
