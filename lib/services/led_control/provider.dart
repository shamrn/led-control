import 'dart:convert';

import 'package:rgb_control/utils/app_constants.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketManager {
  static final WebSocketManager _singleton = WebSocketManager._internal();
  static IOWebSocketChannel channel =
      IOWebSocketChannel.connect(Uri.parse('${Api.host}:${Api.port}'));

  factory WebSocketManager() {
    return _singleton;
  }

  WebSocketManager._internal();

  addEvent(Map<dynamic, dynamic> event) {
    channel.sink.add(json.encode(event));
  }

  Map<dynamic, dynamic>? listen() {
    channel.stream.listen((recMsg) {
      // WebSocketHandler(State.fromJson(json.decode(recMsg))).handleState();
      return json.decode(recMsg);
    });

    return {'123': '123'};
  }
}
