import 'package:murny_final_project/local_storage/shared_prefrences.dart';

bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;
