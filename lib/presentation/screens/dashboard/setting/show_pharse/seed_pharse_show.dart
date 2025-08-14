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
              height(16),
              Text(
                'Write down the Seed Phrase in order.',
                style: AppFont.medium14.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
              ),
              height(16),
              GridView.builder(
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

              height(16),

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
        color: Theme.of(context).colorScheme.surface,
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
