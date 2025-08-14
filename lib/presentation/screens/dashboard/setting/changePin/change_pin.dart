// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/config.dart';
import '../../../../../utils/util.dart';
import '../../../../widget/widget.dart';

final pinNewController = StateProvider<TextEditingController>(
  (ref) => TextEditingController(),
);

class ChangePin extends ConsumerWidget {
  const ChangePin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: WidgetHelper.appBar(context: context, title: "Change Pin"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Enter New Security Password",
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
                  controller: ref.watch(pinNewController),
                  obsecure: true,
                  onCompleted: (value) {
                    context.goNamed('confirm_pin');
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
            controller: ref.watch(pinNewController),
            delete: () {
              ref.watch(pinNewController).text =
                  ref.watch(pinNewController).text != ''
                      ? ref
                          .watch(pinNewController)
                          .text
                          .substring(
                            0,
                            ref.watch(pinNewController).text.length - 1,
                          )
                      : ref.watch(pinNewController).text;
            },
          ),
        ),
      ),
    );
  }
}
