import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/presentation/screens/welcome/getstarted/get_started_screen.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/config.dart';
import '../../../provider/getStarted/getstarted_provider.dart';
import '../../../widget/widget.dart';

class ConfirmPinScreen extends ConsumerWidget {
  const ConfirmPinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(passwordCreateProvider);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: ''),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              height(16),
              Text(
                "Confirm Security Pin",
                style: AppFont.semibold24.copyWith(
                  color: Theme.of(context).indicatorColor,
                ),
                textAlign: TextAlign.center,
              ),
              height(8),
              Text(
                "Security Pin used for open Wallet, Transaction, and Mnemonik Frase. Remember it and dont give password to anyoone",
                style: AppFont.reguler14.copyWith(
                  color: Theme.of(context).hintColor,
                ),
                textAlign: TextAlign.center,
              ),
              height(48),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: InputPin(
                  keyboardType: TextInputType.none,
                  controller: ref.watch(confirmPinRegisterProvider),
                  obsecure: false,
                  onCompleted: (value) {
                    if (password == value) {
                      if (ref.watch(typeRegisterProvider) ==
                          TypeRegister.create) {
                        context.goNamed("create_wallet");
                      } else {
                        context.goNamed("import_account");
                      }
                    } else {
                      ref.watch(confirmPinRegisterProvider).clear();
                      MethodHelper().showSnack(
                        context: context,
                        content: "Password didn't match",
                        backgorund: AppColor.redColor,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: Numpadcustom(
            controller: ref.watch(confirmPinRegisterProvider),
            delete: () {
              ref.watch(confirmPinRegisterProvider).text =
                  ref.watch(confirmPinRegisterProvider).text != ''
                      ? ref
                          .watch(confirmPinRegisterProvider)
                          .text
                          .substring(
                            0,
                            ref.watch(confirmPinRegisterProvider).text.length -
                                1,
                          )
                      : ref.watch(confirmPinRegisterProvider).text;
            },
          ),
        ),
      ),
    );
  }
}
