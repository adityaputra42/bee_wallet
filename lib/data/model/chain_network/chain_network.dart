import 'package:isar/isar.dart';
import 'dart:convert';
part 'chain_network.g.dart';

List<ChainNetwork> chainNetworkFromJson(String str) => List<ChainNetwork>.from(
  json.decode(str).map((x) => ChainNetwork.fromJson(x)),
);

String chainNetworkToJson(List<ChainNetwork> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@Collection()
class ChainNetwork {
  Id? id = Isar.autoIncrement;
  String? name;
  String? symbol;
  String? chainId;
  String? chainType;
  String? apiKey;
  String? rpc;
  String? explorer;
  String? explorerApi;
  bool? isTestnet;

  ChainNetwork({
    this.id,
    this.name,
    this.symbol,
    this.chainId,
    this.chainType,
    this.apiKey,
    this.rpc,
    this.explorer,
    this.explorerApi,
    this.isTestnet,
  });

  ChainNetwork copyWith({
    String? name,
    String? symbol,
    String? chainId,
    String? chainType,
    String? apiKey,
    String? rpc,
    String? explorer,
    String? explorerApi,
    bool? isTestnet,
  }) => ChainNetwork(
    name: name ?? this.name,
    symbol: symbol ?? this.symbol,
    chainId: chainId ?? this.chainId,
    chainType: chainType ?? this.chainType,
    apiKey: apiKey ?? this.apiKey,
    rpc: rpc ?? this.rpc,
    explorer: explorer ?? this.explorer,
    explorerApi: explorerApi ?? this.explorerApi,
    isTestnet: isTestnet ?? this.isTestnet,
  );

  factory ChainNetwork.fromJson(Map<String, dynamic> json) => ChainNetwork(
    name: json["name"],
    symbol: json["symbol"],
    chainId: json["chainId"],
    chainType: json["chainType"],
    apiKey: json["apiKey"],
    rpc: json["RPC"],
    explorer: json["explorer"],
    explorerApi: json["explorerAPI"],
    isTestnet: json["isTestnet"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "symbol": symbol,
    "chainId": chainId,
    "chainType": chainType,
    "apiKey": apiKey,
    "RPC": rpc,
    "explorer": explorer,
    "explorerAPI": explorerApi,
    "isTestnet": isTestnet,
  };
}
