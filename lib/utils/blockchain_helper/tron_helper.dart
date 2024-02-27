import 'package:wallet/wallet.dart' as wallet;

class TronHelper {
  Map<String, dynamic> getTronAccountInfo(String mnemonic) {
    const passphrase = '';
    List<String> listMnemonic = mnemonic.split(' ');
    final seed = wallet.mnemonicToSeed(listMnemonic, passphrase: passphrase);
    final master = wallet.ExtendedPrivateKey.master(seed, wallet.xprv);
    final root = master.forPath("m/44'/195'/0'/0/0");
    final privateKey =
        wallet.PrivateKey((root as wallet.ExtendedPrivateKey).key);
    final publicKey = wallet.tron.createPublicKey(privateKey);
    final address = wallet.tron.createAddress(publicKey);
   

    return {
      'mnemonic': mnemonic,
      'private_key': privateKey.value.toString(),
      'address': address
    };
  }

  

  bool validateAddress(String address) {
    return wallet.isValidTronAddress(address);
  }
}
