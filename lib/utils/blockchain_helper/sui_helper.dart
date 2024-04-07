import 'dart:developer';
import 'package:sui/sui.dart';

import '../../data/model/account/account.dart';
import '../../data/model/model.dart';
import '../util.dart';

class SuiHelper {
  Map<String, dynamic> getAccountInfo(String mnemonic) {
    final account = SuiAccount.fromMnemonics(mnemonic, SignatureScheme.Ed25519);

    final address = account.getAddress();

    final privateKeyHex = account.privateKeyHex();

    log("Address SUI => $address");
    log("Private Key Hex SUI => $privateKeyHex");

    return {
      'mnemonic': mnemonic,
      'private_key': privateKeyHex,
      'address': address
    };
  }

  Future<Map<String,dynamic>> getEstimateFee(
      {required Account from,
      required String to,
      required double amount,
      required bool isTestnet}) async {
    SuiClient client;
    if (isTestnet == true) {
      client = SuiClient(SuiUrls.testnet);
    } else {
      client = SuiClient(SuiUrls.mainnet);
    }

    BigInt gweiBigInt = (BigInt.from(amount * 10000000) ~/ BigInt.one);
    var keyPair = Ecryption().decrypt(from.keySui ?? '');
    final account = SuiAccount.fromPrivateKey(keyPair, SignatureScheme.Ed25519);
    final obj = await client.getOwnedObjects(account.getAddress(),
        options: SuiObjectDataOptions(showContent: true));
    var gasPrice = await client.getReferenceGasPrice();
    final price = gasPrice * BigInt.from(10).pow(3);
    log("object sui ${obj.data.first.data?.objectId}");
    log("gas Price sui $price");
    final tx = TransferSuiTransaction(obj.data.first.data?.objectId ?? '',
        gweiBigInt.toInt(), to, price.toInt());
    log("tx gas budget sui ${tx.gasBudget}");
    log("tx amount sui ${tx.amount}");
    log("tx receipt sui ${tx.recipient}");
    log("tx subject sui ${tx.suiObjectId}");
    var gasLimit = await client.getGasCostEstimation(tx, account.getAddress());
    final txFee = gasPrice / BigInt.from(10).pow(12) * gasLimit;
    log("amount sui $gweiBigInt");
    log("gas Price sui $price");
    log("tx fee sui $txFee");
     return {"txFee": txFee, "gasLimit": gasLimit, "gasPrice": gasPrice};
  }

  Future<String?> transfer(
      {required String to,
      required double amount,
      double? gasPrice,
      required Account from,
      required bool isTestnet}) async {
    var keyPair = Ecryption().decrypt(from.keySui ?? '');
    final account = SuiAccount.fromPrivateKey(keyPair, SignatureScheme.Ed25519);
    SuiClient client;
    if (isTestnet == true) {
      client = SuiClient(SuiUrls.testnet);
    } else {
      client = SuiClient(SuiUrls.mainnet);
    }
    BigInt gweiBigInt = (BigInt.from(amount * 1000000000) ~/ BigInt.one);
    try {
      final tx = TransactionBlock();

      final coin = tx.splitCoins(tx.gas, [tx.pureInt(gweiBigInt.toInt())]);
      tx.transferObjects([coin], tx.pureAddress(account.getAddress()));
      final result = await client.signAndExecuteTransactionBlock(account, tx);
      log("result transfres ${result.digest}");
      return result.digest;
    } catch (e) {
      return null;
    }
  }

  Future<void> getTransaction(
      {required Account account, required bool isTestnet}) async {
    SuiClient client;
    if (isTestnet == true) {
      client = SuiClient(SuiUrls.testnet);
    } else {
      client = SuiClient(SuiUrls.mainnet);
    }

    var data = await client.getTransactions(account.addressSui ?? "",
        options: SuiTransactionBlockResponseOptions(
            showBalanceChanges: true,
            showEffects: true,
            showEvents: true,
            showInput: true,
            showObjectChanges: true),
        limit: 10);
    List<Activity> activities = [];
    for (var value in data.$1) {
      Activity activity = Activity(
          from: value.transaction?.data.sender,
          blockNumber: value.checkpoint,
          timeStamp: value.timestampMs,
          to: value.transaction?.data.transaction['inputs'][0]['value'],
          txreceiptStatus:
              value.effects?.status.status == ExecutionStatusType.success
                  ? "success"
                  : "failuer");
      activities.add(activity);
      log("value => ${value.json}");
    }
  }
}
