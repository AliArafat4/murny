//Save user token and theme

import 'dart:convert';

import 'package:murny_final_project/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  late final SharedPreferences _preferences;
  initializePref() async {
    _preferences = await SharedPreferences.getInstance();
  }

  void setToken(String token) async {
    await _preferences.setString("token", token);
  }

  String getToken() {
    return _preferences.getString("token") ?? "";
  }

  void cleanToken() async {
    await _preferences.setString("token", "");
  }

  void setUser(AuthModel user) async {
    await _preferences.setString("user", jsonEncode(user));
  }

  String getUser() {
    AuthModel user = AuthModel();
    return _preferences.getString("user") ?? jsonEncode(user);
  }

  void clearUser() async {
    await _preferences.setString("user", "");
  }

  void cleanSharedPref() {
    _preferences.clear();
  }
}
