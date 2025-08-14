import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/config.dart';
import '../../../../../data/src/src.dart';
import '../../../../../utils/util.dart';
import '../../../../widget/widget.dart';
import 'sheet_password_show.dart';

class ShowParse extends ConsumerWidget {
  const ShowParse({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: 'Seed Pharse'),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              Text(
                'Beware of secammers, Dont share your Seed Phrase',
                style: AppFont.semibold16.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Image.asset(AppImage.logo, width: 160),
              height(16),
              Text(
                'Peta Wallet will NEVER ask about your seed phrase (especially on Telegram)',
                style: AppFont.reguler12.copyWith(
                  color: Theme.of(context).hintColor,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              PrimaryButton(
                title: 'Show my seed phrase',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const SheetPasswordShow(),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    isScrollControlled: true,
                    showDragHandle: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
