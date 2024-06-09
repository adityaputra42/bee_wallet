
import '../../../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../widget/widget.dart';
import 'package:go_router/go_router.dart';

class SheedPharseShow extends ConsumerWidget {
  const SheedPharseShow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mnemonic = ref.watch(selectedMnemonicProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        title: "Backup",
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).cardColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.0.height,
            Text(
              'Write down the Seed Phrase in order.',
              style: AppFont.medium14
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            16.0.height,
            Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 8.h,
                runSpacing: 8.h,
                direction: Axis.horizontal,
                children: mnemonic
                    .map(
                      (e) => cardPniomoni(context,
                          number: e['id'], text: e['data']),
                    )
                    .toList()),
            16.0.height,
            // Row(
            //   children: [
            //     Icon(
            //       Icons.check_rounded,
            //       color: Colors.green,
            //       size: 14.w,
            //     ),
            //     4.0.width,
            //     Text(
            //       'Recomend :',
            //       style: AppFont.medium12
            //           .copyWith(color: Theme.of(context).indicatorColor),
            //     )
            //   ],
            // ),
            // 8.0.height,
            // Text(
            //   'Write down on a piece of paper and store\nsomewhere secure.',
            //   style:
            //       AppFont.medium12.copyWith(color: Theme.of(context).hintColor),
            // ),
            // 16.0.height,
            // Row(
            //   children: [
            //     Icon(
            //       Icons.close_rounded,
            //       color: Colors.red,
            //       size: 14.w,
            //     ),
            //     4.0.width,
            //     Text(
            //       'Avoid :',
            //       style: AppFont.medium12
            //           .copyWith(color: Theme.of(context).indicatorColor),
            //     )
            //   ],
            // ),
            // 8.0.height,
            // Row(
            //   children: [
            //     Container(
            //       width: 6.w,
            //       height: 6.w,
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: Theme.of(context).hintColor),
            //     ),
            //     4.0.width,
            //     Text(
            //       'Do not screenshot or copy it to the clipboard',
            //       style: AppFont.medium12
            //           .copyWith(color: Theme.of(context).hintColor),
            //     )
            //   ],
            // ),
            // 2.0.height,
            // Row(
            //   children: [
            //     Container(
            //       width: 6.w,
            //       height: 6.w,
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: Theme.of(context).hintColor),
            //     ),
            //     4.0.width,
            //     Text(
            //       'Do not store the Seed Phrase online',
            //       style: AppFont.medium12
            //           .copyWith(color: Theme.of(context).hintColor),
            //     )
            //   ],
            // ),
            // 2.0.height,
            // Row(
            //   children: [
            //     Container(
            //       width: 6.w,
            //       height: 6.w,
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: Theme.of(context).hintColor),
            //     ),
            //     4.0.width,
            //     Text(
            //       'Do not send the Seed Phrase to anyone.',
            //       style: AppFont.medium12
            //           .copyWith(color: Theme.of(context).hintColor),
            //     )
            //   ],
            // ),
            // 16.0.height,
            // Text(
            //   "Learn more about Seed Phrase Code.",
            //   style: AppFont.medium12.copyWith(color: AppColor.primaryColor),
            // ),
            const Spacer(),
            PrimaryButton(
              title: 'Close',
              onPressed: () {
                context.pop();
                context.pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget cardPniomoni(BuildContext context,
      {required int number, required String text}) {
    return Container(
      // height: 42.h,
      width: MediaQuery.of(context).size.width * 0.41,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 0.1,
                spreadRadius: 0.1,
                color: AppColor.grayColor.withOpacity(0.15))
          ],
          borderRadius: BorderRadius.circular(8.r),
          color: Theme.of(context).colorScheme.surface),
      child: Text("$number. $text",
          style: AppFont.medium12.copyWith(
            color: Theme.of(context).indicatorColor,
          )),
    );
  }
}
