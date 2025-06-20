import 'package:bee_wallet/data/model/password/password.dart';
import 'package:bee_wallet/presentation/provider/import_account/import_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../config/config.dart';
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
  Future<String> build() async => '';

  Future<void> generateAccount() async {
    String mnemonic = WalletHelper().generateMnemonic();

    Password pass =
        Password(password: ref.watch(createPinRegisterProvider).text);
    state = const AsyncLoading();
    if (mnemonic != '') {
   
      var address = await MethodHelper().computeMnemonic(
          mnemonic: mnemonic, name: ref.watch(nameWalletProvider).text);
      await DbHelper.instance.addAccount(address);
      await DbHelper.instance.setPassword(pass);
      ref.watch(appRouteProvider).goNamed('succes_register');
      state = AsyncData(mnemonic);
    }
  }
}
