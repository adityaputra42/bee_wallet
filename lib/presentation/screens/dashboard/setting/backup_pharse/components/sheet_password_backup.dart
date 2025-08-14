// ignore_for_file: use_build_context_synchronously

import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../config/config.dart';
import '../../../../../widget/widget.dart';

final pinBackupController = StateProvider<TextEditingController>(
  (ref) => TextEditingController(),
);

class SheetPinBackup extends ConsumerWidget {
  const SheetPinBackup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Enter Security Password",
              style: AppFont.semibold16.copyWith(
                color: Theme.of(context).indicatorColor,
              ),
              textAlign: TextAlign.center,
            ),
            height(16),
            Text(
              "Security Password used for open Wallet, Transaction, and Mnemonik Frase. Remember it and dont give password to anyoone",
              style: AppFont.medium12.copyWith(
                color: Theme.of(context).hintColor,
              ),
              textAlign: TextAlign.center,
            ),
            height(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: InputPin(
                keyboardType: TextInputType.none,
                controller: ref.watch(pinBackupController),
                obsecure: true,
                onCompleted: (value) async {
                  var pin = await DbHelper.instance.getPassword();
                  if (pin.password == value) {
                    ref.watch(pinBackupController).clear();
                    context.pop();
                    context.goNamed('sheed_parse_setting');
                  } else {
                    ref.watch(pinBackupController).clear();
                    MethodHelper().showSnack(
                      context: context,
                      content: "Pin Didn't Match!",
                      backgorund: AppColor.redColor,
                    );
                  }
                },
              ),
            ),
            height(16),
            Numpadcustom(
              controller: ref.watch(pinBackupController),
              delete: () {
                ref.watch(pinBackupController).text =
                    ref.watch(pinBackupController).text != ''
                        ? ref
                            .watch(pinBackupController)
                            .text
                            .substring(
                              0,
                              ref.watch(pinBackupController).text.length - 1,
                            )
                        : ref.watch(pinBackupController).text;
              },
            ),
          ],
        ),
      ),
    );
  }
}
