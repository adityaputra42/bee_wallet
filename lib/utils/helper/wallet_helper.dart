import 'package:bip39/bip39.dart' as bip39;

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
}
