import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:murny_final_project/method/alert_snackbar.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/navigations/navigation_methods.dart';
import 'package:murny_final_project/screens/google_maps_screen.dart';
import 'package:murny_final_project/screens/home/home_screen.dart';
import 'package:murny_final_project/screens/signIn_signUp/otp_screen.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_up_screen.dart';
import 'package:murny_final_project/widgets/account_text.dart';
import 'package:murny_final_project/widgets/divider_signin_signup.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/text_field.dart';
import 'package:murny_final_project/widgets/up_side_signin_siginup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController conEmail = TextEditingController();
  final TextEditingController conPass = TextEditingController();

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
                    const Align(
                        alignment: Alignment.topRight,
                        child: Text('تسجيل دخول',
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
                      text: 'ادخل ايميلك',
                      typeKeyboard: TextInputType.emailAddress,
                      scure: false,
                      visiblePhone: false,
                      controller: conEmail,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFieldWidget(
                      text: 'ادخل كلمة المرور',
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
                        child: BlocConsumer<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return PrimaryButton(
                              isText: true,
                              title: 'دخول',
                              isPadding: false,
                              onPressed: () {
                                context.read<AuthBloc>().add(AuthLoginEvent(
                                    email: conEmail.text,
                                    password: conPass.text));
                              },
                            );
                          },
                          listener: (context, state) {
                            state is LoadingState
                                ? showLoadingDialog(context: context)
                                : const SizedBox();

                            if (state is AuthLoginErrorState) {
                              Navigator.pop(context);
                              showErrorSnackBar(context, state.errorMsg);
                            }

                            state is AuthLoginSuccessState
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OTPScreen(
                                              email: conEmail.text,
                                            )),
                                  )
                                : const SizedBox();
                          },
                        )

                        // ElevatedButton(
                        //     style: ButtonStyle(
                        //         shape: MaterialStateProperty.all<
                        //                 RoundedRectangleBorder>(
                        //             RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.circular(8))),
                        //         backgroundColor: MaterialStateProperty.all(
                        //             const Color(0xff252C63))),
                        //     onPressed: () {
                        //
                        //     },
                        //     child: const Text(
                        //       'دخول',
                        //       style: TextStyle(
                        //           color: Color(0xffFFFFFF), fontSize: 20),
                        //     )),
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
                      text: ' قم بالتسجيل باستخدام Gmail',
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
                      text: 'قم بالتسجيل باستخدام ابل',
                      image: 'assets/images/Apple.svg',
                      isText: false,
                      isPadding: true,
                    ),

                    SizedBox(
                      height: 2.h,
                    ),
                    AccountText(
                      firstText: 'اشتراك',
                      secondText: 'ليس لديك حساب؟',
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
