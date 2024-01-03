import 'package:flutter/material.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showAcceptedOrderDiolg({required BuildContext context}) {
  bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 0,
      backgroundColor: isSwitched ? null : Colors.white,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/success_blue.png",
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              AppLocalizations.of(context)!.acceptedOrder,
              style: TextStyle(
                fontSize: 22,
                color: isSwitched ? Colors.white : Color(0xff252C63),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.acceptedOrderdescription,
              style: TextStyle(
                color:
                    isSwitched ? Colors.white : Colors.black.withOpacity(0.4),
              ),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    ),
  );
}
