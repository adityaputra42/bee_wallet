// ignore_for_file: unused_result

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/account/account.dart';
import '../../../utils/util.dart';
part 'account_provider.g.dart';

@riverpod
class SelectedAccount extends _$SelectedAccount {
  @override
  Future<Account> build() async {
    Account? address = await DbHelper.instance.getSelectedWallet();
    return address ?? Account();
  }

  Future<void> createNewAddress() async {
    var selectedAccount = state.valueOrNull;
    state = const AsyncLoading();
    final mnemonic = WalletHelper().generateMnemonic();
    var account = await MethodHelper()
        .computeMnemonic(mnemonic: mnemonic, name: "Account");
    await DbHelper.instance.addAccount(account);
    ref.read(accountListProvider.notifier).updateListAddress();
    await DbHelper.instance.unSelectWallet(selectedAccount?.id ?? 0);
    await DbHelper.instance.changeWallet(account.id!);
    state = AsyncData(account);
  }

  Future<void> changeAccount(Account account) async {
    var selectedAccount = state.valueOrNull;
    state = const AsyncLoading();
    await DbHelper.instance.unSelectWallet(selectedAccount?.id ?? 0);
    await DbHelper.instance.changeWallet(account.id!);
    state = AsyncData(account);
  }

  Future<void> importByMnemonic(String mnemonic) async {
    var selectedAccount = state.valueOrNull;
    state = const AsyncLoading();
    var account = await MethodHelper()
        .computeMnemonic(mnemonic: mnemonic, name: "Account", backup: true);
    await DbHelper.instance.addAccount(account);
    ref.read(accountListProvider.notifier).updateListAddress();
    await DbHelper.instance.unSelectWallet(selectedAccount?.id ?? 0);
    await DbHelper.instance.changeWallet(account.id!);
    state = AsyncData(account);
  }

  Future<void> importByPrivateKey(String privateKey) async {
    var selectedAccount = state.valueOrNull;
       state = const AsyncLoading();
    final mnemonic = WalletHelper().generateMnemonicFromPrivateKey(privateKey);
    var account = await MethodHelper()
        .computeMnemonic(mnemonic: mnemonic, name: "Account", backup: true);
    await DbHelper.instance.addAccount(account);
    ref.read(accountListProvider.notifier).updateListAddress();
    await DbHelper.instance.unSelectWallet(selectedAccount?.id ?? 0);
    await DbHelper.instance.changeWallet(account.id!);
    state = AsyncData(account);
  }
}

@riverpod
class SelectedMnemonic extends _$SelectedMnemonic {
  @override
  List<Map<String, dynamic>> build() {
    return initMnemnonic();
  }

  List<Map<String, dynamic>> initMnemnonic() {
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final mnemonic = Ecryption().decrypt(account?.mnemonic ?? '');
    final words = mnemonic.replaceAll(" ", ",").split(',');
    List<Map<String, dynamic>> wordList = [];
    for (int i = 0; i < words.length; i++) {
      wordList.add({"id": i + 1, "data": words[i]});
    }
    return wordList;
  }
}

@riverpod
class LoadingImportMnemonic extends _$LoadingImportMnemonic {
  @override
  bool build() => false;
  changeLoading(bool value) => state = value;
}

@riverpod
class LoadingImportPrivateKey extends _$LoadingImportPrivateKey {
  @override
  bool build() => false;
  changeLoading(bool value) => state = value;
}

@riverpod
class DisableImportMnemonic extends _$DisableImportMnemonic {
  @override
  bool build() => true;
  validate(String value) {
    if (value != '') {
      state = false;
    } else {
      state = true;
    }
  }
}

@riverpod
class DisiableImportPrivateKey extends _$DisiableImportPrivateKey {
  @override
  bool build() => true;
  validate(String value) {
    if (value != '') {
      state = false;
    } else {
      state = true;
    }
  }
}

@riverpod
class AccountList extends _$AccountList {
  @override
  Future<List<Account>> build() async {
    var addresses = await DbHelper.instance.getAllAccount();
    ref
        .read(anotherAccountProvider.notifier)
        .initAnotherAddress(addresses ?? []);
    return addresses ?? [];
  }

  Future<void> updateListAddress() async {
    var listAddress = await DbHelper.instance.getAllAccount();
    ref
        .read(anotherAccountProvider.notifier)
        .initAnotherAddress(listAddress ?? []);
    state = AsyncData(listAddress ?? []);
  }
}

@riverpod
class AnotherAccount extends _$AnotherAccount {
  @override
  List<Account> build() {
    return [];
  }

  initAnotherAddress(List<Account> addresses) {
    List<Account> value = addresses
        .where((element) =>
            element.mnemonic !=
            ref.watch(selectedAccountProvider).valueOrNull?.mnemonic)
        .toList();
    state = [...value];
  }
}

@riverpod
class AccountSelectedEdit extends _$AccountSelectedEdit {
  @override
  Account build() {
    return Account();
  }

  selectEditAccount(Account account) {
    state = account;
  }

  changeEditAccount(int id, String name) async {
    final account = await DbHelper.instance.changeAccountName(id, name);
    ref.refresh(selectedAccountProvider);
    ref.refresh(accountListProvider);
    state = account;
  }
}
