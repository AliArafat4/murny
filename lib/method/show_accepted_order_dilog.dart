import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/success/success.dart';
import 'package:murny_final_project/screens/success/success_message.dart';
import 'package:murny_final_project/widgets/comment_text_filed.dart';
import 'package:murny_final_project/widgets/rating.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
            const Text(
              "تم قبول طلبك",
              style: TextStyle(fontSize: 22),
            ),
            const Text(
              "استمتع في طريقك للوجهة المحددة",
              style: TextStyle(color: Color(0xffCDCED3)),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    ),
  );
}
