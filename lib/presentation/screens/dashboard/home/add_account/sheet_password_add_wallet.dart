// ignore_for_file: use_build_context_synchronously

import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 24.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Enter Security Pin",
            style: AppFont.semibold16
                .copyWith(color: Theme.of(context).indicatorColor),
            textAlign: TextAlign.center,
          ),
          4.0.height,
          Text(
            "Please enter your pin to create new account",
            style:
                AppFont.reguler14.copyWith(color: Theme.of(context).hintColor),
            textAlign: TextAlign.center,
          ),
          24.0.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: InputPin(
              keyboardType: TextInputType.none,
              controller: ref.watch(pinController),
              obsecure: true,
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
          16.0.height,
          Numpadcustom(
              height: 52.h,
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
