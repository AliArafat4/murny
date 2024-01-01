import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeleteLogoutAccount extends StatelessWidget {
  DeleteLogoutAccount({super.key, required this.text, required this.image});
  final String text;
  final String image;
  bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Padding(
      padding: currentLanguage == "ar"
          ? EdgeInsets.only(right: 19.sp, top: 15.sp)
          : EdgeInsets.only(left: 19.sp, top: 15.sp),
      child: Row(
        children: [
          Image.asset(
            image,
            color: isSwitched ? Colors.white : Colors.black,
          ),
          SizedBox(
            width: 2.w,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
