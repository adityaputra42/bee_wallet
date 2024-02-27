import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../utils/util.dart';
part 'create_new_account_provider.g.dart';

@riverpod
class LoadingCreateAccount extends _$LoadingCreateAccount {
  @override
  bool build() => false;

  changeLoading(bool value) => state = value;
}

@riverpod
class NameWallet extends _$NameWallet {
  @override
  TextEditingController build() => TextEditingController();

  void onChangeName(String value, WidgetRef ref) {
    if (value != '') {
      ref.read(disableCreateWalletProvider.notifier).changeValue(false);
    } else {
      ref.read(disableCreateWalletProvider.notifier).changeValue(true);
    }
  }

  String? onValidatePassword(String? value) {
    if (value == '') {
      return "Password can't be empty";
    } else {
      return null;
    }
  }
}

@riverpod
class DisableCreateWallet extends _$DisableCreateWallet {
  @override
  bool build() => true;

  void changeValue(bool value) {
    state = value;
  }
}

@riverpod
class GenerateMnemonic extends _$GenerateMnemonic {
  @override
  String build() => '';

  Future<void> generateAccount() async {
    String mnemonic = WalletHelper().generateMnemonic();
    state = mnemonic;
    if (mnemonic != '') {
      ref.read(loadingCreateAccountProvider.notifier).changeLoading(true);
      ref.watch(loadingCreateAccountProvider);
      var address = await MethodHelper()
          .computeMnemonic(mnemonic, ref.watch(nameWalletProvider).text);
      await DbHelper.instance.addAccount(address);

      ref.read(loadingCreateAccountProvider.notifier).changeLoading(false);
    }
  }
}
