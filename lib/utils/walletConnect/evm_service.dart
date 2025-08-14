import 'dart:convert';

import 'package:eth_sig_util/util/utils.dart';

import 'package:http/http.dart' as http;
import 'package:eth_sig_util/eth_sig_util.dart';
import 'package:reown_walletkit/reown_walletkit.dart';

import '../../data/model/account/account.dart';
import '../../data/model/token_chain/token_chain.dart';
import '../util.dart';
import 'eth_utils.dart';
import 'methods_utils.dart';
import 'wc_connection_model.dart';

enum SupportedEVMMethods {
  ethSign,
  ethSignTransaction,
  ethSignTypedData,
  ethSignTypedDataV4,
  switchChain,
  personalSign,
  ethSendTransaction;

  String get name {
    switch (this) {
      case ethSign:
        return 'eth_sign';
      case ethSignTransaction:
        return 'eth_signTransaction';
      case ethSignTypedData:
        return 'eth_signTypedData';
      case ethSignTypedDataV4:
        return 'eth_signTypedData_v4';
      case switchChain:
        return 'wallet_switchEthereumChain';
      case personalSign:
        return 'personal_sign';
      case ethSendTransaction:
        return 'eth_sendTransaction';
    }
  }
}

class EVMService {
  final ReownWalletKit walletKit;
  final Account account;
  final TokenChain chainSupported;
  final TokenChain selectedDappChain;
  late final Web3Client ethClient;

  Map<
      String,
      dynamic Function(
        String,
        dynamic,
      )> get sessionRequestHandlers => {
        SupportedEVMMethods.ethSign.name: ethSign,
        SupportedEVMMethods.ethSignTransaction.name: ethSignTransaction,
        SupportedEVMMethods.ethSignTypedData.name: ethSignTypedData,
        SupportedEVMMethods.ethSignTypedDataV4.name: ethSignTypedDataV4,
        SupportedEVMMethods.switchChain.name: switchChain,
        // 'wallet_addEthereumChain': addChain,
      };

  Map<String, dynamic Function(String, dynamic)> get methodRequestHandlers => {
        SupportedEVMMethods.personalSign.name: personalSign,
        SupportedEVMMethods.ethSendTransaction.name: ethSendTransaction,
      };

  EVMService(
      {required this.chainSupported,
      required this.walletKit,
      required this.account,
      required this.selectedDappChain}) {
    ethClient = Web3Client(chainSupported.rpc ?? "", http.Client());

    for (final event in EventsConstants.allEvents) {
      walletKit.registerEventEmitter(
        chainId: "eip155:${chainSupported.chainId}",
        event: event,
      );
    }

    for (var handler in methodRequestHandlers.entries) {
      walletKit.registerRequestHandler(
        chainId: "eip155:${chainSupported.chainId}",
        method: handler.key,
        handler: handler.value,
      );
    }
    for (var handler in sessionRequestHandlers.entries) {
      walletKit.registerRequestHandler(
        chainId: chainSupported.chainId ?? "",
        method: handler.key,
        handler: handler.value,
      );
    }

    walletKit.onSessionRequest.subscribe(_onSessionRequest);
  }

  // personal_sign is handled using onSessionRequest event for demo purposes
  Future<void> personalSign(String topic, dynamic parameters) async {
    log('BetherWalet personalSign request: $parameters');

    final SessionRequest pRequest = walletKit.pendingRequests.getAll().last;
    final address = EthUtils.getAddressFromSessionRequest(pRequest);
    final data = EthUtils.getDataFromSessionRequest(pRequest);
    final message = EthUtils.getUtf8Message(data.toString());
    var response = JsonRpcResponse(
      id: pRequest.id,
      jsonrpc: '2.0',
    );

    if (await MethodsUtils.requestApproval(
      message,
      method: pRequest.method,
      chainId: pRequest.chainId,
      address: address,
      transportType: pRequest.transportType.name,
      verifyContext: pRequest.verifyContext,
    )) {
      try {
        // Load the private key

        final pk = EcryptionHelper().decrypt(account.keyETH ?? "");
        final credentials = EthPrivateKey.fromHex(pk);
        final signature = credentials.signPersonalMessageToUint8List(
          utf8.encode(message),
        );
        final signedTx = bytesToHex(signature, include0x: true);

        isValidSignature(signedTx, message, credentials.address.hex);

        response = response.copyWith(result: signedTx);
      } catch (e) {
        final error = Errors.getSdkError(Errors.MALFORMED_REQUEST_PARAMS);
        response = response.copyWith(
          error: JsonRpcError(
            code: error.code,
            message: error.message,
          ),
        );
      }
    } else {
      final error = Errors.getSdkError(Errors.USER_REJECTED);
      response = response.copyWith(
        error: JsonRpcError(
          code: error.code,
          message: error.message,
        ),
      );
    }

    _handleResponseForTopic(topic, response);
  }

  Future<void> ethSign(String topic, dynamic parameters) async {
    final account = await DbHelper.instance.getSelectedWallet();
    log('BetherWalet ethSign request: $parameters');
    final pRequest = walletKit.pendingRequests.getAll().last;
    final data = EthUtils.getDataFromSessionRequest(pRequest);
    final message = EthUtils.getUtf8Message(data.toString());
    var response = JsonRpcResponse(
      id: pRequest.id,
      jsonrpc: '2.0',
    );

    if (await MethodsUtils.requestApproval(
      message,
      transportType: pRequest.transportType.name,
      verifyContext: pRequest.verifyContext,
    )) {
      try {
        // Load the private key
        final pk = EcryptionHelper().decrypt(account?.keyETH ?? '');
        final credentials = EthPrivateKey.fromHex(pk);
        final signature = credentials.signPersonalMessageToUint8List(
          utf8.encode(message),
        );
        final signedTx = bytesToHex(signature, include0x: true);

        isValidSignature(signedTx, message, credentials.address.hex);

        response = response.copyWith(result: signedTx);
      } catch (e) {
        log('BetherWalet ethSign error $e');
        final error = Errors.getSdkError(Errors.MALFORMED_REQUEST_PARAMS);
        response = response.copyWith(
          error: JsonRpcError(
            code: error.code,
            message: error.message,
          ),
        );
      }
    } else {
      final error = Errors.getSdkError(Errors.USER_REJECTED).toSignError();
      response = response.copyWith(
        error: JsonRpcError(
          code: error.code,
          message: error.message,
        ),
      );
    }

    _handleResponseForTopic(topic, response);
  }

  Future<void> ethSignTypedData(String topic, dynamic parameters) async {
    log('BetherWalet ethSignTypedData request: $parameters');
    final pRequest = walletKit.pendingRequests.getAll().last;
    final data = EthUtils.getDataFromSessionRequest(pRequest);
    var response = JsonRpcResponse(
      id: pRequest.id,
      jsonrpc: '2.0',
    );

    if (await MethodsUtils.requestApproval(
      data,
      transportType: pRequest.transportType.name,
      verifyContext: pRequest.verifyContext,
    )) {
      try {
        final pk = EcryptionHelper().decrypt(account.keyETH ?? "");
        final signature = EthSigUtil.signTypedData(
          privateKey: pk,
          jsonData: data,
          version: TypedDataVersion.V4,
        );

        response = response.copyWith(result: signature);
      } catch (e) {
        log('BetherWalet ethSignTypedData error $e');
        final error = Errors.getSdkError(Errors.MALFORMED_REQUEST_PARAMS);
        response = response.copyWith(
          error: JsonRpcError(
            code: error.code,
            message: error.message,
          ),
        );
      }
    } else {
      final error = Errors.getSdkError(Errors.USER_REJECTED).toSignError();
      response = response.copyWith(
        error: JsonRpcError(
          code: error.code,
          message: error.message,
        ),
      );
    }

    _handleResponseForTopic(topic, response);
  }

  Future<void> ethSignTypedDataV4(String topic, dynamic parameters) async {
    log('BetherWalet ethSignTypedDataV4 request: $parameters');
    final pRequest = walletKit.pendingRequests.getAll().last;
    final data = EthUtils.getDataFromSessionRequest(pRequest);
    var response = JsonRpcResponse(
      id: pRequest.id,
      jsonrpc: '2.0',
    );

    if (await MethodsUtils.requestApproval(
      data,
      transportType: pRequest.transportType.name,
      verifyContext: pRequest.verifyContext,
    )) {
      try {
        final pk = EcryptionHelper().decrypt(account.keyETH ?? "");
        final signature = EthSigUtil.signTypedData(
          privateKey: pk,
          jsonData: data,
          version: TypedDataVersion.V4,
        );

        response = response.copyWith(result: signature);
      } catch (e) {
        log('BetherWalet ethSignTypedDataV4 error $e');
        final error = Errors.getSdkError(Errors.MALFORMED_REQUEST_PARAMS);
        response = response.copyWith(
          error: JsonRpcError(
            code: error.code,
            message: error.message,
          ),
        );
      }
    } else {
      response = response.copyWith(
        error: const JsonRpcError(code: 5002, message: 'User rejected method'),
      );
    }

    _handleResponseForTopic(topic, response);
  }

  Future<void> ethSignTransaction(
    String topic,
    dynamic parameters,
  ) async {
    log('BetherWalet ethSignTransaction request: $parameters');
    final SessionRequest pRequest = walletKit.pendingRequests.getAll().last;

    final data = EthUtils.getTransactionFromSessionRequest(pRequest);
    if (data == null) return;

    var response = JsonRpcResponse(
      id: pRequest.id,
      jsonrpc: '2.0',
    );

    final transaction = await _approveTransaction(
      data,
      method: pRequest.method,
      chainId: pRequest.chainId,
      transportType: pRequest.transportType.name,
      verifyContext: pRequest.verifyContext,
    );
    if (transaction is Transaction) {
      try {
        // Load the private key
        final pk = EcryptionHelper().decrypt(account.keyETH ?? "");
        final credentials = EthPrivateKey.fromHex(pk);
        final chainId = selectedDappChain.chainId;

        final signature = await ethClient.signTransaction(
          credentials,
          transaction,
          chainId: int.parse(chainId ?? '1'),
        );
        // Sign the transaction
        final signedTx = bytesToHex(signature, include0x: true);

        response = response.copyWith(result: signedTx);
      } on RPCError catch (e) {
        log('BetherWalet ethSignTransaction error $e');
        response = response.copyWith(
          error: JsonRpcError(
            code: e.errorCode,
            message: e.message,
          ),
        );
      } catch (e) {
        log('BetherWalet ethSignTransaction error $e');
        final error = Errors.getSdkError(Errors.MALFORMED_REQUEST_PARAMS);
        response = response.copyWith(
          error: JsonRpcError(
            code: error.code,
            message: error.message,
          ),
        );
      }
    } else {
      response = response.copyWith(error: transaction as JsonRpcError);
    }

    _handleResponseForTopic(topic, response);
  }

  Future<void> ethSendTransaction(
    String topic,
    dynamic parameters,
  ) async {
    log('BetherWalet ethSendTransaction request: $parameters');
    final SessionRequest pRequest = walletKit.pendingRequests.getAll().last;

    final data = EthUtils.getTransactionFromSessionRequest(pRequest);
    if (data == null) return;

    var response = JsonRpcResponse(
      id: pRequest.id,
      jsonrpc: '2.0',
    );

    final transaction = await _approveTransaction(
      data,
      method: pRequest.method,
      chainId: pRequest.chainId,
      transportType: pRequest.transportType.name,
      verifyContext: pRequest.verifyContext,
    );
    if (transaction is Transaction) {
      try {
        // Load the private key
        final pk = EcryptionHelper().decrypt(account.keyETH ?? "");
        final credentials = EthPrivateKey.fromHex(pk);
        final chainId = selectedDappChain.chainId;

        final signedTx = await ethClient.sendTransaction(
          credentials,
          transaction,
          chainId: int.parse(chainId ?? '1'),
        );

        response = response.copyWith(result: signedTx);
      } on RPCError catch (e) {
        log('BetherWalet ethSendTransaction error $e');
        response = response.copyWith(
          error: JsonRpcError(
            code: e.errorCode,
            message: e.message,
          ),
        );
      } catch (e) {
        log('BetherWalet ethSendTransaction error $e');
        final error = Errors.getSdkError(Errors.MALFORMED_REQUEST_PARAMS);
        response = response.copyWith(
          error: JsonRpcError(
            code: error.code,
            message: error.message,
          ),
        );
      }
    } else {
      response = response.copyWith(error: transaction as JsonRpcError);
    }

    _handleResponseForTopic(topic, response);
  }

  Future<void> switchChain(String topic, dynamic parameters) async {
    log('BetherWalet switchChain request: $topic $parameters');
    final pRequest = walletKit.pendingRequests.getAll().last;
    var response = JsonRpcResponse(id: pRequest.id, jsonrpc: '2.0');
    try {
      final params = (parameters as List).first as Map<String, dynamic>;
      final hexChainId = params['chainId'].toString().replaceFirst('0x', '');
      final chainId = int.parse(hexChainId, radix: 16);
      await walletKit.emitSessionEvent(
        topic: topic,
        chainId: 'eip155:$chainId',
        event: SessionEventParams(
          name: 'chainChanged',
          data: chainId,
        ),
      );
      response = response.copyWith(result: true);
    } on ReownSignError catch (e) {
      log('BetherWalet switchChain error $e');
      response = response.copyWith(
        error: JsonRpcError(
          code: e.code,
          message: e.message,
        ),
      );
    } catch (e) {
      log('BetherWalet switchChain error $e');
      final error = Errors.getSdkError(Errors.MALFORMED_REQUEST_PARAMS);
      response = response.copyWith(
        error: JsonRpcError(
          code: error.code,
          message: error.message,
        ),
      );
    }

    _handleResponseForTopic(topic, response);
  }

  void _handleResponseForTopic(String topic, JsonRpcResponse response) async {
    final session = walletKit.sessions.get(topic);

    try {
      await walletKit.respondSessionRequest(
        topic: topic,
        response: response,
      );
      MethodsUtils(walletKit: walletKit).handleRedirect(
        topic,
        session!.peer.metadata.redirect,
        response.error?.message,
      );
    } on ReownSignError catch (error) {
      MethodsUtils(walletKit: walletKit).handleRedirect(
        topic,
        session!.peer.metadata.redirect,
        error.message,
      );
    }
  }

  // Future<void> addChain(String topic, dynamic parameters) async {
  //   final pRequest = walletKit.pendingRequests.getAll().last;
  //   await walletKit.respondSessionRequest(
  //     topic: topic,
  //     response: JsonRpcResponse(
  //       id: pRequest.id,
  //       jsonrpc: '2.0',
  //       result: true,
  //     ),
  //   );
  //   CommonMethods.goBackToDapp(topic, true);
  // }

  Future<dynamic> _approveTransaction(
    Map<String, dynamic> tJson, {
    String? title,
    String? method,
    String? chainId,
    VerifyContext? verifyContext,
    required String transportType,
  }) async {
    Transaction transaction = tJson.toTransaction();

    final gasPrice = await ethClient.getGasPrice();
    try {
      final gasLimit = await ethClient.estimateGas(
        sender: transaction.from,
        to: transaction.to,
        value: transaction.value,
        data: transaction.data,
        gasPrice: gasPrice,
      );

      transaction = transaction.copyWith(
        gasPrice: gasPrice,
        maxGas: gasLimit.toInt(),
      );
    } on RPCError catch (e) {
      return JsonRpcError(code: e.errorCode, message: e.message);
    }

    final gweiGasPrice = (transaction.gasPrice?.getInWei ?? BigInt.zero) /
        BigInt.from(1000000000);

    const encoder = JsonEncoder.withIndent('  ');
    final trx = encoder.convert(tJson);

    if (await MethodsUtils.requestApproval(
      trx,
      title: title,
      method: method,
      chainId: chainId,
      transportType: transportType,
      verifyContext: verifyContext,
      extraModels: [
        WCConnectionModel(
          title: 'Gas price',
          elements: ['${gweiGasPrice.toStringAsFixed(2)} GWEI'],
        ),
      ],
    )) {
      return transaction;
    }

    return const JsonRpcError(code: 5002, message: 'User rejected method');
  }

  void _onSessionRequest(SessionRequestEvent? args) async {
    if (args != null && args.chainId == chainSupported.chainId) {
      log('BetherWalet _onSessionRequest ${args.toString()}');
      final handler = sessionRequestHandlers[args.method];
      if (handler != null) {
        await handler(args.topic, args.params);
      }
    }
  }

  bool isValidSignature(
    String hexSignature,
    String message,
    String hexAddress,
  ) {
    try {
      log('BetherWalet isValidSignature: $hexSignature, $message, $hexAddress');
      final recoveredAddress = EthSigUtil.recoverPersonalSignature(
        signature: hexSignature,
        message: utf8.encode(message),
      );
      log('BetherWalet recoveredAddress: $recoveredAddress');

      final recoveredAddress2 = EthSigUtil.recoverSignature(
        signature: hexSignature,
        message: utf8.encode(message),
      );
      log('BetherWalet recoveredAddress2: $recoveredAddress2');

      final isValid = recoveredAddress == hexAddress;
      return isValid;
    } catch (e) {
      return false;
    }
  }
}
