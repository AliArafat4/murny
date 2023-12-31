import 'package:flutter/material.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showConfirmDiolg(
    {required BuildContext context, required String title, required Function() acceptFun}) {
  bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      elevation: 0,
      backgroundColor: isSwitched ? null : Colors.white,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.h),
            Text(
              title,
              style: TextStyle(
                color: isSwitched ? Colors.white : const Color(0xff2B2B62),
              ),
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondButton(
                  title: AppLocalizations.of(context)!.cancel,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: const Color(0xff252C63),
                ),
                SecondButton(
                  title: AppLocalizations.of(context)!.yes,
                  onPressed: acceptFun,
                  color: const Color(0xffD7053A),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
