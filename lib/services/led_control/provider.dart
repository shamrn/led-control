import 'dart:convert';

import 'package:rgb_control/utils/app_constants.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketManager {
  static final WebSocketManager _singleton = WebSocketManager._internal();
  static IOWebSocketChannel channel =
      IOWebSocketChannel.connect(Uri.parse(Api.wsRootUrl));

  factory WebSocketManager() {
    return _singleton;
  }

  WebSocketManager._internal();

  addEvent(Map<dynamic, dynamic> event) {
    channel.sink.add(json.encode(event));
  }

  listen() {
    channel.stream.listen((state) {}, onError: (error) {});
  }
}
