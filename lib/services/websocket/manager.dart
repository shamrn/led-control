import 'package:web_socket_channel/io.dart';

class WebSocketManager {
  IOWebSocketChannel channel =
      IOWebSocketChannel.connect(Uri.parse('ws://192.168.0.13:8767'));

  handler(msg) async {
    channel.stream.listen((recMsg) {
      channel.sink.add(msg.toString());
    });
  }
}
