// ignore_for_file: use_build_context_synchronously

import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/config.dart';
import '../../../../widget/widget.dart';

final pinShowController =
    StateProvider<TextEditingController>((ref) => TextEditingController());

class SheetPasswordShow extends ConsumerWidget {
  const SheetPasswordShow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Enter Security Pin",
            style: AppFont.semibold16
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          height(16),
          Text(
            "Security Pin used for open Wallet, Transaction, and Mnemonik Frase. Remember it and dont give password to anyoone",
            style:
                AppFont.medium12.copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.center,
          ),
          height(24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: InputPin(
              keyboardType: TextInputType.none,
              controller: ref.watch(pinShowController),
              obsecure: true,
              onCompleted: (value) async {
                var pin = await DbHelper.instance.getPassword();
                if (pin.password == value) {
                  ref.read(pinShowController).clear();
                  context.pop();
                  context.goNamed('seed_pharse_show');
                } else {
                  ref.read(pinShowController).clear();
                  MethodHelper().showSnack(
                      context: context,
                      content: "Pin Didn't Match!",
                      backgorund: AppColor.redColor);
                }
              },
            ),
          ),
          height(16),
          Numpadcustom(
              controller: ref.watch(pinShowController),
              delete: () {
                ref.watch(pinShowController).text =
                    ref.watch(pinShowController).text != ''
                        ? ref.watch(pinShowController).text.substring(
                            0, ref.watch(pinShowController).text.length - 1)
                        : ref.watch(pinShowController).text;
              })
        ],
      ),
    );
  }
}
