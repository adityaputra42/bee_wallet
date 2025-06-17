import 'dart:convert';

import 'package:isar/isar.dart';
part 'token_chain.g.dart';

List<TokenChain> tokenChainFromJson(String str) =>
    List<TokenChain>.from(json.decode(str).map((x) => TokenChain.fromJson(x)));

String tokenChainToJson(List<TokenChain> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@Collection()
class TokenChain {
  TokenChain({
    this.id,
    this.name,
    this.contractAddress,
    this.tokenRegister,
    this.symbol,
    this.decimal,
    this.balance,
    this.logo,
    this.baseLogo,
    this.chainId,
    this.chainType,
    this.apiKey,
    this.rpc,
    this.explorer,
    this.explorerApi,
    this.baseChain,
    this.wrapedAddress,
    this.coingeckoIdAPI,
    this.poolAddress,
    this.networkId,
    this.isTestnet,
  });
  Id? id = Isar.autoIncrement;
  String? name;
  String? contractAddress;
  String? tokenRegister;
  String? symbol;
  int? decimal;
  double? balance;
  String? logo;
  String? baseLogo;
  String? chainId;
  String? chainType;
  String? apiKey;
  String? rpc;
  String? explorer;
  String? explorerApi;
  String? baseChain;
  String? coingeckoIdAPI;
  String? wrapedAddress;
  String? poolAddress;
  String? networkId;
  bool? isTestnet;

  TokenChain copyWith({
    String? name,
    String? symbol,
    String? rpc,
    String? chainId,
    String? explorer,
    String? explorerApi,
    String? logo,
    String? baseLogo,
    String? baseChain,
    String? chainType,
    String? apiKey,
    int? decimal,
    String? contractAddress,
    String? tokenRegister,
    String? coingeckoIdAPI,
    String? wrapedAddress,
    String? poolAddress,
    String? networkId,
    bool? isTestnet,
  }) => TokenChain(
    name: name ?? this.name,
    symbol: symbol ?? this.symbol,
    rpc: rpc ?? this.rpc,
    chainId: chainId ?? this.chainId,
    explorer: explorer ?? this.explorer,
    explorerApi: explorerApi ?? this.explorerApi,
    logo: logo ?? this.logo,
    baseLogo: baseLogo ?? this.baseLogo,
    baseChain: baseChain ?? this.baseChain,
    chainType: chainType ?? this.chainType,
    apiKey: apiKey ?? this.apiKey,
    decimal: decimal ?? this.decimal,
    contractAddress: contractAddress ?? this.contractAddress,
    tokenRegister: tokenRegister ?? this.tokenRegister,
    coingeckoIdAPI: coingeckoIdAPI ?? this.coingeckoIdAPI,
    wrapedAddress: wrapedAddress ?? this.wrapedAddress,
    poolAddress: poolAddress ?? this.poolAddress,
    networkId: networkId ?? this.networkId,
    isTestnet: isTestnet ?? this.isTestnet,
  );

  factory TokenChain.fromJson(Map<String, dynamic> json) => TokenChain(
    name: json["name"],
    symbol: json["symbol"],
    rpc: json["RPC"],
    chainId: json["chainId"],
    explorer: json["explorer"],
    explorerApi: json["explorerAPI"],
    logo: json["logo"],
    baseLogo: json['baseLogo'],
    baseChain: json["baseNetwork"],
    chainType: json["chainType"],
    apiKey: json["apiKey"],
    decimal: json["decimal"],
    contractAddress: json["contractAddress"],
    tokenRegister: json["token_registry"],
    coingeckoIdAPI: json["coingeckoIdAPI"],
    wrapedAddress: json["wraped_address"],
    poolAddress: json["pool_address"],
    networkId: json["networkId"],
    isTestnet: json["isTestnet"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "symbol": symbol,
    "RPC": rpc,
    "chainId": chainId,
    "explorer": explorer,
    "explorerAPI": explorerApi,
    "logo": logo,
    "baseLogo": baseLogo,
    "baseNetwork": baseChain,
    "chainType": chainType,
    "apiKey": apiKey,
    "decimal": decimal,
    "contractAddress": contractAddress,
    "token_registry": tokenRegister,
    "coingeckoIdAPI": coingeckoIdAPI,
    "wraped_address": wrapedAddress,
    "pool_address": poolAddress,
    "networkId": networkId,
    "isTestnet": isTestnet,
  };
}
