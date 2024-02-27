import 'dart:convert';

import 'package:isar/isar.dart';
part 'token_chain.g.dart';

List<TokenChain> tokenChainFromJson(String str) =>
    List<TokenChain>.from(json.decode(str).map((x) => TokenChain.fromJson(x)));

String tokenChainToJson(List<TokenChain> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@Collection()
class TokenChain {
  TokenChain(
      {this.id,
      this.name,
      this.contractAddress,
      this.symbol,
      this.decimal,
      this.balance,
      this.logo,
      this.baseLogo,
      this.chainId,
      this.rpc,
      this.explorer,
      this.explorerApi,
      this.baseChain,
      this.isTestnet});
  Id? id = Isar.autoIncrement;
  String? name;
  String? contractAddress;
  String? symbol;
  int? decimal;
  double? balance;
  String? logo;
  String? baseLogo;
  String? chainId;
  String? rpc;
  String? explorer;
  String? explorerApi;
  String? baseChain;
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
    int? decimal,
    String? contractAddress,
    bool? isTestnet,
  }) =>
      TokenChain(
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        rpc: rpc ?? this.rpc,
        chainId: chainId ?? this.chainId,
        explorer: explorer ?? this.explorer,
        explorerApi: explorerApi ?? this.explorerApi,
        logo: logo ?? this.logo,
        baseLogo: baseLogo ?? this.baseLogo,
        baseChain: baseChain ?? this.baseChain,
        decimal: decimal ?? this.decimal,
        contractAddress: contractAddress ?? this.contractAddress,
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
        decimal: json["decimal"],
        contractAddress: json["contractAddress"],
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
        "decimal": decimal,
        "contractAddress": contractAddress,
        "isTestnet": isTestnet,
      };
}
