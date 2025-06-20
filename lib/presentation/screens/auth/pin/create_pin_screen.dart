import 'package:bee_wallet/presentation/provider/provider.dart';
import 'package:bee_wallet/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/config.dart';
import '../../../provider/getStarted/getstarted_provider.dart';
import '../../../widget/widget.dart';

class CreatePinScreen extends ConsumerWidget {
  const CreatePinScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: ''),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image.asset(
              //   AppImage.logo,
              //   width: 115.w,
              // ),
              height(16),
              Text(
                "Create Security Pin",
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
                  controller: ref.watch(createPinRegisterProvider),
                  obsecure: false,
                  onCompleted: (value) {
                    ref
                        .read(passwordCreateProvider.notifier)
                        .changeValue(value);
                    ref.watch(passwordCreateProvider);
                    context.goNamed("confirm_pin_register");
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
            controller: ref.watch(createPinRegisterProvider),
            delete: () {
              ref.watch(createPinRegisterProvider).text =
                  ref.watch(createPinRegisterProvider).text != ''
                      ? ref
                          .watch(createPinRegisterProvider)
                          .text
                          .substring(
                            0,
                            ref.watch(createPinRegisterProvider).text.length -
                                1,
                          )
                      : ref.watch(createPinRegisterProvider).text;
            },
          ),
        ),
      ),
    );
  }
}
