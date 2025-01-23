import '../../../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).cardColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(16),
            Text(
              'Write down the Seed Phrase in order.',
              style: AppFont.medium14
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            height(16),
            Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                direction: Axis.horizontal,
                children: mnemonic
                    .map(
                      (e) => cardPniomoni(context,
                          number: e['id'], text: e['data']),
                    )
                    .toList()),
            height(16),
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
            // height(16),
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
            // height(16),
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
      // height: 42,
      width: MediaQuery.of(context).size.width * 0.41,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 0.1,
                spreadRadius: 0.1,
                color: AppColor.grayColor.withValues(alpha: 0.15))
          ],
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.surface),
      child: Text("$number. $text",
          style: AppFont.medium12.copyWith(
            color: Theme.of(context).indicatorColor,
          )),
    );
  }
}
