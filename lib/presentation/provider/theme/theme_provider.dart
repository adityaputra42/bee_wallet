import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/config.dart';
import '../../../utils/util.dart';

part 'theme_provider.g.dart';

@riverpod
class DarkTheme extends _$DarkTheme {
  @override
  bool build() {
    return PrefHelper.instance.getTheme();
  }

  void changeTheme(bool value) {
    PrefHelper.instance.setDarkTheme(value);
    state = value;
  }
}

@riverpod
class CurrentBackPressTime extends _$CurrentBackPressTime {
  @override
  DateTime build() {
    return DateTime.now().subtract(const Duration(minutes: 1));
  }

  void changeTimeBackPress(DateTime value) {
    state = value;
  }
}

@riverpod
class CanPop extends _$CanPop {
  @override
  bool build() {
    return false;
  }

  void onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime bkTime = ref.watch(currentBackPressTimeProvider);
    log("backtime => ${bkTime.toString()}");
    if (now.difference(bkTime).inSeconds >
        const Duration(seconds: 2).inSeconds) {
      ref.read(currentBackPressTimeProvider.notifier).changeTimeBackPress(now);
      MethodHelper().showSnack(
        context: context,
        content: "Tap back again to leave",
        backgorund: AppColor.yellowColor.withValues(alpha: 0.25),
      );
      state = false;
    } else {
      state = true;
    }
  }
}

@riverpod
class Fingerprint extends _$Fingerprint {
  @override
  bool build() {
    return PrefHelper.instance.isFingerprint;
  }

  // void setFingerprint( bool value) {
  //   if (state == false) {

  //   } else {
  //     state = value;
  //     PrefHelper.instance.setFingerprint(value);
  //   }
  // }

  void setFingerprint(bool value) {
    state = value;
    PrefHelper.instance.setFingerprint(value);
  }
}
