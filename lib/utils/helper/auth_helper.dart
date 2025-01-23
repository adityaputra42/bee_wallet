import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import '../../config/config.dart';
import 'method_helper.dart';
import 'pref_helper.dart';

class AuthHelper {
  AuthHelper._privateConstructor();
  static final AuthHelper instance = AuthHelper._privateConstructor();
  factory AuthHelper() {
    return instance;
  }
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> authenticateWithFingerprint(
      {required BuildContext context, required Function() onSuccess}) async {
    if (PrefHelper.instance.isFingerprint == true) {
      await Future.delayed(const Duration(milliseconds: 500));
      try {
        var authenticated = await auth.authenticate(
          localizedReason:
              "Scan your fingerprint (or face or whatever) to authenticate",
          options: const AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
            biometricOnly: true,
          ),
        );

        log("auth fingerprint => $authenticated");
        if (authenticated) {
          onSuccess();
        } else {
          MethodHelper().showSnack(
              context: context,
              content: "Authentication Failed",
              backgorund: AppColor.redColor);
        }
      } catch (e) {
        throw Exception(e.toString());
      }
    }
  }
}
