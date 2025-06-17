import 'dart:developer';

import 'package:flutter/services.dart' show rootBundle;

import 'package:web3dart/web3dart.dart';

import 'package:http/http.dart' as http;

import '../../../data/model/model.dart';
import '../../util.dart';

class EvmSwap {
  Future<DeployedContract> loadRouterContract(String address) async {
    final abiCode = await rootBundle.loadString('assets/abi/route-abi.json');
    final contract = DeployedContract(
      ContractAbi.fromJson(abiCode, 'Router'),
      EthereumAddress.fromHex(address),
    );
    return contract;
  }

  Future<DeployedContract> loadFactoryContract(String address) async {
    final abiCode = await rootBundle.loadString('assets/abi/factory.json');
    final contract = DeployedContract(
      ContractAbi.fromJson(abiCode, 'factory'),
      EthereumAddress.fromHex(address),
    );
    return contract;
  }

  Future<DeployedContract> loadPairContract(String pairAddress) async {
    final abijson = await rootBundle.loadString('assets/abi/pair-abi.json');
    final contract = DeployedContract(
      ContractAbi.fromJson(abijson, "Pair-Abi"),
      EthereumAddress.fromHex(pairAddress),
    );

    return contract;
  }

  Future<String> swapExactTokensForTokens({
    required BigInt amountIn,
    required BigInt amountOutMin,
    required List<EthereumAddress> path,
    required String privateKey,
    required SelectedTokenChain chain,
  }) async {
    final credentials = EthPrivateKey.fromHex(privateKey);
    final web3client = Web3Client(chain.rpc ?? '', http.Client());
    var dex = await MethodHelper().getDexForChain(
      int.parse(chain.chainId ?? '1'),
    );
    final contract = await loadRouterContract(dex?["router"]);
    final function = contract.function('swapExactTokensForTokens');
    final deadline = BigInt.from(
      DateTime.now().millisecondsSinceEpoch ~/ 1000 + 600,
    );

    final tx = await web3client.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: function,
        parameters: [
          amountIn,
          amountOutMin,
          path,
          credentials.address,
          deadline,
        ],
        from: credentials.address,
      ),
      chainId: int.parse(chain.chainId ?? "1"),
    );
    return tx;
  }

  Future<String> swapExactETHForTokens({
    required BigInt ethAmount,
    required BigInt amountOutMin,
    required List<EthereumAddress> path,
    required String privateKey,
    required SelectedTokenChain chain,
  }) async {
    final credentials = EthPrivateKey.fromHex(privateKey);
    final web3client = Web3Client(chain.rpc ?? '', http.Client());
    var dex = await MethodHelper().getDexForChain(
      int.parse(chain.chainId ?? '1'),
    );
    final contract = await loadRouterContract(dex?["router"]);

    final function = contract.function('swapExactETHForTokens');
    final deadline = BigInt.from(
      DateTime.now().millisecondsSinceEpoch ~/ 1000 + 600,
    );

    final tx = await web3client.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: function,
        parameters: [amountOutMin, path, credentials.address, deadline],
        from: credentials.address,
        value: EtherAmount.inWei(ethAmount),
      ),
      chainId: int.parse(chain.chainId ?? "1"),
    );
    return tx;
  }

  Future<String> swapExactTokensForEth({
    required BigInt amountIn,
    required BigInt amountOutMin,
    required List<EthereumAddress> path,
    required String privateKey,
    required SelectedTokenChain chain,
  }) async {
    final credentials = EthPrivateKey.fromHex(privateKey);
    final web3client = Web3Client(chain.rpc ?? '', http.Client());
    var dex = await MethodHelper().getDexForChain(
      int.parse(chain.chainId ?? '1'),
    );
    final contract = await loadRouterContract(dex?["router"]);
    final function = contract.function('swapExactTokensForETH');
    final deadline = BigInt.from(
      DateTime.now().millisecondsSinceEpoch ~/ 1000 + 600,
    );

    final tx = await web3client.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: function,
        parameters: [
          amountIn,
          amountOutMin,
          path,
          credentials.address,
          deadline,
        ],
        from: credentials.address,
      ),
      chainId: int.parse(chain.chainId ?? "1"),
    );
    return tx;
  }

  Future<BigInt> getAmountOut({
    required BigInt amountIn,
    required SelectedTokenChain chain,
    required List<EthereumAddress> path,
  }) async {
    var dex = await MethodHelper().getDexForChain(
      int.parse(chain.chainId ?? '1'),
    );
    log("dex => $dex");
    log("Amount => $amountIn");
    log("Path => $path");
    final contract = await loadRouterContract(dex?["router"]);
    final function = contract.function('getAmountsOut');
    final web3client = Web3Client(chain.rpc ?? '', http.Client());
    final result = await web3client.call(
      contract: contract,
      function: function,
      params: [amountIn, path],
    );
    log("result => $result");

    final List<dynamic> amounts = result[0] as List<dynamic>;

    return amounts.last as BigInt; // Hasil akhir (token tujuan)
  }

  Future<BigInt> getAmountOutWithFee({
    required BigInt amountIn,
    required SelectedTokenChain chain,
    required List<EthereumAddress> path,
    double feePercent = 0.003,
  }) async {
    final web3client = Web3Client(chain.rpc ?? '', http.Client());
    var dex = await MethodHelper().getDexForChain(
      int.parse(chain.chainId ?? '1'),
    );

    final contract = await loadRouterContract(dex?["router"]);
    final function = contract.function('getAmountsOut');
    final feeMultiplier = BigInt.from((1 - feePercent) * 1000);
    log("feeMultiplier => $feeMultiplier");
    log("amountIn => $amountIn");
    final amountInWithFee = amountIn * feeMultiplier;
    log("amountInWithFee => $amountInWithFee");
    final result = await web3client.call(
      contract: contract,
      function: function,
      params: [amountInWithFee, path],
    );
    log("result => $result");

    final List<dynamic> amounts = result[0] as List<dynamic>;

    return amounts.last as BigInt;
  }

  Future<BigInt> getAmountIn({
    required BigInt amountOut,
    required SelectedTokenChain chain,
    required List<EthereumAddress> path,
  }) async {
    var dex = await MethodHelper().getDexForChain(
      int.parse(chain.chainId ?? '1'),
    );
    log("dex => $dex");
    log("Amount => $amountOut");
    log("Path => $path");
    final contract = await loadRouterContract(dex?["router"]);
    final function = contract.function('getAmountsIn');
    final web3client = Web3Client(chain.rpc ?? '', http.Client());
    web3client.printErrors = true;
    log("web3clinet  $web3client");
    final result = await web3client.call(
      contract: contract,
      function: function,
      params: [amountOut, path],
    );
    log("result => $result");
    final List<dynamic> amounts = result[0] as List<dynamic>;

    return amounts.last as BigInt;
  }

  //--- Factory-ABI----//

  Future<EthereumAddress?> getPairAddress({
    required String tokenA,
    required String tokenB,
    required SelectedTokenChain chain,
  }) async {
    final web3client = Web3Client(chain.rpc ?? "", http.Client());
    var dex = await MethodHelper().getDexForChain(
      int.parse(chain.chainId ?? '1'),
    );
    final contract = await loadFactoryContract(dex?['factory']);
    final function = contract.function('getPair');
    final result = await web3client.call(
      contract: contract,
      function: function,
      params: [
        EthereumAddress.fromHex(tokenA),
        EthereumAddress.fromHex(tokenB),
      ],
    );

    log("result getPair => $result");
    return result.first as EthereumAddress;
  }

  // ERC-20-ABI

  Future<String> approve({
    required BigInt amount,
    required SelectedTokenChain tokenIn,
    required String privateKey,
  }) async {
    final credentials = EthPrivateKey.fromHex(privateKey);
    final web3client = Web3Client(tokenIn.rpc ?? '', http.Client());
    final abijson = await rootBundle.loadString(
      'assets/abi/erc-20-abi-swap.json',
    );
    var dex = await MethodHelper().getDexForChain(
      int.parse(tokenIn.chainId ?? '1'),
    );
    final contract = DeployedContract(
      ContractAbi.fromJson(abijson, "Token"),
      EthereumAddress.fromHex(
        tokenIn.contractAddress ?? tokenIn.wrapedAddress ?? '',
      ),
    );
    final approveFunction = contract.function("approve");

    final result = await web3client.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: approveFunction,
        parameters: [EthereumAddress.fromHex(dex?['router']), amount],
      ),
      chainId: int.parse(tokenIn.chainId ?? "1"),
    );

    return result;
  }

  Future<BigInt> getAllowance({
    required EthereumAddress owner,
    required SelectedTokenChain chain,
  }) async {
    final abijson = await rootBundle.loadString(
      'assets/abi/erc-20-abi-swap.json',
    );
    var dex = await MethodHelper().getDexForChain(
      int.parse(chain.chainId ?? '1'),
    );
    log("dex => $dex");
    final contract = DeployedContract(
      ContractAbi.fromJson(abijson, "Token"),
      EthereumAddress.fromHex(
        chain.contractAddress ?? chain.wrapedAddress ?? '',
      ),
    );
    log("contract  => $contract");
    final allowanceFunction = contract.function("allowance");
    final web3client = Web3Client(chain.rpc ?? '', http.Client());

    final result = await web3client.call(
      contract: contract,
      function: allowanceFunction,
      params: [owner, EthereumAddress.fromHex(dex?["router"])],
    );

    log("result allowance => $result");
    if (result.isNotEmpty) {
      return result.first as BigInt;
    }
    return BigInt.from(0);
  }

  Future<int> getDecimals({required SelectedTokenChain chain}) async {
    final abijson = await rootBundle.loadString(
      'assets/abi/erc-20-abi-swap.json',
    );

    final contract = DeployedContract(
      ContractAbi.fromJson(abijson, "Token"),
      EthereumAddress.fromHex(chain.contractAddress ?? ''),
    );
    final decimalsFunction = contract.function("decimals");
    final web3client = Web3Client(chain.rpc ?? '', http.Client());
    final result = await web3client.call(
      contract: contract,
      function: decimalsFunction,
      params: [],
    );

    return (result.first as BigInt).toInt();
  }

  Future<List<BigInt>> getReserves({
    required SelectedTokenChain chain,
    required String pairAddress,
  }) async {
    final web3client = Web3Client(chain.rpc ?? '', http.Client());

    final contract = await loadPairContract(pairAddress);

    final getReserves = contract.function("getReserves");
    final result = await web3client.call(
      contract: contract,
      function: getReserves,
      params: [],
    );
    log("result getReserves => $result");

    List<BigInt> rsp = [result[0], result[1]];
    return rsp;
  }

  Future<EthereumAddress> getToken0({
    required SelectedTokenChain chain,
    required String pairAddress,
  }) async {
    try {
      final web3client = Web3Client(chain.rpc ?? '', http.Client());
      final contract = await loadPairContract(pairAddress);
      final token0 = contract.function("token0");
      final result = await web3client.call(
        contract: contract,
        function: token0,
        params: [],
      );
      log("result token0 => $result");
      return result[0] as EthereumAddress;
    } catch (e) {
      log("error token0 =. $e");
      throw Exception(e);
    }
  }

  Future<EthereumAddress> getToken1({
    required SelectedTokenChain chain,
    required String pairAddress,
  }) async {
    final web3client = Web3Client(chain.rpc ?? '', http.Client());

    final contract = await loadPairContract(pairAddress);

    final token1 = contract.function("token1");
    final result = await web3client.call(
      contract: contract,
      function: token1,
      params: [],
    );
    log("result token1 => $result");
    return result[0] as EthereumAddress;
  }

  Future<BigInt> getTotalSupply({
    required SelectedTokenChain chain,
    required String pairAddress,
  }) async {
    final web3client = Web3Client(chain.rpc ?? '', http.Client());

    final contract = await loadPairContract(pairAddress);

    final totalSupply = contract.function("totalSupply");
    final result = await web3client.call(
      contract: contract,
      function: totalSupply,
      params: [],
    );
    log("result totalSupply => $result");
    return result[0] as BigInt;
  }
}
