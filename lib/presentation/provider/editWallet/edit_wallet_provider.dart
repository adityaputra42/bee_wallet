// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/config.dart';
import '../../../data/model/account/account.dart';
import '../../../utils/util.dart';
import '../account/account_provider.dart';

part 'edit_wallet_provider.g.dart';

@riverpod
class AccountSelectedEdit extends _$AccountSelectedEdit {
  @override
  Account build() {
    return Account();
  }

  selectEditAccount(Account account) {
    state = account;
  }

  changeEditAccount(String name) async {
    var selectedAccount = state;
    final account = await DbHelper.instance
        .changeAccountName(selectedAccount.id ?? 0, name);
    ref.refresh(selectedAccountProvider);
    ref.refresh(accountListProvider);
    ref.read(enableEditWalletProvider.notifier).changeState(false);
    ref.watch(appRouteProvider).pop();
    state = account;
  }
}

@riverpod
class AccountName extends _$AccountName {
  @override
  TextEditingController build() {
    final account = ref.watch(accountSelectedEditProvider);
    return TextEditingController(text: account.name ?? '');
  }
}

@riverpod
class EnableEditWallet extends _$EnableEditWallet {
  @override
  bool build() => false;

  void changeState(bool value) {
    state = value;
  }
}
