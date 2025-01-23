import 'dart:async';
import 'dart:developer';

import 'package:web_socket_channel/io.dart';

class Websocket {
  late IOWebSocketChannel channel;
  StreamController streamController = StreamController.broadcast();
  final String _baseUrl = "wss://stream.binance.com";
  var websocketConected = false;
  bool loading = false;
  bool timeout = false;
  static final Websocket instance = Websocket();

  void onInit() {
    streamController = StreamController.broadcast();
    connectToWebSocket();
  }

  void connectToWebSocket() async {
    final String wsURL = '$_baseUrl?stream=!ticker@arr';
    channel = IOWebSocketChannel.connect(wsURL);
    channel.stream.listen((event) {
      streamController.add(event);
      log("message ${channel.stream}");
    }, onError: (e) async {
      log('Error $e');
      // log('Error while connecting websocket, Reconnecting...');
      await Future.delayed(const Duration(seconds: 3));
      connectToWebSocket();
    }, onDone: () async {
      // log('Reconnecting websocket...');
      // await Future.delayed(const Duration(seconds: 3));
      // connectToWebSocket();
    }, cancelOnError: true);
  }

  streamsBuilder() {
    var streams = ['!ticker@arr'];
    return streams;
  }

  // String generateSocketURI(String url, streams) {
  //   var streamsURL = '';
  //   for (int i = 0; i < streams.length; i++) {
  //     streamsURL += (i == 0) ? streams[i] : "&stream${streams[i]}";
  //   }
  //   return '$url/?stream=$streamsURL';
  // }

  // void onClose() {
  //   channel.sink.close();
  // }
}
