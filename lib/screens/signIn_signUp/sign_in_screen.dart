import 'package:flutter/material.dart';
import 'package:murny_final_project/navigations/navigation_methods.dart';
import 'package:murny_final_project/screens/home/home_screen.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_up_screen.dart';
import 'package:murny_final_project/widgets/account_text.dart';
import 'package:murny_final_project/widgets/divider_signin_signup.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/text_field.dart';
import 'package:murny_final_project/widgets/up_side_signin_siginup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  TextEditingController conEmail = TextEditingController();
  TextEditingController conPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: const Color(0xffFFFFFF),
            body: Padding(
              padding: EdgeInsets.all(20.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UpSideSigninSignup(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      visibleImage: true,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Text(AppLocalizations.of(context)!.signIn,
                            style: TextStyle(
                              fontSize: 28,
                              color: Color(0xff252C63),
                            )
                            //fontWeight: FontWeight.bold),
                            )),
                    SizedBox(
                      height: 8.h,
                    ),

                    TextFieldWidget(
                      text: AppLocalizations.of(context)!.email,
                      typeKeyboard: TextInputType.emailAddress,
                      scure: false,
                      visiblePhone: false,
                      controller: conEmail,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFieldWidget(
                      text: AppLocalizations.of(context)!.password,
                      typeKeyboard: TextInputType.visiblePassword,
                      scure: true,
                      visiblePhone: false,
                      controller: conPass,
                    ),

                    // ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 54,
                      width: 340,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff252C63))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.signIn,
                            style: TextStyle(
                                color: Color(0xffFFFFFF), fontSize: 20),
                          )),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    const DividerSigninSignup(),

                    SizedBox(
                      height: 3.h,
                    ),

                    PrimaryButton(
                      buttonColor: Colors.transparent,
                      onPressed: () {},
                      text: AppLocalizations.of(context)!.signUpGmail,
                      image: 'assets/images/gmail.svg',
                      isText: false,
                      isPadding: false,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    PrimaryButton(
                      buttonColor: Colors.transparent,
                      onPressed: () {},
                      text: AppLocalizations.of(context)!.signUpApple,
                      image: 'assets/images/Apple.svg',
                      isText: false,
                      isPadding: true,
                    ),

                    SizedBox(
                      height: 2.h,
                    ),
                    AccountText(
                      firstText: AppLocalizations.of(context)!.subscribing,
                      secondText:
                          AppLocalizations.of(context)!.doNotHaveAccount,
                      pushNavi: () {
                        navigation(
                          context: context,
                          type: 'push',
                          screen: SignUpScreen(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
