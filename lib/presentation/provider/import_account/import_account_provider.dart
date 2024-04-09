import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../config/config.dart';
import '../../../data/model/model.dart';
import '../../../utils/util.dart';

part 'import_account_provider.g.dart';

@riverpod
class LoadingImport extends _$LoadingImport {
  @override
  bool build() => false;
  changeLoading(bool value) => state = value;
}

@riverpod
class PharseController extends _$PharseController {
  @override
  TextEditingController build() => TextEditingController();

  setValue(String value) {
    state.text = value;
  }

  String? onValidatePharse(String? value) {
    if (value == '') {
      return "Secret pharse can't be empty";
    } else {
      return null;
    }
  }
}

@riverpod
class AccountNameController extends _$AccountNameController {
  @override
  TextEditingController build() => TextEditingController();

  setValue(String value) {
    state.text = value;
  }

  String? onValidatePharse(String? value) {
    if (value == '') {
      return "Name can't be empty";
    } else {
      return null;
    }
  }
}

@riverpod
class CreatePinRegister extends _$CreatePinRegister {
  @override
  TextEditingController build() => TextEditingController();
}

@riverpod
class ConfirmPinRegister extends _$ConfirmPinRegister {
  @override
  TextEditingController build() => TextEditingController();
}

@riverpod
class DisableImport extends _$DisableImport {
  @override
  bool build() => true;
  void validateButton() {
    if (ref.watch(pharseControllerProvider).text != '' &&
        ref.watch(accountNameControllerProvider).text != '') {
      state = false;
    } else {
      state = true;
    }
  }
}

@riverpod
class ImportAccount extends _$ImportAccount {
  @override
  Future<String> build() async {
    return '';
  }

  Future<void> import(BuildContext context) async {
    Password pass =
        Password(password: ref.watch(createPinRegisterProvider).text);
        String mnemonic = ref.watch(pharseControllerProvider).text;
        state = const AsyncLoading();
    if (WalletHelper()
        .validateMnemonic(ref.watch(pharseControllerProvider).text)) {
      var address = await MethodHelper().computeMnemonic(
          mnemonic: mnemonic,
          name: ref.watch(accountNameControllerProvider).text,
          backup: true);
      await DbHelper.instance.addAccount(address);
      await DbHelper.instance.setPassword(pass);
      ref.watch(appRouteProvider).goNamed('main');
      PrefHelper.instance.setLogin(true);
     
    } else {
      MethodHelper().showSnack(
          context: context,
          content: "Invalid seed pharse",
          backgorund: AppColor.redColor);
    }
      state = AsyncData(mnemonic);
   
  }
}
