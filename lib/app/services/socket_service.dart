
import 'package:gvinum_travel/all_material.dart';
import 'package:gvinum_travel/app/data/api_url.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static IO.Socket? socket;

  static void init() {
    final token = AllMaterial.box.read("token");
    socket = IO.io(
      'http://${ApiUrl.baseUrl}:2008',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setAuth({'access_token': token})
          .build(),
    );
  }
}