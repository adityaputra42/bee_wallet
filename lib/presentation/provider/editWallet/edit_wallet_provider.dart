// ignore_for_file: unused_result, use_build_context_synchronously

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

  changeEditAccount(BuildContext context, String name) async {
    var selectedAccount = state;
    final account = await DbHelper.instance
        .changeAccountName(selectedAccount.id ?? 0, name);
    MethodHelper().showSnack(
        context: context,
        content: "Succes Account Name",
        backgorund: AppColor.greenColor);
    ref.refresh(selectedAccountProvider);
    ref.refresh(accountListProvider);
    ref.read(enableEditWalletProvider.notifier).changeState(false);
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
