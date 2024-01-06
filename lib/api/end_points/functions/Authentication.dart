import 'package:murny_final_project/api/end_points/end_points.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../enums.dart';

class Authentication {
  authFunctionsSelector({
    required Auth function,
    required Map<String, dynamic> body,
    required EndPoints endPoints,
    required String url,
  }) async {
    switch (function) {
      case Auth.userSignUp:
        return await signUp(url: url + endPoints.userSignUp, body: body);

      case Auth.driverSignUp:
        final uri = Uri.parse(url + endPoints.driverSignUp);
        final response = await http.post(uri, body: jsonEncode(body));

        final AuthModel authModel = AuthModel.fromJson(jsonDecode(response.body));
        pref.setUser(authModel);
        if (response.statusCode >= 400 && response.statusCode < 500) {
          throw "err";
        } else {
          return authModel;
        }

      case Auth.signInWithApple:
        return await signUp(url: url + endPoints.signInWithApple, body: body);

      case Auth.signInWithGoogle:
        return await signUp(url: url + endPoints.signInWithGoogle, body: body);

      case Auth.otp:
        final uri = Uri.parse(url + endPoints.otp);

        final response = await http.post(uri, body: jsonEncode(body));

        if (response.statusCode >= 400 && response.statusCode < 500) {
          throw "err";
        } else {
          return true;
        }

      case Auth.resendOtp:
        final uri = Uri.parse(url + endPoints.resendOtp);

        final response = await http.post(uri, body: jsonEncode(body));
        if (response.statusCode >= 400 && response.statusCode < 500) {
          throw "err";
        } else {
          return true;
        }

      case Auth.signIn:
        return await signUp(url: url + endPoints.signIn, body: body);

      default:
        throw "exception";
    }
  }

  Future<AuthModel> signUp({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: jsonEncode(body));

    final AuthModel authModel = AuthModel.fromJson(jsonDecode(response.body));
    pref.setUser(authModel);

    return authModel;
  }
}
