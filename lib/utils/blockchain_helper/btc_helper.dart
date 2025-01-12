// import 'dart:developer';

// import 'package:bdk_flutter/bdk_flutter.dart';

// class BtcHelper {
//   Future<Map<String, dynamic>> getBtcAccountInfo(String mnemonic) async {
//     log("mnemonic => $mnemonic");
//     var secretKey =
//         await getSecrectkey(mnemonicStr: mnemonic, network: Network.Testnet);
//     final wallet =
//         await createOrRestoreWallet(secretKey.asString(), Network.Testnet);
//     var account = await wallet.getAddress(addressIndex: const AddressIndex());
//     return {
//       'mnemonic': mnemonic,
//       'private_key': secretKey.asString(),
//       'address': account.address,
//     };
//   }

//   Future<List<Descriptor>> getDescriptors(
//       {required DescriptorSecretKey secretKey,
//       required Network network}) async {
//     final descriptors = <Descriptor>[];
//     try {
//       for (var e in [KeychainKind.External, KeychainKind.Internal]) {
//         final descriptor = await Descriptor.newBip84(
//             secretKey: secretKey, network: network, keychain: e);
//         descriptors.add(descriptor);
//       }
//       return descriptors;
//     } on Exception catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   Future<DescriptorSecretKey> getSecrectkey(
//       {required String mnemonicStr, required Network network}) async {
//     try {
//       final mnemonic = await Mnemonic.fromString(mnemonicStr);
//       log("mnemonic => ${mnemonic.asString()}");
//       final descriptorSecretKey = await DescriptorSecretKey.create(
//         network: network,
//         mnemonic: mnemonic,
//       );
//       return descriptorSecretKey;
//     } on Exception catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   Future<Wallet> createOrRestoreWallet(
//       String secretKey, Network network) async {
//     try {
//       var descriptorSecretKey = await DescriptorSecretKey.fromString(secretKey);
//       final descriptors = await getDescriptors(
//           secretKey: descriptorSecretKey, network: network);
//       await blockchainInit();
//       final wallet = await Wallet.create(
//           descriptor: descriptors[0],
//           changeDescriptor: descriptors[1],
//           network: network,
//           databaseConfig: const DatabaseConfig.memory());
//       return wallet;
//     } on Exception catch (e) {
//       throw Exception(e.toString());
//     }
//   }

//   Future<Blockchain> blockchainInit() async {
//     try {
//       var blockchain = await Blockchain.create(
//           config: const BlockchainConfig.electrum(
//               config: ElectrumConfig(
//                   stopGap: 10,
//                   timeout: 5,
//                   retry: 5,
//                   url: "ssl://electrum.blockstream.info:60002",
//                   validateDomain: false)));
//       return blockchain;
//     } on Exception catch (e) {
//       throw Exception(e.toString());
//     }
//   }


//   Future<Map<String, dynamic>> getEstimateFee(
//       {required String from, required String to}) async {
//     // final cluster = sol.Cluster.mainnet;
//     // final connect = sol.Connection(cluster);
//     // var last = await connect.getLatestBlockhash();
//     // var messasge = sol.Message.v0(
//     //     payer: sol.Pubkey.fromString(from),
//     //     recentBlockhash: last.blockhash,
//     //     instructions: [
//     //       SystemProgram.transfer(
//     //         fromPubkey: sol.Pubkey.fromString(from),
//     //         toPubkey: sol.Pubkey.fromString(to),
//     //         lamports: sol.solToLamports(0),
//     //       ),
//     //     ]);
//     // final solFee = await connect.getFeeForMessage(messasge);
//     // log("sol fee => $solFee");
//     // var fee = solFee / sol.lamportsPerSol;

//     return {"txFee": 0, "gasLimit": 0, "gasPrice": 0};
//   }



//   sendTx(
//       {required String addressStr,
//       required int amount,
//       required String secretKey,
//       Network? network}) async {
//     try {
//       var blockchain = await blockchainInit();
//       Wallet wallet =
//           await createOrRestoreWallet(secretKey, network ?? Network.Bitcoin);
        
//       final txBuilder = TxBuilder();
//       final address = await Address.create(address: addressStr);
//       final script = await address.scriptPubKey();
//       final txBuilderResult = await txBuilder
//           .addRecipient(script, amount)
//           .feeRate(1.0)
//           .finish(wallet);
//       final sbt = await wallet.sign(psbt: txBuilderResult.psbt);
//       final tx = await sbt.extractTx();
//       await blockchain.broadcast(tx);
//     } on Exception catch (e) {
//       throw Exception(e.toString());
//     }
//   }
// }
