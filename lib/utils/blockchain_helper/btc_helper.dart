import 'dart:developer';

import 'package:bdk_flutter/bdk_flutter.dart';

class BtcHelper {
  Future<Map<String, dynamic>> getBtcAccountInfo() async {
    log("init btc++>");
    final newMnemonic = await Mnemonic.fromString(
        "bleak manual engine once tip ritual humble owner hip stadium elder seat");
    final descriptorSecretKey = await DescriptorSecretKey.create(
        network: Network.Testnet, mnemonic: newMnemonic);
    log("descriptorSecretKey => $descriptorSecretKey");
    final externalDescriptor = await Descriptor.newBip44(
      network: Network.Testnet,
      keychain: KeychainKind.External,
      secretKey: descriptorSecretKey,
    );
    log("externalDescriptor => ${externalDescriptor.toString()}");
    final internalDescriptor = await Descriptor.newBip44(
      network: Network.Testnet,
      keychain: KeychainKind.Internal,
      secretKey: descriptorSecretKey,
    );
    log("internalDescriptor => ${internalDescriptor.toString()}");
    final blockchain = await Blockchain.create(
        config: const BlockchainConfig.electrum(
            config: ElectrumConfig(
                stopGap: 10,
                timeout: 5,
                retry: 5,
                url: "ssl://electrum.blockstream.info:60002",
                validateDomain: true)));

    log("blockchain => ${blockchain.toString()}");
    final wallet = await Wallet.create(
        descriptor: externalDescriptor,
        changeDescriptor: internalDescriptor,
        network: Network.Testnet,
        databaseConfig: const DatabaseConfig.memory());
    log("wallet => $wallet");
    final resdata = await wallet.sync(blockchain);

    log("resdata => $resdata");
    return {
      'mnemonic': '',
      'private_key': "",
      'address': "",
    };
  }
}
