import 'dart:convert';
import 'package:murny_final_project/api/end_points/end_points.dart';

import 'package:http/http.dart' as http;
import 'package:murny_final_project/models/driver_model.dart';
import 'package:murny_final_project/models/order_model.dart';

import '../enums.dart';

class CommonFunc {
  commonFunctionsSelector({
    required Common function,
    required Map<String, dynamic>? body,
    required EndPoints endPoints,
    required String url,
    required String token,
  }) async {
    switch (function) {
      case Common.getOrder:
        try {
          final uri = Uri.parse(url + endPoints.getOrder);

          final response = await http.get(uri, headers: {"token": token});

          final List<OrderModel> orderModelList = [];
          final decodedBody = jsonDecode(response.body);
          for (var order in decodedBody) {
            orderModelList.add(OrderModel.fromJson(order));
          }

          return orderModelList;
        } catch (err) {
          print(err);
        }
      case Common.getDrivers:
        try {
          final uri = Uri.parse(url + endPoints.getDrivers);

          final response = await http.get(uri, headers: {"token": token});

          final List<DriverModel> driverModelList = [];
          final decodedBody = jsonDecode(response.body);
          for (var order in decodedBody) {
            driverModelList.add(DriverModel.fromJson(order));
          }

          return driverModelList;
        } catch (err) {
          print(err);
        }

      default:
        throw "exception";
    }
  }
}
