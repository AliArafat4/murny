import 'dart:convert';
import 'package:murny_final_project/api/end_points/end_points.dart';

import 'package:http/http.dart' as http;
import 'package:murny_final_project/models/order_model.dart';

import '../../../models/cart_model.dart';
import '../enums.dart';

class PublicFunc {
  publicFunctionsSelector({
    required Public function,
    required EndPoints endPoints,
    required String url,
  }) async {
    switch (function) {
      case Public.getCarts:
        try {
          final uri = Uri.parse(url + endPoints.getCarts);

          final response = await http.get(uri);
          print("carts response");
          print(response.body);

          final List<CartModel> cartModelList = [];
          final decodedBody = jsonDecode(response.body);
          for (var cart in decodedBody) {
            cartModelList.add(CartModel.fromJson(cart));
          }

          return cartModelList;
        } catch (err) {
          print(err);
        }

      default:
        throw "exception";
    }
  }
}
