// ignore_for_file: use_build_context_synchronously

import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/config.dart';
import '../../../../provider/account/account_provider.dart';
import '../../../../widget/widget.dart';

enum TypeAddWallet { createNew, import }

final pinController =
    StateProvider<TextEditingController>((ref) => TextEditingController());

class SheetPasswordAddWallet extends ConsumerWidget {
  const SheetPasswordAddWallet({super.key, required this.typeAddWallet});
  final TypeAddWallet typeAddWallet;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 0, 8, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Enter Security Pin",
            style: AppFont.semibold16
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          height(4),
          Text(
            "Please enter your pin to create new account",
            style:
                AppFont.reguler14.copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.center,
          ),
          height(24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: InputPin(
              keyboardType: TextInputType.none,
              controller: ref.watch(pinController),
              obsecure: false,
              onCompleted: (value) async {
                var pin = await DbHelper.instance.getPassword();
                if (pin.password == value) {
                  if (typeAddWallet == TypeAddWallet.createNew) {
                    ref
                        .read(selectedAccountProvider.notifier)
                        .createNewAddress();

                    ref.watch(appRouteProvider).pop();
                    ref.watch(pinController).clear();
                  } else {
                    ref.watch(appRouteProvider).pop();
                    ref.watch(pinController).clear();
                    context.goNamed("import_wallet");
                  }
                } else {
                  ref.watch(pinController).clear();
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
              controller: ref.watch(pinController),
              delete: () {
                ref.watch(pinController).text = ref.watch(pinController).text !=
                        ''
                    ? ref
                        .watch(pinController)
                        .text
                        .substring(0, ref.watch(pinController).text.length - 1)
                    : ref.watch(pinController).text;
              })
        ],
      ),
    );
  }
}
