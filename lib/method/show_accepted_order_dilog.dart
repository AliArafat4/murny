import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showAcceptedOrderDiolg({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
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
              style: TextStyle(fontSize: 22),
            ),
            Text(
              AppLocalizations.of(context)!.acceptedOrderdescription,
              style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    ),
  );
}
