import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).cardColor),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "$number. ${confirmList.singleWhere((element) => element['id'] == number, orElse: () => <String, dynamic>{})['data'] ?? ''}",
                  style: AppFont.medium14.copyWith(
                    color: Theme.of(context).indicatorColor,
                  )),
            ),
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor),
            child: Center(
              child: Text(text,
                  style: AppFont.medium14.copyWith(
                    color: AppColor.lightText1,
                  )),
            ),
          ),
          childWhenDragging: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.1, spreadRadius: 0.1, color: Colors.black12)
                ],
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).cardColor),
            child: Center(
              child: Text(text,
                  style: AppFont.medium14.copyWith(
                    color: AppColor.grayColor,
                  )),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.1,
                      spreadRadius: 0.1,
                      color: AppColor.grayColor.withValues(alpha: 0.25))
                ],
                borderRadius: BorderRadius.circular(8),
                color: AppColor.primaryColor),
            child: Center(
              child: Text(text,
                  style: AppFont.medium14.copyWith(
                    color: AppColor.lightText1,
                  )),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(
        context: context,
        title: "Back Up Pharse",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(16),
            Text(
              'Enter Your Secret Recovery Phrase',
              style: AppFont.semibold18
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            height(4),
            Text(
              'Drag and drop to sort your phrases exactly as you saw them on the previous screen',
              style: AppFont.reguler14
                  .copyWith(color: Theme.of(context).hintColor),
            ),
            height(16),
            Center(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4.2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) =>
                    cardPniomoni(number: index + 1),
                itemCount: 12,
              ),
            ),
            height(24),
            random.isEmpty
                ? const SizedBox()
                : Center(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 2.8,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) =>
                          cardPilihan(text: random[index]['data']),
                      itemCount: random.length,
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: PrimaryButton(
        title: 'Verify',
        disable: ref.watch(disableConfirmProvider),
        onPressed: () {
          ref
              .read(confirmMnemonicProvider.notifier)
              .validatePharse(ref, context);
        },
        margin: EdgeInsets.only(top: 8, bottom: 36, left: 16, right: 16),
      ),
    );
  }
}
