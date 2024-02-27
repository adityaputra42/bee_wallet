import 'dart:developer';
import 'dart:typed_data';

import 'package:solana_web3/solana_web3.dart' as sol;
import 'package:solana_web3/programs.dart' show SystemProgram;
import 'package:bip39/bip39.dart' as bip39;
import '../../data/model/account/account.dart';
import '../helper/helper.dart';

import 'package:ed25519_hd_key/ed25519_hd_key.dart';

class SolanaHelper {
  Future<Map<String, dynamic>> getAccountInfo(String mnemonic) async {
    var seed = bip39.mnemonicToSeed(mnemonic);
    log("seed => $seed");

    KeyData data = await ED25519_HD_KEY.derivePath("m/44'/501'/0'/0'", seed);
    log("seed length ${data.key.length}");

    final account = await sol.Keypair.fromSeed(Uint8List.fromList(data.key));
    log('private key =>${sol.base58Encode(account.seckey)}');
    log('Address key =>${account.pubkey.toBase58()}');
    return {
      'mnemonic': mnemonic,
      'private_key': sol.base58Encode(account.seckey),
      'address': account.pubkey.toBase58()
    };
  }

  bool isValidSolanaAddress(String address) {
    try {
      log("address solana lenght => ${address.length}");
      if (address.length != 44) {
        return false;
      }
      final bytes = sol.base58Decode(address);
      log("address solana byte length => ${bytes.length}");
      if (bytes.length != 32) {
        return false;
      }
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<Map<String, dynamic>> getEstimateFee(
      {required String from, required String to}) async {
    final cluster = sol.Cluster.mainnet;
    final connect = sol.Connection(cluster);
    var last = await connect.getLatestBlockhash();
    var messasge = sol.Message.v0(
        payer: sol.Pubkey.fromString(from),
        recentBlockhash: last.blockhash,
        instructions: [
          SystemProgram.transfer(
            fromPubkey: sol.Pubkey.fromString(from),
            toPubkey: sol.Pubkey.fromString(to),
            lamports: sol.solToLamports(0),
          ),
        ]);
    final solFee = await connect.getFeeForMessage(messasge);
    log("sol fee => $solFee");
    var fee = solFee / sol.lamportsPerSol;

    return {"txFee": fee, "gasLimit": solFee, "gasPrice": sol.lamportsPerSol};
  }

  Future<void> sendSolanaTransaction(
      {required Account from,
      required String to,
      required double amount}) async {
    final cluster = sol.Cluster.mainnet;
    final connect = sol.Connection(cluster);
    final seckeyDec = Ecryption().decrypt(from.keySolana ?? "");
    var account = sol.Keypair.fromSeckeySync(sol.base58Decode(seckeyDec));
    var last = await connect.getLatestBlockhash();
    var transaction = sol.Transaction.v0(
        payer: sol.Pubkey.fromString(from.addressSolana ?? ""),
        recentBlockhash: last.blockhash,
        instructions: [
          SystemProgram.transfer(
            fromPubkey: sol.Pubkey.fromString(from.addressSolana ?? ""),
            toPubkey: sol.Pubkey.fromString(to),
            lamports: sol.solToLamports(amount),
          ),
        ]);
    transaction.sign([account]);
    await connect.sendAndConfirmTransaction(
      transaction,
    );
  }

  Future<void> getTransaction({
    required String address,
  }) async {
    final cluster = sol.Cluster.mainnet;
    final connect = sol.Connection(cluster);

    final pubkey = sol.Pubkey.fromString(address);
    var transactionList = await connect.getSignaturesForAddress(pubkey,
        config: const sol.GetSignaturesForAddressConfig(
          limit: 10,
        ));

    log('Transaction List : ${transactionList.length}');
    for (var transaction in transactionList) {
      var transactionDetail = await connect.getTransaction(
          transaction.signature,
          config: sol.GetTransactionConfig(maxSupportedTransactionVersion: 0));
      log("transaction ${transactionDetail?.meta?.innerInstructions}");
    }
  }
}
