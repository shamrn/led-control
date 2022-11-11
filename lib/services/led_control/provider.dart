import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rgb_control/models/led_state.dart';
import 'package:rgb_control/services/led_control/handler.dart';
import 'package:rgb_control/utils/app_constants.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketManager {
  static final WebSocketManager _singleton = WebSocketManager._internal();
  static IOWebSocketChannel channel = IOWebSocketChannel.connect(
      Uri.parse('${Api.wsRootUrl}${Api.ledControlWsEndpoint}?${Api.poolQuery}'),
      headers: Api.authHeader);

  factory WebSocketManager() {
    return _singleton;
  }

  WebSocketManager._internal();

  addEvent(Map<dynamic, dynamic> event) {
    channel.sink.add(json.encode(event));
  }

  listen(BuildContext context) async {
    channel.stream.listen((msg) {
      handler(context: context, ledState: LedState.fromJson(json.decode(msg)));
    }, onError: (error) {});
  }
}
