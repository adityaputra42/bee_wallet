import 'dart:convert';
import 'dart:developer';

import 'package:bee_wallet/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/account/account.dart';
import '../../../utils/util.dart';
import '../account/account_provider.dart';

part 'backup_provider.g.dart';

@riverpod
class ParseMnemonic extends _$ParseMnemonic {
  @override
  List<Map<String, dynamic>> build() {
    return initMnemnonic();
  }

  List<Map<String, dynamic>> initMnemnonic() {
    final account = ref.watch(accountBackupProvider);
    final mnemonic = EcryptionHelper().decrypt(account.mnemonic!);
    final words = mnemonic.replaceAll(" ", ",").split(',');
    List<Map<String, dynamic>> wordList = [];
    for (int i = 0; i < words.length; i++) {
      wordList.add({"id": i + 1, "data": words[i]});
    }
    return wordList;
  }

  void addPharse(String mnemonicEncryp) {
    final mnemonic = EcryptionHelper().decrypt(mnemonicEncryp);
    final words = mnemonic.replaceAll(" ", ",").split(',');
    List<Map<String, dynamic>> wordList = [];
    for (int i = 0; i < words.length; i++) {
      wordList.add({"id": i + 1, "data": words[i]});
    }
    state = [...wordList];
  }
}

@riverpod
class RandomMnemonic extends _$RandomMnemonic {
  @override
  List<Map<String, dynamic>> build() {
    return [];
  }

  void setRandomMnemonic(List<Map<String, dynamic>> originMnemonic) {
    final randomData = originMnemonic.toList()..shuffle();
    state = [...randomData];
  }

  void removeRandomMnemonic(String value) {
    state.removeWhere((element) => element['data'] == value);
    state = [...state];
  }
}

@riverpod
class ConfirmMnemonic extends _$ConfirmMnemonic {
  @override
  List<Map<String, dynamic>> build() {
    return [];
  }

  void add(int number, String value) {
    final data = {"id": number, "data": value};
    state = [...state, data];
  }

  void addOnClick(String value) {
    log(state.length.toString());
    add(state.length + 1, value);
    log(state.toString());
    ref.read(randomMnemonicProvider.notifier).removeRandomMnemonic(value);
    ref.read(disableConfirmProvider.notifier).checkButtonConfirm();
  }

  void clearConfirm() {
    state = [];
  }

  void validatePharse(WidgetRef ref, BuildContext context) {
    final confirmMnemonic = state;
    final originMnemoni = ref.watch(parseMnemonicProvider);
    final account = ref.watch(accountBackupProvider);
    confirmMnemonic.sort((a, b) => a['id'].compareTo(b['id']));
    var listOrigin = jsonEncode(originMnemoni);
    var listConfirm = jsonEncode(confirmMnemonic);
    if (listOrigin == listConfirm) {
      DbHelper.instance.changeBackupAccount(account.id!);
      // showModalBottomSheet(
      //     context: context,
      //     builder: (context) => const SheetSuccesBackup(),
      //     backgroundColor: Theme.of(context).colorScheme.surface,
      //     isScrollControlled: true,
      //     showDragHandle: true,
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.vertical(top: Radius.circular(16.r))));
      PrefHelper.instance.setLogin(true);
    } else {
      MethodHelper().showSnack(
          context: context,
          content: "Pharse didn't match",
          backgorund: AppColor.redColor);

      ref.read(confirmMnemonicProvider.notifier).clearConfirm();
      ref
          .read(randomMnemonicProvider.notifier)
          .setRandomMnemonic(originMnemoni);
    }
  }
}

@riverpod
class DisableConfirm extends _$DisableConfirm {
  @override
  bool build() => true;

  void checkButtonConfirm() {
    if (ref.watch(confirmMnemonicProvider).length == 12) {
      state = false;
    } else {
      state = true;
    }
  }
}

@riverpod
class DisableUnderstod extends _$DisableUnderstod {
  @override
  bool build() => true;

  void checkButtonConfirm() {
    if (ref.watch(confirmBackup1Provider) == true &&
        ref.watch(confirmBackup2Provider) == true &&
        ref.watch(confirmBackup3Provider) == true) {
      state = false;
    } else {
      state = true;
    }
  }
}

@riverpod
class ConfirmBackup1 extends _$ConfirmBackup1 {
  @override
  bool build() => false;

  void changeValue(bool value) {
    state = value;
  }
}

@riverpod
class ConfirmBackup2 extends _$ConfirmBackup2 {
  @override
  bool build() => false;

  void changeValue(bool value) {
    state = value;
  }
}

@riverpod
class ConfirmBackup3 extends _$ConfirmBackup3 {
  @override
  bool build() => false;

  void changeValue(bool value) {
    state = value;
  }
}

@riverpod
class AccountBackup extends _$AccountBackup {
  @override
  Account build() {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    return account ?? Account();
  }

  void changeAccount(Account value) {
    state = value;
  }
}
