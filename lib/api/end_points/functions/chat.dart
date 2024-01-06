import 'dart:convert';
import 'package:murny_final_project/api/end_points/end_points.dart';

import 'package:http/http.dart' as http;

import '../enums.dart';

class ChatFunc {
  chatFunctionsSelector({
    required Chat function,
    required Map<String, dynamic>? body,
    required EndPoints endPoints,
    required String url,
    required String token,
  }) async {
    switch (function) {
      case Chat.sendMessages:
        try {
          final uri = Uri.parse(url + endPoints.sendMessages);

          await http.post(uri, body: jsonEncode(body), headers: {"token": token});
        } catch (err) {
          // print(err);
        }

      default:
        throw "exception";
    }
  }
}
