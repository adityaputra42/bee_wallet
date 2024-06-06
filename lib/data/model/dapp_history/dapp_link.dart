import 'dart:convert';
import 'package:isar/isar.dart';
part 'dapp_link.g.dart';

List<DappLink> dappLinkFromJson(String str) =>
    List<DappLink>.from(json.decode(str).map((x) => DappLink.fromJson(x)));

String dappLinkToJson(List<DappLink> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@Collection()
class DappLink {
  Id? id = Isar.autoIncrement;
  String? title;
  String? subtitle;
  String? image;
  String? chainId;
  String? url;

  DappLink({
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.chainId,
    this.url,
  });

  DappLink copyWith({
    String? title,
    String? subtitle,
    String? image,
    String? chainId,
    String? url,
  }) =>
      DappLink(
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        image: image ?? this.image,
        chainId: chainId ?? this.chainId,
        url: url ?? this.url,
      );

  factory DappLink.fromJson(Map<String, dynamic> json) => DappLink(
        title: json["title"],
        subtitle: json["subtitle"],
        image: json["image"],
        chainId: json["chainId"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "image": image,
        "chainId": chainId,
        "url": url,
      };
}
