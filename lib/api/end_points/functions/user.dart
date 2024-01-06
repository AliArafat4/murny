import 'dart:convert';
import 'package:murny_final_project/api/end_points/end_points.dart';

import 'package:http/http.dart' as http;
import 'package:murny_final_project/models/profile_model.dart';
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

          await http.post(uri, body: jsonEncode(body), headers: {"token": token});
        } catch (err) {
          // print(err);
        }
      case User.postUserOrder:
        try {
          final uri = Uri.parse(url + endPoints.postUserOrder);

          await http.post(uri, body: jsonEncode(body), headers: {"token": token});
        } catch (err) {
          // print(err);
        }
      case User.getUserByID:
        try {
          final uri = Uri.parse(url + endPoints.getUserByID);

          final res = await http.post(uri, body: jsonEncode(body), headers: {"token": token});
          return ProfileModel.fromJson(jsonDecode(res.body));
        } catch (err) {
          // print(err);
        }
      case User.cancelOrder:
        try {
          final uri = Uri.parse(url + endPoints.cancelOrder);

          await http.post(uri, body: jsonEncode(body), headers: {"token": token});
        } catch (err) {
          // print(err);
        }

      default:
        throw "exception";
    }
  }
}
