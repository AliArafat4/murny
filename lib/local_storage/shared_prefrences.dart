//Save user token and theme

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  late final SharedPreferences _preferences;
  initializePref() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
