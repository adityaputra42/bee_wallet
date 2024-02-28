import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: WidgetHelper.appBar(
            context: context, title: "Activity", isCanBack: false),
        body: Container(
          margin: EdgeInsets.all(16.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Theme.of(context).cardColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recent Transaction",
                style: AppFont.medium12
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              16.0.height,
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) => cardActivity(context),
                itemCount: 20,
              ))
            ],
          ),
        ));
  }

  Widget cardActivity(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                Icons.arrow_upward,
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
                      'Send ETH',
                      style: AppFont.medium14
                          .copyWith(color: Theme.of(context).indicatorColor),
                    ),
                    Text(
                      DateFormat("hh:mm a")
                          .format(DateTime.now())
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
                      "to : ${MethodHelper().shortAddress(address: "0xfhastri7uhknsvdtfpewfgskjhdcg", length: 5)}",
                      style: AppFont.reguler12
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                    Text(
                      '${1.122.toStringAsFixed(4)} ETH',
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
}
