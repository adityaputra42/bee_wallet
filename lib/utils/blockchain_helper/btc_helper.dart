import 'dart:developer';
import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:bip39/bip39.dart' as bip39;

class BtcHelper {
  Map<String, dynamic> getBtcAccountInfo(String mnemonic) {
    var seed = bip39.mnemonicToSeedHex(mnemonic);
    List<int> seedBytes = hex.decode(seed);
    final bip32 = Bip32Slip10Secp256k1.fromSeed(seedBytes);
    final sp1 = bip32.derivePath("m/44'/0'/0'/0/0/1");
    final privateKey = ECPrivate.fromBytes(sp1.privateKey.raw);
    final publicKey = privateKey.getPublic();
    final address = publicKey.toAddress();
    log("address => ${address.toAddress(BitcoinNetwork.mainnet)}");
    return {
      'mnemonic': mnemonic,
      'private_key': privateKey.prive.toExtended,
      'address': address.toAddress(BitcoinNetwork.mainnet)
    };
  }

  // select network

}
