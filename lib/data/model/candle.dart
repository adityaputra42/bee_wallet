import 'dart:convert';

List<List<double>> candleFromJson(String str) => List<List<double>>.from(
  json
      .decode(str)["data"]["attributes"]["ohlcv_list"]
      .map((x) => List<double>.from(x.map((x) => x?.toDouble()))),
);

String candleToJson(List<List<double>> data) => json.encode(
  List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x)))),
);
