import 'dart:developer';
import 'dart:typed_data';

import 'package:bip39/bip39.dart' as bip39;
import 'package:convert/convert.dart';
import 'package:pointycastle/pointycastle.dart';

class WalletHelper {
  WalletHelper._constructor();
  static final WalletHelper _instance = WalletHelper._constructor();
  factory WalletHelper() => _instance;

  String generateMnemonic() {
    var mnemonic = bip39.generateMnemonic();
    return mnemonic;
  }

  bool validateMnemonic(String mnemonic) {
    return bip39.validateMnemonic(mnemonic);
  }

  String generateMnemonicFromPrivateKey(String privateKeyHex) {
    log(privateKeyHex);
    var encodedPrivateKey = privateKeyHex.replaceRange(0, 2, "00");
    final privateKeyBytes = hex.decode(encodedPrivateKey);
    final sha256 = Digest('SHA-256');
    final hashedKey = sha256.process(Uint8List.fromList(privateKeyBytes));
    final entropyBytes = hashedKey.sublist(0, 16);
    String binaryEntropy = '';
    for (final byte in entropyBytes) {
      binaryEntropy += byte.toRadixString(2).padLeft(8, '0');
    }
    List<int> integers = [];
    for (int i = 0; i < binaryEntropy.length; i += 8) {
      integers.add(int.parse(binaryEntropy.substring(i, i + 8), radix: 2));
    }
    final mnemonic = bip39.entropyToMnemonic(hex.encode(integers));
    log("mnemonic $mnemonic");
    return mnemonic;
  }
}
