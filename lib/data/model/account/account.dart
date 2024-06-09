import 'package:isar/isar.dart';
part 'account.g.dart';

@Collection()
class Account {
  Id? id = Isar.autoIncrement;
  String? name;
  String? mnemonic;
  bool? selectedAccount;
  bool? backup;
  String? keyETH;
  String? addressETH;
  String? keySolana;
  String? addressSolana;
  String? keyBTC;
  String? addressBTC;
  // String? keyTron;
  // String? addressTron;
  String? keySui;
  String? addressSui;

  Account(
      {this.id,
      this.name,
      this.mnemonic,
      this.selectedAccount,
      this.backup,
      this.keyETH,
      this.addressETH,
      this.keySolana,
      this.addressSolana,
      this.keyBTC,
      this.addressBTC,
      // this.keyTron,
      // this.addressTron,
      this.keySui,
      this.addressSui});
  Account copyWith({
    String? name,
    String? mnemonic,
    bool? selectedAccount,
    bool? backup,
    String? keyETH,
    String? addressETH,
    String? keySolana,
    String? addressSolana,
    String? keyBTC,
    String? addressBTC,
    // String? keyTron,
    // String? addressTron,
    String? keySui,
    String? addressSui,
  }) =>
      Account(
        name: name ?? this.name,
        mnemonic: mnemonic ?? this.mnemonic,
        selectedAccount: selectedAccount ?? this.selectedAccount,
        backup: backup ?? this.backup,
        keyETH: keyETH ?? this.keyETH,
        addressETH: addressETH ?? this.addressETH,
        keySolana: keySolana ?? this.keySolana,
        addressSolana: addressSolana ?? this.addressSolana,
        keyBTC: keyBTC ?? this.keyBTC,
        addressBTC: addressBTC ?? this.addressBTC,
        // keyTron: keyTron ?? this.keyTron,
        // addressTron: addressTron ?? this.addressTron,
        keySui: keySui ?? this.keySui,
        addressSui: addressSui ?? this.addressSui,
      );

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        name: json["name"],
        mnemonic: json["mnemonic"],
        selectedAccount: json["selectedAccount"],
        backup: json["backup"],
        keyETH: json['keyETH'],
        addressETH: json['addressETH'],
        keySolana: json['keySolana'],
        addressSolana: json['addressSolana'],
        keyBTC: json['keyBTC'],
        addressBTC: json['addressBTC'],
        // keyTron: json['keyTron'],
        // addressTron: json['addressTron'],
        keySui: json['keySui'],
        addressSui: json['addressSui'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mnemonic": mnemonic,
        "selectedAccount": selectedAccount,
        "backup": backup,
        "keyETH": keyETH,
        "addressETH": addressETH,
        "keySolana": keySolana,
        "addressSolana": addressSolana,
        "keyBTC": keyBTC,
        "addressBTC": addressBTC,
        // "keyTron": keyTron,
        // "addressTron": addressTron,
        "keySui": keySui,
        "addressSui": addressSui
      };
}
