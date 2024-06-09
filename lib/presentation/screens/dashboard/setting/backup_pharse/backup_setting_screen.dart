import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/config.dart';
import '../../../../../data/src/src.dart';
import '../../../../../utils/util.dart';
import '../../../../widget/widget.dart';
import 'components/sheet_confirmation_backup.dart';

class BackupSettingScreen extends ConsumerWidget {
  const BackupSettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar:
          WidgetHelper.appBar(context: context, title: 'Backup Your Wallet'),
      body: Container(
        margin: EdgeInsets.all(16.w),
        padding: EdgeInsets.all(16.w),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Theme.of(context).cardColor),
        child: Column(
          children: [
            Text(
              "Backup your wallet with Seed Phrase",
              style: AppFont.medium14
                  .copyWith(color: Theme.of(context).indicatorColor),
            ),
            const Spacer(),
            Image.asset(
              AppImage.logo,
              width: 225.w,
            ),
            16.0.height,
            Text(
              'Making backup is very simple and safe : just write down these 12/24 words and keep them in a secret place, offline',
              style: AppFont.reguler12
                  .copyWith(color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            PrimaryButton(
                title: 'Show my seed phrase',
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => const SheetConfirmationBackup(),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      isScrollControlled: true,
                      showDragHandle: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.r))));
                })
          ],
        ),
      ),
    );
  }
}
