import 'package:go_router/go_router.dart';

import '../../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../provider/backup/backup_provider.dart';
import '../../../widget/widget.dart';

class SheedPharseCreate extends ConsumerWidget {
  const SheedPharseCreate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mnemonic = ref.watch(parseMnemonicProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        title: "Back Up Pharse",
      ),
      bottomNavigationBar: PrimaryButton(
        title: 'Continue',
        onPressed: () {
          ref
              .read(randomMnemonicProvider.notifier)
              .setRandomMnemonic(ref.watch(parseMnemonicProvider));
          if (ref.watch(randomMnemonicProvider).isNotEmpty) {
            context.goNamed('confirm_parse_create');
          }
        },
        margin: EdgeInsets.only(bottom: 36.w, left: 16.w, right: 16.w),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.0.height,
              Text(
                'Secret recovery phrase',
                style: AppFont.semibold18
                    .copyWith(color: Theme.of(context).indicatorColor),
              ),
              4.0.height,
              Text(
                'This 12-word phrase allows you to recover your wallet and access to the coins inside.',
                style: AppFont.reguler14
                    .copyWith(color: Theme.of(context).hintColor),
              ),
              16.0.height,
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: 16.h,
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
              //   style: AppFont.medium12
              //       .copyWith(color: Theme.of(context).hintColor),
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
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget cardPniomoni(BuildContext context,
      {required int number, required String text}) {
    return Container(
      height: 42.h,
      width: MediaQuery.of(context).size.width * 0.42,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 0.1,
                spreadRadius: 0.1,
                color: AppColor.grayColor.withOpacity(0.15))
          ],
          borderRadius: BorderRadius.circular(4.r),
          color: Theme.of(context).cardColor),
      child: Text("$number. $text",
          style: AppFont.medium14.copyWith(
            color: Theme.of(context).indicatorColor,
          )),
    );
  }
}
