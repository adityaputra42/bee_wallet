import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/mdi.dart';

import '../../../../../config/config.dart';
import '../../../../widget/widget.dart';
import 'sheet_password_add_wallet.dart';

class SheetAddWallet extends ConsumerWidget {
  const SheetAddWallet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
      child: Column(
        children: [
          Text(
            "Add Wallet",
            style: AppFont.medium16
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          height(16),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const SheetPasswordAddWallet(
                        typeAddWallet: TypeAddWallet.createNew,
                      ),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  showDragHandle: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16))));
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).colorScheme.surface),
                    child: Iconify(
                      Mdi.wallet_outline,
                      color: AppColor.primaryColor,
                      size: 28,
                    ),
                  ),
                  width(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Create New Wallet",
                          style: AppFont.semibold14
                              .copyWith(color: AppColor.primaryColor),
                        ),
                        height(4),
                        Text(
                          'Start your transaction with PetaWallet',
                          style: AppFont.reguler12
                              .copyWith(color: Theme.of(context).hintColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          height(16),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const SheetPasswordAddWallet(
                        typeAddWallet: TypeAddWallet.import,
                      ),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  showDragHandle: true,
                  isScrollControlled: true,
                  useSafeArea: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16))));
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Theme.of(context).colorScheme.surface),
                    child: Iconify(
                      Mdi.wallet_outline,
                      color: AppColor.primaryColor,
                      size: 28,
                    ),
                  ),
                  width(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Import Wallet",
                          style: AppFont.semibold14
                              .copyWith(color: AppColor.primaryColor),
                        ),
                        height(4),
                        Text(
                          'Setting your mnemonik phrase to import wallet',
                          style: AppFont.reguler12
                              .copyWith(color: Theme.of(context).hintColor),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          SecondaryButton(
              title: "Cancel",
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
