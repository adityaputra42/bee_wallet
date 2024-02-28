import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/config.dart';
import '../../../data/src/src.dart';
import '../../provider/getStarted/getstarted_provider.dart';
import '../../widget/widget.dart';
import 'sheet_confirm_pin.dart';

final createPinController =
    StateProvider<TextEditingController>((ref) => TextEditingController());

class SheetCreatePin extends ConsumerWidget {
  const SheetCreatePin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImage.logo,
            width: 115.w,
          ),
          16.0.height,
          Text(
            "Create Security Password",
            style: AppFont.semibold16
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          16.0.height,
          Text(
            "Security Password used for open Wallet, Transaction, and Mnemonik Frase. Remember it and dont give password to anyoone",
            style:
                AppFont.medium12.copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.center,
          ),
          16.0.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: InputPin(
              keyboardType: TextInputType.none,
              controller: ref.watch(createPinController),
              obsecure: true,
              onCompleted: (value) {
                ref.read(passwordCreateProvider.notifier).changeValue(value);
                ref.watch(passwordCreateProvider);
                Navigator.pop(context);
                showModalBottomSheet(
                    context: context,
                    builder: (context) => const SheetConfirmPin(),
                    backgroundColor: Theme.of(context).colorScheme.background,
                    isScrollControlled: true,
                    showDragHandle: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16.r))));
              },
            ),
          ),
          16.0.height,
          Numpadcustom(
              controller: ref.watch(createPinController),
              delete: () {
                ref.watch(createPinController).text = ref.watch(createPinController).text != ''
                    ? ref.watch(createPinController).text
                        .substring(0, ref.watch(createPinController).text.length - 1)
                    : ref.watch(createPinController).text;
              })
        ],
      ),
    );
  }
}
