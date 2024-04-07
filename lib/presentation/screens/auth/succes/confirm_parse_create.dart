import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../../utils/util.dart';
import '../../../provider/backup/backup_provider.dart';
import '../../../widget/widget.dart';

class ConfirmPharseCreate extends ConsumerWidget {
  const ConfirmPharseCreate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var confirmList = ref.watch(confirmMnemonicProvider);
    var random = ref.watch(randomMnemonicProvider);
    Widget cardPniomoni({
      required int number,
    }) {
      return DragTarget(
        onAcceptWithDetails: (details) {
          if (!confirmList.any((element) => element['id'] == number) ||
              confirmList.isEmpty) {
            ref
                .read(confirmMnemonicProvider.notifier)
                .add(number, details.data.toString());
            ref
                .read(randomMnemonicProvider.notifier)
                .removeRandomMnemonic(details.data.toString());

            ref.read(disableConfirmProvider.notifier).checkButtonConfirm();
          }
        },
        builder: (
          context,
          accepted,
          rejected,
        ) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
            height: 42.h,
            width: MediaQuery.of(context).size.width * 0.43,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).cardColor),
            child: Text(
                "$number. ${confirmList.singleWhere((element) => element['id'] == number, orElse: () => <String, dynamic>{})['data'] ?? ''}",
                style: AppFont.medium14.copyWith(
                  color: Theme.of(context).hintColor,
                )),
          );
        },
      );
    }

    Widget cardPilihan({required String text}) {
      return GestureDetector(
        onTap: () {
          ref.read(confirmMnemonicProvider.notifier).addOnClick(text);
        },
        child: Draggable(
          data: text,
          feedback: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            height: 42.h,
            width: MediaQuery.of(context).size.width * 0.282,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).primaryColor),
            child: Center(
              child: Text(text,
                  style: AppFont.medium14.copyWith(
                    color: AppColor.textStrongLight,
                  )),
            ),
          ),
          childWhenDragging: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            height: 42.h,
            width: MediaQuery.of(context).size.width * 0.282,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.1.h,
                      spreadRadius: 0.1.h,
                      color: Colors.black12)
                ],
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).cardColor),
            child: Center(
              child: Text(text,
                  style: AppFont.medium14.copyWith(
                    color: AppColor.grayColor,
                  )),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            height: 42.h,
            width: MediaQuery.of(context).size.width * 0.282,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.1.h,
                      spreadRadius: 0.1.h,
                      color: AppColor.grayColor.withOpacity(0.25))
                ],
                borderRadius: BorderRadius.circular(8.r),
                color: AppColor.primaryColor),
            child: Center(
              child: Text(text,
                  style: AppFont.medium14.copyWith(
                    color: AppColor.textStrongLight,
                  )),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: WidgetHelper.appBar(
        context: context,
        title: "Back Up Pharse",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.0.height,
            Text(
              'Enter Your Secret Recovery Phrase',
              style: AppFont.semibold18
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            4.0.height,
            Text(
              'Drag and drop to sort your phrases exactly as you saw them on the previous screen',
              style: AppFont.reguler14
                  .copyWith(color: Theme.of(context).hintColor),
            ),
            16.0.height,
            Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 8.h,
                runSpacing: 8.h,
                direction: Axis.horizontal,
                children: [
                  cardPniomoni(
                    number: 1,
                  ),
                  cardPniomoni(
                    number: 2,
                  ),
                  cardPniomoni(
                    number: 3,
                  ),
                  cardPniomoni(
                    number: 4,
                  ),
                  cardPniomoni(
                    number: 5,
                  ),
                  cardPniomoni(
                    number: 6,
                  ),
                  cardPniomoni(
                    number: 7,
                  ),
                  cardPniomoni(
                    number: 8,
                  ),
                  cardPniomoni(
                    number: 9,
                  ),
                  cardPniomoni(
                    number: 10,
                  ),
                  cardPniomoni(
                    number: 11,
                  ),
                  cardPniomoni(
                    number: 12,
                  ),
                ]),
            24.0.height,
            random.isEmpty
                ? const SizedBox()
                : Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    spacing: 8.h,
                    runSpacing: 8.h,
                    direction: Axis.horizontal,
                    children: random
                        .map((element) => cardPilihan(text: element['data']))
                        .toList()),
          ],
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        title: 'Verify',
        disable: true,
        onPressed: () {
          ref
              .read(confirmMnemonicProvider.notifier)
              .validatePharse(ref, context);
        },
        margin:
            EdgeInsets.only(top: 8.h, bottom: 36.w, left: 16.w, right: 16.w),
      ),
    );
  }
}
