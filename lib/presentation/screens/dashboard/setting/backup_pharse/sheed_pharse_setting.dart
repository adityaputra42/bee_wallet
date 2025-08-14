import '../../../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/config.dart';
import '../../../../provider/backup/backup_provider.dart';
import '../../../../widget/widget.dart';
import 'package:go_router/go_router.dart';

class SheedPharseSetting extends ConsumerWidget {
  const SheedPharseSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mnemonic = ref.watch(parseMnemonicProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Backup"),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height(16),
              Text(
                'Write down the Seed Phrase in order.',
                style: AppFont.medium14.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
              ),
              height(16),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.6,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder:
                      (context, index) => cardPniomoni(
                        context,
                        number: mnemonic[index]['id'],
                        text: mnemonic[index]['data'],
                      ),
                  itemCount: mnemonic.length,
                ),
              ),
              height(16),
              Row(
                children: [
                  Icon(Icons.check_rounded, color: Colors.green, size: 14),
                  width(4),
                  Text(
                    'Recomend :',
                    style: AppFont.medium12.copyWith(
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ],
              ),
              height(8),
              Text(
                'Write down on a piece of paper and store\nsomewhere secure.',
                style: AppFont.medium12.copyWith(
                  color: Theme.of(context).hintColor,
                ),
              ),
              height(16),
              Row(
                children: [
                  Icon(Icons.close_rounded, color: Colors.red, size: 14),
                  width(4),
                  Text(
                    'Avoid :',
                    style: AppFont.medium12.copyWith(
                      color: Theme.of(context).indicatorColor,
                    ),
                  ),
                ],
              ),
              height(8),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  width(4),
                  Text(
                    'Do not screenshot or copy it to the clipboard',
                    style: AppFont.medium12.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
              height(2),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  width(4),
                  Text(
                    'Do not store the Seed Phrase online',
                    style: AppFont.medium12.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
              height(2),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  width(4),
                  Text(
                    'Do not send the Seed Phrase to anyone.',
                    style: AppFont.medium12.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
              height(16),
              Text(
                "Learn more about Seed Phrase Code.",
                style: AppFont.medium12.copyWith(color: AppColor.primaryColor),
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Next',
                onPressed: () {
                  ref
                      .read(randomMnemonicProvider.notifier)
                      .setRandomMnemonic(ref.watch(parseMnemonicProvider));
                  if (ref.watch(randomMnemonicProvider).isNotEmpty) {
                    context.goNamed('confirm_parse_setting');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardPniomoni(
    BuildContext context, {
    required int number,
    required String text,
  }) {
    return Container(
      // height: 42.h,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 0.1,
            spreadRadius: 0.1,
            color: AppColor.grayColor.withValues(alpha: 0.15),
          ),
        ],
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).cardColor,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$number. $text",
          style: AppFont.medium12.copyWith(
            color: Theme.of(context).indicatorColor,
          ),
        ),
      ),
    );
  }
}
