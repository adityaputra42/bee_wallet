import 'dart:convert';

CoinInfo coinInfoFromJson(String str) =>
    CoinInfo.fromJson(json.decode(str)['data']);

String coinInfoToJson(CoinInfo data) => json.encode(data.toJson());

class CoinInfo {
  String? id;
  String? type;
  Attributes? attributes;
  Relationships? relationships;
  CoinInfo({this.id, this.type, this.attributes, this.relationships});

  CoinInfo copyWith({
    String? id,
    String? type,
    Attributes? attributes,
    Relationships? relationships,
  }) => CoinInfo(
    id: id ?? this.id,
    type: type ?? this.type,
    attributes: attributes ?? this.attributes,
    relationships: relationships ?? this.relationships,
  );

  factory CoinInfo.fromJson(Map<String, dynamic> json) => CoinInfo(
    id: json["id"],
    type: json["type"],
    attributes:
        json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
    relationships:
        json["relationships"] == null
            ? null
            : Relationships.fromJson(json["relationships"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "attributes": attributes?.toJson(),
    "relationships": relationships?.toJson(),
  };
}

class Attributes {
  String? address;
  String? name;
  String? symbol;
  int? decimals;
  String? imageUrl;
  String? coingeckoCoinId;
  String? totalSupply;
  String? priceUsd;
  String? fdvUsd;
  String? totalReserveInUsd;
  VolumeUsd? volumeUsd;
  String? marketCapUsd;

  Attributes({
    this.address,
    this.name,
    this.symbol,
    this.decimals,
    this.imageUrl,
    this.coingeckoCoinId,
    this.totalSupply,
    this.priceUsd,
    this.fdvUsd,
    this.totalReserveInUsd,
    this.volumeUsd,
    this.marketCapUsd,
  });

  Attributes copyWith({
    String? address,
    String? name,
    String? symbol,
    int? decimals,
    String? imageUrl,
    String? coingeckoCoinId,
    String? totalSupply,
    String? priceUsd,
    String? fdvUsd,
    String? totalReserveInUsd,
    VolumeUsd? volumeUsd,
    String? marketCapUsd,
  }) => Attributes(
    address: address ?? this.address,
    name: name ?? this.name,
    symbol: symbol ?? this.symbol,
    decimals: decimals ?? this.decimals,
    imageUrl: imageUrl ?? this.imageUrl,
    coingeckoCoinId: coingeckoCoinId ?? this.coingeckoCoinId,
    totalSupply: totalSupply ?? this.totalSupply,
    priceUsd: priceUsd ?? this.priceUsd,
    fdvUsd: fdvUsd ?? this.fdvUsd,
    totalReserveInUsd: totalReserveInUsd ?? this.totalReserveInUsd,
    volumeUsd: volumeUsd ?? this.volumeUsd,
    marketCapUsd: marketCapUsd ?? this.marketCapUsd,
  );

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    address: json["address"],
    name: json["name"],
    symbol: json["symbol"],
    decimals: json["decimals"],
    imageUrl: json["image_url"],
    coingeckoCoinId: json["coingecko_coin_id"],
    totalSupply: json["total_supply"],
    priceUsd: json["price_usd"],
    fdvUsd: json["fdv_usd"],
    totalReserveInUsd: json["total_reserve_in_usd"],
    volumeUsd:
        json["volume_usd"] == null
            ? null
            : VolumeUsd.fromJson(json["volume_usd"]),
    marketCapUsd: json["market_cap_usd"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "name": name,
    "symbol": symbol,
    "decimals": decimals,
    "image_url": imageUrl,
    "coingecko_coin_id": coingeckoCoinId,
    "total_supply": totalSupply,
    "price_usd": priceUsd,
    "fdv_usd": fdvUsd,
    "total_reserve_in_usd": totalReserveInUsd,
    "volume_usd": volumeUsd?.toJson(),
    "market_cap_usd": marketCapUsd,
  };
}

class VolumeUsd {
  String? h24;

  VolumeUsd({this.h24});

  VolumeUsd copyWith({String? h24}) => VolumeUsd(h24: h24 ?? this.h24);

  factory VolumeUsd.fromJson(Map<String, dynamic> json) =>
      VolumeUsd(h24: json["h24"]);

  Map<String, dynamic> toJson() => {"h24": h24};
}

class Relationships {
  TopPools? topPools;

  Relationships({this.topPools});

  Relationships copyWith({TopPools? topPools}) =>
      Relationships(topPools: topPools ?? this.topPools);

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
    topPools:
        json["top_pools"] == null ? null : TopPools.fromJson(json["top_pools"]),
  );

  Map<String, dynamic> toJson() => {"top_pools": topPools?.toJson()};
}

class TopPools {
  List<Datum>? data;

  TopPools({this.data});

  TopPools copyWith({List<Datum>? data}) => TopPools(data: data ?? this.data);

  factory TopPools.fromJson(Map<String, dynamic> json) => TopPools(
    data:
        json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? type;

  Datum({this.id, this.type});

  Datum copyWith({String? id, String? type}) =>
      Datum(id: id ?? this.id, type: type ?? this.type);

  factory Datum.fromJson(Map<String, dynamic> json) =>
      Datum(id: json["id"], type: json["type"]);

  Map<String, dynamic> toJson() => {"id": id, "type": type};
}
