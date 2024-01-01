import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:murny_final_project/method/alert_snackbar.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/screens/create_driver/create_driver_account_screen.dart';
import 'package:murny_final_project/screens/google_maps/google_maps_screen.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_in_screen.dart';

import 'package:murny_final_project/screens/signIn_signUp/sign_up_screen.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/segment_control.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashSignInSignUpScreen extends StatelessWidget {
  const SplashSignInSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      backgroundColor: const Color(0xffEEF0F2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/splashImage.png",
                //  color: Colors.grey,
                width: 430.w,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 48.7.sp,
                  left: 60.5.sp,
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
                textOne: AppLocalizations.of(context)!.user,
                textTwo: AppLocalizations.of(context)!.driver,
                colorSelected: const Color(0xff525884),

                //  isSegmentUser: true,

                func: (value) {
                  selectedIndex = value;
                },
              ),
            ),
            Positioned(
                top: 160,
                child: PrimaryButton(
                  title: AppLocalizations.of(context)!.signUp,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => selectedIndex == 0
                              ? SignUpScreen()
                              : CreateDriverAccountScreen()),
                    );
                  },
                  isText: true,
                  isPadding: false,
                )),
            Positioned(
                top: 220,
                child: PrimaryButton(
                  isBorderBtn: true,
                  title: AppLocalizations.of(context)!.signIn,
                  buttonColor: Colors.transparent,
                  textColor: const Color(0xff000000),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  isText: true,
                  isPadding: false,
                ))
          ])
        ],
      ),
    );
  }
}
