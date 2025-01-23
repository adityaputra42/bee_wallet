import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/config.dart';

part 'security_auth_provider.g.dart';

enum TypeRegister { import, createNew }

enum TypeSecurity { pin, password }

RegExp numReg = RegExp(r".*[0-9].*");
RegExp letterReg = RegExp(r".*[A-Za-z].*");

@riverpod
class PinController extends _$PinController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }
}

@riverpod
class ConfirmPinController extends _$ConfirmPinController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }
}

// @riverpod
// class PasswordCreate extends _$PasswordCreate {
//   @override
//   String build() => '';

//   changeValue(String value) {
//     state = value;
//   }
// }

@riverpod
class SecurityType extends _$SecurityType {
  @override
  TypeSecurity build() => TypeSecurity.pin;

  changeValue(TypeSecurity value) {
    state = value;
  }
}

@riverpod
class RegisterType extends _$RegisterType {
  @override
  TypeRegister build() => TypeRegister.createNew;

  changeValue(TypeRegister value) {
    state = value;
  }
}

@riverpod
class HidePassword extends _$HidePassword {
  @override
  bool build() {
    return true;
  }

  onChange() {
    var value = state;
    state = !value;
  }
}

@riverpod
class HideConfirm extends _$HideConfirm {
  @override
  bool build() {
    return true;
  }

  onChange() {
    var value = state;
    state = !value;
  }
}

@riverpod
class DisablePasswordButton extends _$DisablePasswordButton {
  @override
  bool build() {
    return true;
  }

  void checkButton() {
    if (ref.watch(pinControllerProvider).text != '' &&
        ref.watch(confirmPinControllerProvider).text != '' &&
        ref.watch(pinControllerProvider).text ==
            ref.watch(confirmPinControllerProvider).text &&
        ref.watch(passwordStrengthProvider)["strength"] >= 0.5 &&
        ref.watch(tosAggrementProvider)) {
      state = false;
    } else {
      state = true;
    }
  }
}

@riverpod
class TosAggrement extends _$TosAggrement {
  @override
  bool build() {
    return false;
  }

  onChange(bool value) {
    state = value;
  }
}

@riverpod
class PasswordStrength extends _$PasswordStrength {
  @override
  Map<String, dynamic> build() {
    return {"strength": 0, "color": AppColor.redColor};
  }

  onChange(String value) {
    String password = value.trim();
    if (password.isEmpty) {
      state = {"strength": 0, "color": AppColor.redColor};
    } else if (password.length < 6) {
      state = {"strength": 0.25, "color": AppColor.redColor};
    } else if (password.length < 10) {
      state = {"strength": 0.5, "color": AppColor.yellowColor};
    } else if (!letterReg.hasMatch(password) || !numReg.hasMatch(password)) {
      state = {"strength": 0.75, "color": AppColor.greenColor};
    } else {
      state = {"strength": 1.0, "color": Colors.blueAccent};
    }
  }
}
