import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/google_maps_screen.dart';
import 'package:murny_final_project/screens/success/success.dart';
import 'package:murny_final_project/screens/success/success_message.dart';
import 'package:murny_final_project/widgets/comment_text_filed.dart';
import 'package:murny_final_project/widgets/rating.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

showConfirmDiolg({required BuildContext context}) {
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
                    Text("هل انت متأكد انك تريد الغاء الطلب"),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SecondButton(
                          title: "نعم",
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => SuccessScreen(
                                          message: "تم إلغاء طلبك بنجاح",
                                        )),
                                (Route route) => false);
                          },
                          color: const Color(0xffD7053A),
                        ),
                        SecondButton(
                          title: "لا تراجع",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: const Color(0xff252C63),
                        )
                      ],
                    )
                  ]),
            ),
          ));
}
