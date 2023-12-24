import 'package:murny_final_project/api/end_points/functions/Authentication.dart';
import 'package:murny_final_project/api/end_points/functions/chat.dart';
import 'package:murny_final_project/api/end_points/end_points.dart';
import 'package:murny_final_project/api/end_points/functions/common.dart';
import 'end_points/enums.dart';
import 'end_points/functions/profile.dart';

class MurnyApi {
  final String url = "https://murny-api.onrender.com";
  EndPoints endPoints = EndPoints();

  signIn({required Map<String, dynamic> body, required Auth function}) async {
    try {
      final url = this.url + endPoints.authRoute;
      await Authentication().authFunctionsSelector(
          function: function, body: body, endPoints: endPoints, url: url);
    } catch (err) {
      print(err);
    }
  }

  chat({
    required Map<String, dynamic> body,
    required Chat function,
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
    required Chat function,
    required String token,
  }) {
    final url = this.url + endPoints.chatRoute;
    // ChatFunc().chatFunctionsSelector(
    //     function: function,
    //     url: url,
    //     endPoints: endPoints,
    //     body: body,
    //     token: token);
  }

  driver({
    required Map<String, dynamic> body,
    required Chat function,
    required String token,
  }) {
    final url = this.url + endPoints.chatRoute;
    // ChatFunc().chatFunctionsSelector(
    //     function: function,
    //     url: url,
    //     endPoints: endPoints,
    //     body: body,
    //     token: token);
  }

  public({
    required Map<String, dynamic> body,
    required Chat function,
    required String token,
  }) {
    final url = this.url + endPoints.chatRoute;
    // ChatFunc().chatFunctionsSelector(
    //     function: function,
    //     url: url,
    //     endPoints: endPoints,
    //     body: body,
    //     token: token);
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
}
