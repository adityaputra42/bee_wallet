import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:http/http.dart' as http;
import 'package:ffcache/ffcache.dart';

import '../../data/model/model.dart';
import '../../data/model/token_chain/selected_token_chain.dart';
import '../../data/model/token_chain/token_chain.dart';
import '../repository/repository.dart';

class ActivityController implements ActivityRepository {
  @override
  Future<List<Activity>> findAllActivity(String address,
      {required int page, required SelectedTokenChain chain}) async {
    try {
      String explorer = chain.explorerApi ?? "";
      final cache = FFCache(debug: true);

      String url = chain.contractAddress == null
          ? "$explorer/api?module=account&action=txlist&address=$address&sort=desc&page=$page"
          : "$explorer/api?module=account&action=tokentx&address=$address&contractaddress=${chain.contractAddress}&sort=desc&page=$page";

      if (await ConnectivityWrapper.instance.isConnected) {
        var response = await http.Client().get(Uri.parse(url));
        var json = jsonDecode(response.body)['result'];

        if (json is List && json.isNotEmpty) {
          await cache.setJSON('key', json);
          return json.map((e) => Activity.fromJson(e)).toList();
        }
      } else {
        var json = await cache.getJSON('key');

        if (json is List) {
          return json.map((e) => Activity.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Activity>> findPetaActivity(String address,
      {required int page, required SelectedTokenChain chain}) async {
    try {
      final cache = FFCache(debug: true);
      String explorer = chain.explorerApi ?? "";
      String url = chain.contractAddress == null
          ? "$explorer/api/v2/addresses/$address/transactions"
          : "$explorer/api/v2/addresses/$address/token-transfers?token=${chain.contractAddress}";

      if (await ConnectivityWrapper.instance.isConnected) {
        var response = await http.Client().get(Uri.parse(url));

        List<Activity> activies = [];
        if (response.statusCode == 200 || response.statusCode == 201) {
          var json = jsonDecode(response.body)['items'];
          if (json is List && json.isNotEmpty) {
            await cache.setJSON('key', json);

            for (var value in json) {
              Activity activity = Activity(
                  blockNumber: value['block'].toString(),
                  confirmations: value['confirmations'].toString(),
                  from: value['from']['hash'].toString(),
                  gas: value['fee']['value'].toString(),
                  gasPrice: value['gas_price'].toString(),
                  gasUsed: value['gas_used'].toString(),
                  hash: value['hash'].toString(),
                  input: value['raw_input'].toString(),
                  isError: value['has_error_in_internal_txs'].toString(),
                  nonce: value['nonce'].toString(),
                  to: value['to']['hash'].toString(),
                  value: value['value'].toString(),
                  method: value['method'].toString(),
                  symbol: '',
                  name: '',
                  timeStamp: (DateTime.parse(value['timestamp'])
                          .millisecondsSinceEpoch)
                      .toString());
              activies.add(activity);
            }
            return activies;
          }
        } else {
          return [];
        }
      } else {
        var json = await cache.getJSON('key');

        if (json is List) {
          List<Activity> activies = [];

          for (var value in json) {
            Activity activity = Activity(
                blockNumber: value['block'].toString(),
                confirmations: value['confirmations'].toString(),
                from: value['from']['hash'].toString(),
                gas: value['fee']['value'].toString(),
                gasPrice: value['gas_price'].toString(),
                gasUsed: value['gas_used'].toString(),
                hash: value['hash'].toString(),
                input: value['raw_input'].toString(),
                isError: value['has_error_in_internal_txs'].toString(),
                nonce: value['nonce'].toString(),
                to: value['to']['hash'].toString(),
                value: value['value'].toString(),
                method: value['method'].toString(),
                symbol: '',
                name: '',
                timeStamp:
                    (DateTime.parse(value['timestamp']).millisecondsSinceEpoch)
                        .toString());
            activies.add(activity);
          }
          return activies;
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Activity>> findAllActivityNFT(
      {required String address,
      required int page,
      required TokenChain chain,
      required String contractAddress}) async {
    try {
      log("Chain => ${chain.symbol}");
      log("Address => $address");
      log("contract => $contractAddress");
      String explorer = chain.explorerApi ?? "";
      final cache = FFCache(debug: true);

      String url =
          "$explorer/api?module=account&action=tokentx&address=$address&contractaddress=$contractAddress&sort=desc&page=$page";

      if (await ConnectivityWrapper.instance.isConnected) {
        var response = await http.Client().get(Uri.parse(url));

        log("Response Status => ${response.statusCode}");
        log("Response => ${response.body}");

        var json = jsonDecode(response.body)['result'];

        if (json is List && json.isNotEmpty) {
          await cache.setJSON('key', json);
          return json.map((e) => Activity.fromJson(e)).toList();
        }
      } else {
        var json = await cache.getJSON('key');

        if (json is List) {
          return json.map((e) => Activity.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Activity>> findPetaActivityNFT(
      {required String address,
      required int page,
      required TokenChain chain,
      required String contractAddress}) async {
    try {
      log("Chain => ${chain.symbol}");
      log("Address => $address");
      log("contract => $contractAddress");
      final cache = FFCache(debug: true);
      String explorer = chain.explorerApi ?? "";
      String url =
          "$explorer/api/v2/addresses/$address/token-transfers?token=$contractAddress&type=ERC-721";

      if (await ConnectivityWrapper.instance.isConnected) {
        var response = await http.Client().get(Uri.parse(url));

        log("Response Status => ${response.statusCode}");
        log("Response => ${response.body}");

        List<Activity> activies = [];
        if (response.statusCode == 200 || response.statusCode == 201) {
          var json = jsonDecode(response.body)['items'];
          if (json is List && json.isNotEmpty) {
            await cache.setJSON('key', json);

            for (var value in json) {
              Activity activity = Activity(
                  blockNumber: value['block'].toString(),
                  confirmations: value['confirmations'].toString(),
                  from: value['from']['hash'].toString(),
                  gas: value['fee']['value'].toString(),
                  gasPrice: value['gas_price'].toString(),
                  gasUsed: value['gas_used'].toString(),
                  hash: value['hash'].toString(),
                  input: value['raw_input'].toString(),
                  isError: value['has_error_in_internal_txs'].toString(),
                  nonce: value['nonce'].toString(),
                  to: value['to']['hash'].toString(),
                  value: value['value'].toString(),
                  method: value['method'].toString(),
                  symbol: '',
                  name: '',
                  timeStamp: (DateTime.parse(value['timestamp'])
                          .millisecondsSinceEpoch)
                      .toString());
              activies.add(activity);
            }
            return activies;
          }
        } else {
          return [];
        }
      } else {
        var json = await cache.getJSON('key');

        if (json is List) {
          List<Activity> activies = [];

          for (var value in json) {
            Activity activity = Activity(
                blockNumber: value['block'].toString(),
                confirmations: value['confirmations'].toString(),
                from: value['from']['hash'].toString(),
                gas: value['fee']['value'].toString(),
                gasPrice: value['gas_price'].toString(),
                gasUsed: value['gas_used'].toString(),
                hash: value['hash'].toString(),
                input: value['raw_input'].toString(),
                isError: value['has_error_in_internal_txs'].toString(),
                nonce: value['nonce'].toString(),
                to: value['to']['hash'].toString(),
                value: value['value'].toString(),
                method: value['method'].toString(),
                symbol: '',
                name: '',
                timeStamp:
                    (DateTime.parse(value['timestamp']).millisecondsSinceEpoch)
                        .toString());
            activies.add(activity);
          }
          return activies;
        }
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
