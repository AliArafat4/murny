import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:murny_final_project/api/end_points/functions/Authentication.dart';
import 'package:murny_final_project/api/end_points/functions/chat.dart';
import 'package:murny_final_project/api/end_points/end_points.dart';
import 'package:murny_final_project/api/end_points/functions/common.dart';
import 'package:murny_final_project/api/end_points/functions/public.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/screens/splash_screen/splash_signIn_signUp_screen.dart';
import 'end_points/enums.dart';
import 'end_points/functions/driver.dart';
import 'end_points/functions/profile.dart';
import 'end_points/functions/user.dart';

class MurnyApi {
  final String url = "https://murny-api.onrender.com";
  EndPoints endPoints = EndPoints();

  signIn({required Map<String, dynamic> body, required Auth function}) async {
    try {
      final url = this.url + endPoints.authRoute;
      final res = await Authentication().authFunctionsSelector(
          function: function, body: body, endPoints: endPoints, url: url);
      print("done");

      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }

  chat({
    required Map<String, dynamic> body,
    required Chat function,
    //TODO: REMOVE TOKEN
    required String token,
  }) {
    final url = this.url + endPoints.chatRoute;
    ChatFunc().chatFunctionsSelector(
        function: function,
        url: url,
        endPoints: endPoints,
        body: body,
        token: token);
  }

  profile({
    required Map<String, dynamic> body,
    required Profile function,
    required String token,
  }) {
    final url = this.url + endPoints.profileRoute;
    ProfileFunc().profileFunctionsSelector(
        function: function,
        url: url,
        endPoints: endPoints,
        body: body,
        token: token);
  }

  user({
    required Map<String, dynamic> body,
    required User function,
    required String token,
  }) {
    final url = this.url + endPoints.userRoute;
    UserFunc().userFunctionsSelector(
        function: function,
        url: url,
        endPoints: endPoints,
        body: body,
        token: token);
  }

  driver({
    required Map<String, dynamic> body,
    required Driver function,
    required String token,
  }) {
    final url = this.url + endPoints.driverRoute;
    DriverFunc().driverFunctionsSelector(
        function: function,
        url: url,
        endPoints: endPoints,
        body: body,
        token: token);
  }

  public({
    required Public function,
    required Map<String, dynamic> body,
  }) {
    final url = this.url + endPoints.publicRoute;
    return PublicFunc().publicFunctionsSelector(
      function: function,
      url: url,
      endPoints: endPoints,
      body: body,
    );
  }

  common({
    required Map<String, dynamic> body,
    required Common function,
    required String token,
  }) async {
    final url = this.url + endPoints.commonRoute;
    return await CommonFunc().commonFunctionsSelector(
        function: function,
        url: url,
        endPoints: endPoints,
        body: body,
        token: token);
  }

  signOut({required BuildContext context}) {
    pref.clearUser();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const SplashSignInSignUpScreen()),
        (route) => false);
  }
}
