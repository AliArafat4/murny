import 'dart:convert';
import 'package:murny_final_project/api/end_points/end_points.dart';
import 'package:murny_final_project/models/sign_up_model.dart';
import 'package:http/http.dart' as http;

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
        return await signUp(url: url + endPoints.driverSignUp, body: body);

      case Auth.signInWithApple:
        return await signUp(url: url + endPoints.signInWithApple, body: body);

      case Auth.signInWithGoogle:
        return await signUp(url: url + endPoints.signInWithGoogle, body: body);

      case Auth.otp:
        return await signUp(url: url + endPoints.otp, body: body);

      case Auth.signIn:
        return await signUp(url: url + endPoints.signIn, body: body);
      default:
        throw "exception";
    }
  }

  Future<SignUpModel> signUp({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: jsonEncode(body));

    final SignUpModel signUpModel =
        SignUpModel.fromJson(jsonDecode(response.body));
    return signUpModel;
  }
}
