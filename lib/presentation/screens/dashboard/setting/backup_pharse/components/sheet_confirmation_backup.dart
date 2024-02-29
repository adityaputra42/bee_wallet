import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/config.dart';
import '../../../../../provider/backup/backup_provider.dart';
import '../../../../../widget/widget.dart';
import 'sheet_password_backup.dart';

class SheetConfirmationBackup extends ConsumerWidget {
  const SheetConfirmationBackup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          cardConfirm(
            context,
            title:
                'The loss of mnemonic Seed Phrase  will lead to permanent asset loss',
            value: ref.watch(confirmBackup1Provider),
            onChange: (v) {
              ref.read(confirmBackup1Provider.notifier).changeValue(v ?? false);
              ref.read(disableUnderstodProvider.notifier).checkButtonConfirm();
            },
          ),
          16.0.height,
          cardConfirm(
            context,
            title:
                'Once the app is delete, the wallet data will be all deleted',
            value: ref.watch(confirmBackup2Provider),
            onChange: (v) {
              ref.read(confirmBackup2Provider.notifier).changeValue(v ?? false);
              ref.read(disableUnderstodProvider.notifier).checkButtonConfirm();
            },
          ),
          16.0.height,
          cardConfirm(
            context,
            title:
                'Please backup the Seed Phrase in secure environment. Make sure there is no third party or camera around during the backup.',
            value: ref.watch(confirmBackup3Provider),
            onChange: (v) {
              ref.read(confirmBackup3Provider.notifier).changeValue(v ?? false);
              ref.read(disableUnderstodProvider.notifier).checkButtonConfirm();
            },
          ),
          24.0.height,
          PrimaryButton(
              disable: ref.watch(disableUnderstodProvider),
              title: 'Understood',
              onPressed: () {
                ref.watch(appRouteProvider).pop();
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const SheetPinBackup(),
                    backgroundColor: Theme.of(context).colorScheme.background,
                    isScrollControlled: true,
                    showDragHandle: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.r))));
              })
        ],
      ),
    );
  }

  Widget cardConfirm(BuildContext context,
      {required String title, required bool value, Function(bool?)? onChange}) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Theme.of(context).cardColor),
      child: Row(
        children: [
          Expanded(
              child: Text(
            title,
            style:
                AppFont.medium14.copyWith(color: Theme.of(context).hintColor),
          )),
          8.0.width,
          SizedBox(
            width: 16.w,
            height: 16.w,
            child: Checkbox(
              value: value,
              onChanged: onChange,
              activeColor: AppColor.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r)),
            ),
          )
        ],
      ),
    );
  }
}
