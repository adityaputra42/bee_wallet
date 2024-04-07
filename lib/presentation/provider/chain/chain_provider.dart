import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:erc20/erc20.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:solana_web3/solana_web3.dart' as sol;
import 'package:sui/sui.dart';
import 'package:web3dart/web3dart.dart';
import '../../../data/model/chain_network/chain_network.dart';
import '../../../data/model/model.dart';
import '../../../data/model/token_chain/selected_token_chain.dart';
import '../../../data/model/token_chain/token_chain.dart';
import '../../../domain/controller/controller.dart';
import '../../../utils/util.dart';
import 'package:http/http.dart' as http;

import '../account/account_provider.dart';
import '../provider.dart';
part 'chain_provider.g.dart';

@riverpod
class ChainOther extends _$ChainOther {
  @override
  Future<List<ChainNetwork>> build() async {
    final networkList = await DbHelper.instance.getAllChainNetwork();
    if (networkList.isEmpty) {
      final chainlist =
          await rootBundle.loadString('assets/abi/chain_network.json');
      final listChain = chainNetworkFromJson(chainlist);
      await DbHelper.instance.setAllChainNetwork(listChain);
      return listChain;
    } else {
      return networkList;
    }
  }

  Future<void> initChainOther() async {
    final networkList = await DbHelper.instance.getAllChainNetwork();
    if (networkList.isEmpty) {
      final chainlist =
          await rootBundle.loadString('assets/abi/chain_network.json');
      final listChain = chainNetworkFromJson(chainlist);
      await DbHelper.instance.setAllChainNetwork(listChain);
      state = AsyncData(listChain);
    } else {
      state = AsyncData(networkList);
    }
  }

  addTokenChain(TokenChain token) async {
    await DbHelper.instance.addTokenChain(token);
    ref.read(tokenChainOriginProvider.notifier).initChainOrigin();
    ref.read(listTokenChainProvider.notifier).setTokenChain(token);
    ref.read(selectedChainTokenProvider.notifier).changeNework(isAll: true);
  }

  deleteTokenChain(ChainNetwork chain) async {
    await DbHelper.instance.deleteTokenChain(chain.chainId ?? "");
    ref.read(tokenChainOriginProvider.notifier).initChainOrigin();
    ref.read(listTokenChainProvider.notifier).delete(chain.chainId ?? "");
    ref.read(selectedChainTokenProvider.notifier).changeNework(isAll: true);
  }
}

@riverpod
class ChainOtherSearch extends _$ChainOtherSearch {
  @override
  List<ChainNetwork> build() {
    final listChain = ref.watch(chainOtherProvider).valueOrNull ?? [];
    return listChain;
  }

  onSearch(String value) {
    var newList = ref.watch(chainOtherProvider).valueOrNull ?? [];
    List<ChainNetwork> result = [];
    if (value == '') {
      result = newList;
    } else {
      result = newList
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()) ||
              element.symbol!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    state = result;
  }
}

@riverpod
class BalanceChain extends _$BalanceChain {
  @override
  Future<void> build() async {
    return getBalance();
  }

  Future<void> getBalance() async {
    final chainList = ref.watch(selectedChainTokenProvider).valueOrNull ?? [];
    final account = ref.watch(selectedAccountProvider).valueOrNull;

    for (var chain in chainList) {
      try {
        if (chain.baseChain == "eth") {
          final web3client = Web3Client(
            chain.rpc ?? '',
            http.Client(),
          );
          if (await ConnectivityWrapper.instance.isConnected) {
            if (chain.contractAddress == null) {
              EtherAmount balance = await web3client.getBalance(
                  EthereumAddress.fromHex(account?.addressETH ?? ''));

              double balanceParsed = double.parse(balance
                  .getValueInUnit(EtherUnit.ether)
                  .toStringAsPrecision(5));
              chain.balance = balanceParsed;
              log("new EVM Chain => $balanceParsed");
              await DbHelper.instance.updateNetwork(chain.id!, balanceParsed);
            } else {
              final token = ERC20(
                  client: web3client,
                  address: EthereumAddress.fromHex(chain.contractAddress!));

              final balance = await token.balanceOf(
                  EthereumAddress.fromHex(account?.addressETH ?? ''));
              final tokenBalance = EtherAmount.fromBigInt(
                EtherUnit.wei,
                balance,
              );

              var balanceParsed = (tokenBalance.getInWei /
                  BigInt.from(math.pow(10, chain.decimal ?? 18)));
              log("new EVM Token => $balanceParsed");
              chain.balance = balanceParsed;
              await DbHelper.instance.updateNetwork(chain.id!, balanceParsed);
            }
          }
        } else if (chain.baseChain == "sol") {
          final cluster = sol.Cluster.mainnet;
          final connection = sol.Connection(cluster);

          if (await ConnectivityWrapper.instance.isConnected) {
            final balanceSol = await connection.getBalance(
                sol.Pubkey.fromString(account?.addressSolana ?? ''));
            final balance = balanceSol / sol.lamportsPerSol;
            log("new Balance Solana => $balance");
            chain.balance = balance;
            await DbHelper.instance.updateNetwork(chain.id!, balance);
          }
        } else if (chain.baseChain == "sui") {
          if (chain.isTestnet == true) {
            final clientTestnet = SuiClient(SuiUrls.testnet);

            final suiBalance =
                await clientTestnet.getBalance(account?.addressSui ?? '');
            double balanceTestnet =
                suiBalance.totalBalance / BigInt.from(10).pow(9);
            log("new Balance sui Testnet => $balanceTestnet");
            chain.balance = balanceTestnet;
            await DbHelper.instance.updateNetwork(chain.id!, balanceTestnet);
          } else {
            final clientTestnet = SuiClient(SuiUrls.mainnet);
            final suiBalance =
                await clientTestnet.getBalance(account?.addressSui ?? '');
            double balanceMainet =
                suiBalance.totalBalance / BigInt.from(10).pow(9);
            log("new Balance sui Mainnet => $balanceMainet");
            chain.balance = balanceMainet;
            await DbHelper.instance.updateNetwork(chain.id!, balanceMainet);
          }
        }
      } catch (error) {
        log("error get balance => $error");
        throw Exception(error);
      }
    }
  }
}

@riverpod
class BalancePeriodic extends _$BalancePeriodic {
  @override
  Timer build() {
    return getEthBalancePeriodic();
  }

  Timer getEthBalancePeriodic() {
    return Timer.periodic(const Duration(seconds: 60), (timer) {
      ref.read(balanceChainProvider.notifier).getBalance();
      ref.watch(selectedChainTokenProvider);
    });
  }

  close() {
    state.cancel();
  }
}

@riverpod
class ChainDetail extends _$ChainDetail {
  @override
  SelectedTokenChain build() {
    return SelectedTokenChain();
  }

  setChainDetail(SelectedTokenChain chain) {
    state = chain;
  }
}

@riverpod
class ActivityDetail extends _$ActivityDetail {
  @override
  Activity build() {
    return Activity();
  }

  setActivity(Activity value) {
    state = value;
  }
}

@riverpod
class ChainHistory extends _$ChainHistory {
  @override
  PagingController<int, Activity> build() {
    final pagingController = PagingController<int, Activity>(
      firstPageKey: 1,
    );
    return pagingController;
  }

  init() {
    state.addPageRequestListener((pageKey) {
      fetchData(pageKey);
    });
  }

  Future<void> fetchData(
    int pageKey,
  ) async {
    const pageSize = 15;
    ActivityController repository = ActivityController();
    final account = ref.watch(selectedAccountProvider).valueOrNull;
    final chain = ref.watch(chainDetailProvider);
    if (chain.baseChain == 'eth') {
      try {
        List<Activity> response = [];
        if (chain.chainId == '234') {
          response = await repository.findPetaActivity(
              account?.addressETH ?? '',
              page: pageKey,
              chain: chain);
        } else {
          response = await repository.findAllActivity(account?.addressETH ?? '',
              page: pageKey, chain: chain);
        }

        log(response.length.toString());
        final isLastPage = response.length < pageSize;
        if (isLastPage) {
          state.appendLastPage(response);
        } else {
          final nextPageKey = pageKey + 1;
          state.appendPage(response, nextPageKey);
        }
      } catch (error) {
        state.error = error;
      }
    } else {
      state.appendLastPage([]);
    }
  }
}

@riverpod
class NameChainController extends _$NameChainController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  onChange(String value) {
    if (value != '' &&
        ref.watch(rpcChainControllerProvider).text != '' &&
        ref.watch(chainIdControllerProvider).text != '' &&
        ref.watch(symbolChainControllerProvider).text != '' &&
        ref.watch(explorerChainControllerProvider).text != '') {
      ref.read(disableAddTokenProvider.notifier).changeValue(false);
    } else {
      ref.read(disableAddTokenProvider.notifier).changeValue(false);
    }
  }

  String? onValidate(String? value) {
    if (value == '') {
      return "Name can't be empty";
    } else {
      return null;
    }
  }
}

@riverpod
class RpcChainController extends _$RpcChainController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  onChange(String value) {
    if (value != '' &&
        ref.watch(nameChainControllerProvider).text != '' &&
        ref.watch(chainIdControllerProvider).text != '' &&
        ref.watch(symbolChainControllerProvider).text != '' &&
        ref.watch(explorerChainControllerProvider).text != '') {
      ref.read(disableAddTokenProvider.notifier).changeValue(false);
    } else {
      ref.read(disableAddTokenProvider.notifier).changeValue(false);
    }
  }

  String? onValidate(String? value) {
    if (value == '') {
      return "RPC URL can't be empty";
    } else {
      return null;
    }
  }
}

@riverpod
class ChainIdController extends _$ChainIdController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  onChange(String value) {
    if (value != '' &&
        ref.watch(rpcChainControllerProvider).text != '' &&
        ref.watch(nameChainControllerProvider).text != '' &&
        ref.watch(symbolChainControllerProvider).text != '' &&
        ref.watch(explorerChainControllerProvider).text != '') {
      ref.read(disableAddTokenProvider.notifier).changeValue(false);
    } else {
      ref.read(disableAddTokenProvider.notifier).changeValue(false);
    }
  }

  String? onValidate(String? value) {
    if (value == '') {
      return "Chain Id can't be empty";
    } else {
      return null;
    }
  }
}

@riverpod
class SymbolChainController extends _$SymbolChainController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  onChange(String value) {
    if (value != '' &&
        ref.watch(rpcChainControllerProvider).text != '' &&
        ref.watch(chainIdControllerProvider).text != '' &&
        ref.watch(nameChainControllerProvider).text != '' &&
        ref.watch(explorerChainControllerProvider).text != '') {
      ref.read(disableAddTokenProvider.notifier).changeValue(false);
    } else {
      ref.read(disableAddTokenProvider.notifier).changeValue(false);
    }
  }

  String? onValidate(String? value) {
    if (value == '') {
      return "Currency symbol can't be empty";
    } else {
      return null;
    }
  }
}

@riverpod
class ExplorerChainController extends _$ExplorerChainController {
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  onChange(String value) {
    if (value != '' &&
        ref.watch(rpcChainControllerProvider).text != '' &&
        ref.watch(chainIdControllerProvider).text != '' &&
        ref.watch(symbolChainControllerProvider).text != '' &&
        ref.watch(nameChainControllerProvider).text != '') {
      ref.read(disableAddTokenProvider.notifier).changeValue(false);
    } else {
      ref.read(disableAddTokenProvider.notifier).changeValue(false);
    }
  }

  String? onValidate(String? value) {
    if (value == '') {
      return "Block Explorer URL can't be empty";
    } else {
      return null;
    }
  }
}

@riverpod
class DisbaleAddNetwork extends _$DisbaleAddNetwork {
  @override
  bool build() {
    return true;
  }

  changeValue(bool value) => state = value;
}
