import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    Widget cardPniomoni({required int number}) {
      return DragTarget(
        onAcceptWithDetails: (detail) {
          if (!confirmList.any((element) => element['id'] == number) ||
              confirmList.isEmpty) {
            ref
                .read(confirmMnemonicProvider.notifier)
                .add(number, detail.data.toString());
            ref
                .read(randomMnemonicProvider.notifier)
                .removeRandomMnemonic(detail.data.toString());

            ref.read(disableConfirmProvider.notifier).checkButtonConfirm();
          }
        },
        builder: (context, accepted, rejected) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                  color: AppColor.grayColor.withValues(alpha: 0.15),
                ),
              ],
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).cardColor,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "$number. ${confirmList.singleWhere((element) => element['id'] == number, orElse: () => <String, dynamic>{})['data'] ?? ''}",
                style: AppFont.medium12.copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
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
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.1,
                  spreadRadius: 0.1,
                  color: Colors.black12,
                ),
              ],
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).cardColor,
            ),
            child: Center(
              child: Text(
                text,
                style: AppFont.medium12.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
              ),
            ),
          ),
          childWhenDragging: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.1,
                  spreadRadius: 0.1,
                  color: Colors.black12,
                ),
              ],
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).cardColor,
            ),
            child: Center(
              child: Text(
                text,
                style: AppFont.medium12.copyWith(color: AppColor.grayColor),
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.1,
                  spreadRadius: 0.1,
                  color: AppColor.grayColor.withValues(alpha: 0.25),
                ),
              ],
              borderRadius: BorderRadius.circular(6),
              color: Theme.of(context).cardColor,
            ),
            child: Center(
              child: Text(
                text,
                style: AppFont.medium12.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Backup"),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Write down the Seed Phrase in order.',
                style: AppFont.medium16.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
              ),
              height(16),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 0.5,
                      spreadRadius: 0.5,
                      color: AppColor.grayColor.withValues(alpha: 0.25),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.6,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder:
                      (context, index) => cardPniomoni(number: index + 1),
                  itemCount: 12,
                ),
              ),
              random.isEmpty
                  ? const SizedBox()
                  : Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          color: AppColor.grayColor.withValues(alpha: 0.25),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2.6,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                      itemBuilder:
                          (context, index) =>
                              cardPilihan(text: random[index]['data']),
                      itemCount: random.length,
                    ),
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
      ),
    );
  }
}
