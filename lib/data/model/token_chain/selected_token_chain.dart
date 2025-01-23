import 'package:isar/isar.dart';
part 'selected_token_chain.g.dart';

@Collection()
class SelectedTokenChain {
  SelectedTokenChain(
      {this.id,
      this.name,
      this.contractAddress,
      this.symbol,
      this.decimal,
      this.balance,
      this.mnemonicAccount,
      this.estimateUsd,
      this.changePercent,
      this.logo,
      this.baseLogo,
      this.chainId,
      this.chainType,
      this.apiKey,
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
  String? mnemonicAccount;
  double? estimateUsd;
  String? changePercent;
  String? logo;
  String? baseLogo;
  String? chainId;
  String? chainType;
  String? apiKey;
  String? rpc;
  String? explorer;
  String? explorerApi;
  String? baseChain;
  bool? isTestnet;

  SelectedTokenChain copyWith({
    String? name,
    String? contractAddress,
    String? symbol,
    int? decimal,
    double? balance,
    String? mnemonicAccount,
    double? estimateUsd,
    String? changePercent,
    String? logo,
    String? baseLogo,
    String? chainId,
    String? chainType,
    String? apiKey,
    String? rpc,
    String? explorer,
    String? explorerApi,
    String? baseChain,
    bool? isTestnet,
  }) =>
      SelectedTokenChain(
          name: name ?? this.name,
          contractAddress: contractAddress ?? this.contractAddress,
          symbol: symbol ?? this.symbol,
          decimal: decimal ?? this.decimal,
          balance: balance ?? this.balance,
          mnemonicAccount: mnemonicAccount ?? this.mnemonicAccount,
          estimateUsd: estimateUsd ?? this.estimateUsd,
          changePercent: changePercent ?? this.changePercent,
          logo: logo ?? this.logo,
          baseLogo: baseLogo ?? this.baseLogo,
          chainId: chainId ?? this.chainId,
          chainType: chainType ?? this.chainType,
          apiKey: apiKey ?? this.apiKey,
          rpc: rpc ?? this.rpc,
          explorer: explorer ?? this.explorer,
          explorerApi: explorerApi ?? this.explorerApi,
          baseChain: baseChain ?? this.baseChain,
          isTestnet: isTestnet ?? this.isTestnet);

  factory SelectedTokenChain.fromJson(Map<String, dynamic> json) =>
      SelectedTokenChain(
        name: json["name"],
        symbol: json["symbol"],
        rpc: json["RPC"],
        chainId: json["chainId"],
        explorer: json["explorer"],
        explorerApi: json["explorerAPI"],
        logo: json["logo"],
        baseLogo: json["baseLogo"],
        baseChain: json["baseNetwork"],
        chainType: json["chainType"],
        apiKey: json["apiKey"],
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
        "chainType": chainType,
        "apiKey": apiKey,
        "decimal": decimal,
        "contractAddress": contractAddress,
        "isTestnet": isTestnet,
      };
}
