import 'dart:convert';
import 'package:murny_final_project/api/end_points/end_points.dart';

import 'package:http/http.dart' as http;
import 'package:murny_final_project/models/profile_model.dart';

import '../enums.dart';

class ProfileFunc {
  profileFunctionsSelector({
    required Profile function,
    required Map<String, dynamic>? body,
    required EndPoints endPoints,
    required String url,
    required String token,
  }) async {
    switch (function) {
      case Profile.getProfile:
        try {
          final uri = Uri.parse(url + endPoints.getProfile);

          print("object");
          final response = await http.get(uri, headers: {"token": token});
          print("object2");
          print(response);

          ProfileModel profileModel =
              ProfileModel.fromJson(jsonDecode(response.body));
          return profileModel;
        } catch (err) {
          print(err);
          return err;
        }

      case Profile.updateUserProfile:
        await uploadProfileData(url, endPoints.updateUserProfile, token, body);
        break;

      case Profile.updateDriverProfile:
        await uploadProfileData(
            url, endPoints.updateDriverProfile, token, body);
        break;

      case Profile.uploadDriverLicense:
        await uploadProfileData(
            url, endPoints.uploadDriverLicense, token, body);
        break;

      case Profile.uploadAvatar:
        await uploadProfileData(url, endPoints.uploadAvatar, token, body);
        break;

      //TODO: FIX DELETE
      case Profile.deleteUserAccount:
        // await uploadProfileData(url, endPoints.deleteAccount, token, body);
        break;

      default:
        throw "exception";
    }
  }

  Future<void> uploadProfileData(String url, String endPoints, String token,
      Map<String, dynamic>? body) async {
    try {
      final uri = Uri.parse(url + endPoints);

      await http.post(uri, headers: {"token": token}, body: jsonEncode(body));
    } catch (err) {
      print(err);
    }
  }
}
