import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/config.dart';
import '../../../../../utils/util.dart';
import '../../../../provider/backup/backup_provider.dart';
import '../../../../widget/widget.dart';

class ConfirmPharseSetting extends ConsumerWidget {
  const ConfirmPharseSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var confirmList = ref.watch(confirmMnemonicProvider);
    var random = ref.watch(randomMnemonicProvider);
    Widget cardPniomoni({
      required int number,
    }) {
      return DragTarget(
        onAccept: (String value) {
          if (!confirmList.any((element) => element['id'] == number) ||
              confirmList.isEmpty) {
            ref.read(confirmMnemonicProvider.notifier).add(number, value);
            ref
                .read(randomMnemonicProvider.notifier)
                .removeRandomMnemonic(value);

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
            height: 36.h,
            width: MediaQuery.of(context).size.width * 0.247,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.5.h,
                      spreadRadius: 0.5.h,
                      color: AppColor.grayColor.withOpacity(0.15))
                ],
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).cardColor),
            child: Text(
                "$number. ${confirmList.singleWhere((element) => element['id'] == number, orElse: () => <String, dynamic>{})['data'] ?? ''}",
                style: AppFont.medium12.copyWith(
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
            height: 36.h,
            width: MediaQuery.of(context).size.width * 0.247,
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
                  style: AppFont.medium12.copyWith(
                    color: Theme.of(context).indicatorColor,
                  )),
            ),
          ),
          childWhenDragging: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            height: 36.h,
            width: MediaQuery.of(context).size.width * 0.247,
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
                  style: AppFont.medium12.copyWith(
                    color: AppColor.grayColor,
                  )),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            height: 36.h,
            width: MediaQuery.of(context).size.width * 0.247,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.1.h,
                      spreadRadius: 0.1.h,
                      color: AppColor.grayColor.withOpacity(0.25))
                ],
                borderRadius: BorderRadius.circular(8.r),
                color: Theme.of(context).cardColor),
            child: Center(
              child: Text(text,
                  style: AppFont.medium12
                      .copyWith(color: Theme.of(context).indicatorColor)),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
            Text(
              'Write down the Seed Phrase in order.',
              style: AppFont.medium16
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            16.0.height,
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        color: AppColor.grayColor.withOpacity(0.25))
                  ],
                  borderRadius: BorderRadius.circular(12.r),
                  color: Theme.of(context).colorScheme.background),
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  spacing: 12.h,
                  runSpacing: 12.h,
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
            ),
            random.isEmpty
                ? const SizedBox()
                : Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 16.h),
                    padding: EdgeInsets.all(12.h),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0.5,
                              spreadRadius: 0.5,
                              color: AppColor.grayColor.withOpacity(0.25))
                        ],
                        borderRadius: BorderRadius.circular(12.r),
                        color: Theme.of(context).colorScheme.background),
                    child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runAlignment: WrapAlignment.center,
                        alignment: WrapAlignment.center,
                        spacing: 12.h,
                        runSpacing: 12.h,
                        direction: Axis.horizontal,
                        children: random
                            .map(
                                (element) => cardPilihan(text: element['data']))
                            .toList()),
                  ),
            const Spacer(),
            PrimaryButton(
              title: 'Verify',
              onPressed: () {
                ref
                    .read(confirmMnemonicProvider.notifier)
                    .validatePharse(ref, context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
