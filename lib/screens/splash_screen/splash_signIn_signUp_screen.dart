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

              // child: SegmentedButton<UserType>(
              //   showSelectedIcon: false,
              //   style: const ButtonStyle(
              //       side: MaterialStatePropertyAll(BorderSide(
              //           style: BorderStyle.solid,
              //           color: Color.fromARGB(171, 0, 0, 0))),
              //       overlayColor: MaterialStatePropertyAll(
              //           Color.fromARGB(166, 37, 44, 99)),
              //       foregroundColor:
              //           MaterialStatePropertyAll(Color.fromARGB(217, 0, 0, 0)),
              //       backgroundColor:
              //           MaterialStatePropertyAll(Colors.transparent)),
              //   segments: const <ButtonSegment<UserType>>[
              //     ButtonSegment<UserType>(
              //       value: UserType.user,
              //       label: Text('User'),
              //     ),
              //     ButtonSegment<UserType>(
              //       value: UserType.driver,
              //       label: Text('Drivier'),
              //     ),
              //   ],
              //   selected: <UserType>{typeView},
              //   onSelectionChanged: (Set<UserType> newSelection) {
              //     setState(() {
              //       // By default there is only a single segment that can be
              //       // selected at one time, so its value is always the first
              //       // item in the selected set.
              //       typeView = newSelection.first;
              //     });
              //   },
              // ),
            ),
            Positioned(
              height: 6.h,
              width: 85.w,
              top: 150,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff252C63))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text(
                    'إنشاء حساب',
                    style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
                  )),
            ),
            Positioned(
                height: 6.h,
                width: 85.w,
                top: 220,
                child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff000000)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffFFFFFF)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                        color: Color(0xff252C63))))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(fontSize: 20),
                    )))
          ])
        ],
      ),
    );
  }
}
