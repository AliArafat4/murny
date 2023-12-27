import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

showConfirmDiolg(
    {required BuildContext context,
    required String title,
    required Function() acceptFun}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.h),
            Text(title),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondButton(
                  title: "لا تراجع",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: const Color(0xff252C63),
                ),
                SecondButton(
                  title: "نعم",
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
