import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rgb_control/models/mode.dart';
import 'package:rgb_control/utils/app_constants.dart';

class ModeProvider {
  Future<List<Mode>> getModes() async {
    final http.Response response = await http.get(
        Uri.parse('${Api.httpRootUrl}${Api.modeEndpoint}'),
        headers: Api.authHeader);
    if (response.statusCode == 200) {
      final List<dynamic> modeJson =
          json.decode(utf8.decode(response.bodyBytes));
      return modeJson.map((json) => Mode.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching Mode');
    }
  }
}
