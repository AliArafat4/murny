import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:murny_final_project/screens/editAccount/edit_account_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContentDrawer extends StatelessWidget {
  ContentDrawer(
      {super.key,
      required this.imageSvg,
      required this.text,
      required this.spaceTop,
      this.naviPush});
  final String imageSvg;
  final String text;
  final double spaceTop;
  final Function? naviPush;
  bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Padding(
      padding: currentLanguage == 'ar'
          ? EdgeInsets.only(right: 15.sp, top: spaceTop)
          : EdgeInsets.only(left: 15.sp, top: spaceTop),
      child: InkWell(
        onTap: () => naviPush!(),
        child: Row(
          children: [
            Image.asset(
              imageSvg,
              color: isSwitched ? Colors.white : Colors.black,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
