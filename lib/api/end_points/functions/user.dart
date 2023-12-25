import 'dart:convert';
import 'package:murny_final_project/api/end_points/end_points.dart';

import 'package:http/http.dart' as http;
import 'package:murny_final_project/models/order_model.dart';

import '../../../models/cart_model.dart';
import '../enums.dart';

class UserFunc {
  userFunctionsSelector({
    required User function,
    required EndPoints endPoints,
    required String url,
    required Map<String, dynamic> body,
    required String token,
  }) async {
    switch (function) {
      case User.postRating:
        try {
          final uri = Uri.parse(url + endPoints.postRating);

          final res = await http
              .post(uri, body: jsonEncode(body), headers: {"token": token});
          print(res.body);
        } catch (err) {
          print(err);
        }
      case User.postUserOrder:
        try {
          final uri = Uri.parse(url + endPoints.postUserOrder);

          final res = await http
              .post(uri, body: jsonEncode(body), headers: {"token": token});
          print(res.body);
        } catch (err) {
          print(err);
        }

      default:
        throw "exception";
    }
  }
}
