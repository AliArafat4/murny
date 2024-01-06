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
      case Common.getUserOrder:
        try {
          final uri = Uri.parse(url + endPoints.getUserOrder);

          final response = await http.get(uri, headers: {"token": token});

          final List<OrderModel> orderModelList = [];
          final decodedBody = jsonDecode(response.body);
          for (var order in decodedBody) {
            orderModelList.add(OrderModel.fromJson(order));
          }

          return orderModelList;
        } on FormatException catch (_) {
          return false;
        } catch (err) {
          return false;
        }
      case Common.getLastUserOrder:
        try {
          final uri = Uri.parse(url + endPoints.getLastUserOrder);

          final response = await http.get(uri, headers: {"token": token});

          final decodedBody = jsonDecode(response.body);

          return decodedBody;
        } on FormatException catch (_) {
          return false;
        } catch (err) {
          return false;
        }
      case Common.getDriverOrder:
        try {
          final uri = Uri.parse(url + endPoints.getDriverOrder);

          final response = await http.get(uri, headers: {"token": token});

          final List<OrderModel> orderModelList = [];
          final decodedBody = jsonDecode(response.body);
          for (var order in decodedBody) {
            orderModelList.add(OrderModel.fromJson(order));
          }

          return orderModelList;
        } on FormatException catch (_) {
          return false;
        } catch (err) {
          return false;
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
          return false;
        }

      case Common.filterDrivers:
        try {
          final uri = Uri.parse(url + endPoints.getDrivers);

          final response = await http.post(uri, headers: {"token": token}, body: jsonEncode(body));

          final List<DriverModel> driverModelList = [];
          final decodedBody = jsonDecode(response.body);
          for (var order in decodedBody) {
            driverModelList.add(DriverModel.fromJson(order));
          }

          return driverModelList;
        } catch (err) {
          return false;
        }

      default:
        throw "exception";
    }
  }
}
