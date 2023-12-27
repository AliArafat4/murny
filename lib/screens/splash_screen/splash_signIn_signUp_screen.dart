import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_in_screen.dart';

import 'package:murny_final_project/screens/signIn_signUp/sign_up_screen.dart';
import 'package:murny_final_project/widgets/segment_control.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashSignInSignUpScreen extends StatelessWidget {
  const SplashSignInSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF0F2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/splashImage.png",
                width: 430.w,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 49.7.sp,
                  left: 61.5.sp,
                  child: Image.asset(
                    "assets/images/carRight.png",
                  )),
            ],
          ),
          Stack(alignment: Alignment.center, children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                color: Color(0xffFFFFFF),
              ),
            ),
            Positioned(
              top: 30.sp,
              left: 48.sp,
              child: SegmentControl(
                textOne: 'مستخدم',
                textTwo: 'سائق',
                colorSelected: const Color(0xff525884),
              ),
            ),
            Positioned(
                top: 160,
                child: PrimaryButton(
                  title: "إنشاء حساب",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  isText: true,
                )),
            Positioned(
                top: 220,
                child: PrimaryButton(
                  title: "تسجيل الدخول",
                  buttonColor: Colors.transparent,
                  textColor: const Color(0xff000000),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  isText: true,
                ))
          ])
        ],
      ),
    );
  }
}
