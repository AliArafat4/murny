import 'dart:convert';
import 'package:murny_final_project/api/end_points/end_points.dart';

import 'package:http/http.dart' as http;
import 'package:murny_final_project/models/driver_model.dart';
import '../enums.dart';

class DriverFunc {
  driverFunctionsSelector({
    required Driver function,
    required EndPoints endPoints,
    required String url,
    required Map<String, dynamic>? body,
    required String token,
  }) async {
    switch (function) {
      case Driver.getRating:
        try {
          final uri = Uri.parse(url + endPoints.getRating);

          await http.get(uri, headers: {"token": token});
        } catch (err) {
          // print(err);
        }
      case Driver.responseToOrder:
        try {
          final uri = Uri.parse(url + endPoints.responseToOrder);

          await http.post(uri, body: jsonEncode(body), headers: {"token": token});
        } catch (err) {
          // print(err);
        }
      case Driver.getDriverByID:
        try {
          final uri = Uri.parse(url + endPoints.getDriverByID);

          final res = await http.post(uri, body: jsonEncode(body), headers: {"token": token});

          return DriverModel.fromJson(jsonDecode(res.body));
        } catch (err) {
          // print(err);
        }

      default:
        throw "exception";
    }
  }
}
