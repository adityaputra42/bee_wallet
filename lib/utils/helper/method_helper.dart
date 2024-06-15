import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../config/config.dart';
import '../../data/model/account/account.dart';
import '../../data/model/model.dart';
import '../util.dart';

class MethodHelper {
  String urlValidator(String url) {
    String value = '';
    if (isURL(url)) {
      value = url;
    } else {
      value = "https://www.google.com/search?q=$url";
    }

    return value;
  }

  RegExp numReg = RegExp(r".*[0-9].*");
  RegExp letterReg = RegExp(r".*[A-Za-z].*");

  handleCopy({required String data, required BuildContext context}) {
    Clipboard.setData(ClipboardData(text: data));
    showSnack(
        context: context, content: "Succes copy", backgorund: Colors.teal);
  }

  Future<Account> computeMnemonic(
      {required String mnemonic,
      required String name,
      bool backup = false}) async {
    var accountETH = EthHelper().getEthInfo(mnemonic);
    var accountSolana = await SolanaHelper().getAccountInfo(mnemonic);
    var accountSui = SuiHelper().getAccountInfo(mnemonic);
    var accountBtc = await BtcHelper().getBtcAccountInfo(mnemonic);

    final mnemonicEncrypted = EcryptionHelper().encrypt(mnemonic);
    final privataKeyEthEncrypted =
        EcryptionHelper().encrypt(accountETH['private_key']!);
    final privataKeySolanaEncrypted =
        EcryptionHelper().encrypt(accountSolana['private_key']!);
    final privataKeySuiEncrypted =
        EcryptionHelper().encrypt(accountSui['private_key']!);
    final privateKeyBtcEncrypted =
        EcryptionHelper().encrypt(accountBtc['private_key']!);

    Account account = Account(
      name: name,
      mnemonic: mnemonicEncrypted,
      selectedAccount: true,
      backup: backup,
      keyETH: privataKeyEthEncrypted,
      addressETH: accountETH['address'],
      keySolana: privataKeySolanaEncrypted,
      addressSolana: accountSolana['address'],
      keySui: privataKeySuiEncrypted,
      addressSui: accountSui['address'],
      keyBTC: privateKeyBtcEncrypted,
      addressBTC: accountBtc['address'],
    );
    return account;
  }

  showSnack({
    required BuildContext context,
    required String content,
    required Color backgorund,
  }) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        icon: const SizedBox(),
        messagePadding: const EdgeInsets.symmetric(horizontal: 12),
        backgroundColor: backgorund,
        textStyle: AppFont.medium16.copyWith(color: AppColor.textStrongDark),
        message: content,
      ),
      displayDuration: const Duration(milliseconds: 1000),
      animationDuration: const Duration(milliseconds: 800),
    );
  }

  shortAddress({required String address, int length = 8}) {
    if (address != '') {
      return "${address.substring(0, length)}....${address.substring(address.length - length)}";
    } else {
      return '';
    }
  }

  Future<void> pasteFromClipboard(TextEditingController controller) async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null && clipboardData.text != null) {
      controller.text = clipboardData.text!;
    }
  }

  Uint8List convertBase64ToUint8List(String base64String) {
    List<int> byteList = base64Decode(base64String);
    Uint8List uint8List = Uint8List.fromList(byteList);
    return uint8List;
  }

  String convertUint8ListToString(Uint8List uint8List) {
    String base64String = base64Encode(uint8List);
    return base64String;
  }

  bool isURL(String text) {
    // Regular expression pattern to match a URL
    RegExp urlRegex = RegExp(
      r'^(?:http|https):\/\/[\w\-]+(?:\.[\w\-]+)+(?:[\w\-\.,@?^=%&:/~\+#]*[\w\-\@?^=%&/~\+#])?$',
      caseSensitive: false,
      multiLine: false,
    );

    return urlRegex.hasMatch(text);
  }

  BigInt convertToGwei(double amount) {
    BigInt gweiBigInt = (BigInt.from(amount * 1000000000) ~/ BigInt.one);
    return gweiBigInt;
  }

  List<NftView> removeDupicateNft(List<Nft> list) {
    Set<String> seen = {};
    List<String> itemContract = [];
    List<NftView> nftView = [];
    for (var item in list) {
      if (!seen.contains(item.contractAddress)) {
        itemContract.add(item.contractAddress!);
        seen.add(item.contractAddress!);
      }
    }
    for (var item in itemContract) {
      var nftByContract =
          list.where((element) => element.contractAddress == item).toList();
      nftView.add(NftView(
        contract: item,
        name: nftByContract.first.name,
        length: nftByContract.length,
        chainID: nftByContract.first.chainId,
        image: nftByContract.first.imageByte ?? '',
        listNft: nftByContract,
      ));
    }

    return nftView;
  }
}

double roundDouble(double value, int places) {
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
