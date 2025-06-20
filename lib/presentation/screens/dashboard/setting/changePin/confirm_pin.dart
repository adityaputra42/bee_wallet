// ignore_for_file: use_build_context_synchronously

import 'package:bee_wallet/presentation/screens/dashboard/setting/changePin/change_pin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/config.dart';
import '../../../../../utils/util.dart';
import '../../../../widget/widget.dart';

final pinConfirmController =
    StateProvider<TextEditingController>((ref) => TextEditingController());

class ConfirmPin extends ConsumerWidget {
  const ConfirmPin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Confirm Pin"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Enter New Security Password",
              style: AppFont.semibold16
                  .copyWith(color: Theme.of(context).indicatorColor),
              textAlign: TextAlign.center,
            ),
            height(16),
            Text(
              "Security Password used for open Wallet, Transaction, and Mnemonik Frase. Remember it and dont give password to anyoone",
              style:
                  AppFont.medium12.copyWith(color: Theme.of(context).hintColor),
              textAlign: TextAlign.center,
            ),
            height(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: InputPin(
                keyboardType: TextInputType.none,
                controller: ref.watch(pinConfirmController),
                obsecure: true,
                onCompleted: (value) async {
                  var pin = await DbHelper.instance.getPassword();
                  if (ref.watch(pinNewController).text == value) {
                    await DbHelper.instance.changePassword(pin.id!, value);
                    ref.read(pinConfirmController).clear();
                    ref.watch(pinNewController).clear();
                    MethodHelper().showSnack(
                        context: context,
                        content: "Success change pin",
                        backgorund: AppColor.greenColor);
                    context.pop();
                    context.pop();
                  } else {
                    ref.read(pinConfirmController).clear();
                    MethodHelper().showSnack(
                        context: context,
                        content: "Pin Didn't Match!",
                        backgorund: AppColor.redColor);
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 24),
        child: Numpadcustom(
            controller: ref.watch(pinConfirmController),
            delete: () {
              ref.watch(pinConfirmController).text =
                  ref.watch(pinConfirmController).text != ''
                      ? ref.watch(pinConfirmController).text.substring(
                          0, ref.watch(pinConfirmController).text.length - 1)
                      : ref.watch(pinConfirmController).text;
            }),
      ),
    );
  }
}
