import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/account_text.dart';
import 'package:murny_final_project/widgets/button_gmail_apple.dart';
import 'package:murny_final_project/widgets/divider_signin_signup.dart';
import 'package:murny_final_project/widgets/text_field.dart';
import 'package:murny_final_project/widgets/up_side_signin_siginup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
                    const UpSideSigninSignup(
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
                    // TextField(
                    //   keyboardType: TextInputType.number,
                    //   decoration: InputDecoration(
                    //       focusedBorder: OutlineInputBorder(
                    //           borderSide: const BorderSide(color: Color(0xff252C63)),
                    //           borderRadius: BorderRadius.circular(8)),
                    //       disabledBorder: OutlineInputBorder(
                    //           borderSide: const BorderSide(color: Color(0xff252C63)),
                    //           borderRadius: BorderRadius.circular(8)),
                    //       enabledBorder: OutlineInputBorder(
                    //           borderSide: const BorderSide(color: Color(0xff252C63)),
                    //           borderRadius: BorderRadius.circular(8)),
                    //       hintText: 'ادخل رقم جوالك',
                    //       // hintStyle: const TextStyle(fontSize: 18),
                    //       hintTextDirection: TextDirection.rtl),
                    // ),
                    SizedBox(
                      height: 6.h,
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const SignUpScreen()),
                            // );
                          },
                          child: const Text(
                            'دخول',
                            style: TextStyle(
                                color: Color(0xffFFFFFF), fontSize: 20),
                          )),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    const DividerSigninSignup(),
                    // Row(children: [
                    //   Expanded(
                    //     child: Container(
                    //         margin: const EdgeInsets.only(left: 10.0, right: 10),
                    //         child: const Divider(
                    //           thickness: 1,
                    //           color: Color(0xffB8B8B8),
                    //           height: 24,
                    //         )),
                    //   ),
                    //   const Text(
                    //     "أو",
                    //     style: TextStyle(color: Color(0xffB8B8B8)),
                    //   ),
                    //   Expanded(
                    //     child: Container(
                    //         margin: const EdgeInsets.only(left: 10, right: 10.0),
                    //         child: const Divider(
                    //           thickness: 1,
                    //           color: Color(0xffB8B8B8),
                    //           height: 24,
                    //         )),
                    //   ),
                    // ]),
                    SizedBox(
                      height: 3.h,
                    ),
                    // SizedBox(
                    //     height: 48,
                    //     width: 353,
                    //     child: ElevatedButton(
                    //         style: ButtonStyle(
                    //             foregroundColor: MaterialStateProperty.all<Color>(
                    //                 const Color(0xff000000)),
                    //             backgroundColor: MaterialStateProperty.all<Color>(
                    //                 const Color(0xffFFFFFF)),
                    //             shape:
                    //                 MaterialStateProperty.all<RoundedRectangleBorder>(
                    //                     RoundedRectangleBorder(
                    //                         borderRadius: BorderRadius.circular(8),
                    //                         side: const BorderSide(
                    //                             color: Color(0xff252C63))))),
                    //         onPressed: () {
                    //           // Navigator.push(
                    //           //   context,
                    //           //   MaterialPageRoute(
                    //           //       builder: (context) => const SignInScreen()),
                    //           // );
                    //         },
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             const Text('قم بالتسجيل باستخدام Gmail',
                    //                 textDirection: TextDirection.rtl),
                    //             const SizedBox(
                    //               width: 12,
                    //             ),
                    //             Image.asset('assets/images/Gmail.png'),
                    //           ],
                    //         ))),
                    ButtonGmailApple(
                      text: 'قم بالتسجيل باستخدام Gmail',
                      image: 'assets/images/Gmail.png',
                      leftSpace: 0,
                    ),

                    SizedBox(
                      height: 1.h,
                    ),
                    ButtonGmailApple(
                      text: 'قم بالتسجيل باستخدام ابل',
                      image: 'assets/images/Apple.png',
                      leftSpace: 23,
                    ),

                    // SizedBox(
                    //     height: 48,
                    //     width: 353,
                    //     child: ElevatedButton(
                    //         style: ButtonStyle(
                    //             foregroundColor: MaterialStateProperty.all<Color>(
                    //                 const Color(0xff000000)),
                    //             backgroundColor: MaterialStateProperty.all<Color>(
                    //                 const Color(0xffFFFFFF)),
                    //             shape:
                    //                 MaterialStateProperty.all<RoundedRectangleBorder>(
                    //                     RoundedRectangleBorder(
                    //                         borderRadius: BorderRadius.circular(8),
                    //                         side: const BorderSide(
                    //                             color: Color(0xff252C63))))),
                    //         onPressed: () {
                    //           // Navigator.push(
                    //           //   context,
                    //           //   MaterialPageRoute(
                    //           //       builder: (context) => const SignInScreen()),
                    //           // );
                    //         },
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             const Text('قم بالتسجيل باستخدام ابل',
                    //                 textDirection: TextDirection.rtl),
                    //             const SizedBox(
                    //               width: 12,
                    //             ),
                    //             Image.asset('assets/images/Apple.png'),
                    //           ],
                    //         ))),
                    SizedBox(
                      height: 2.h,
                    ),
                    const AccountText(
                      firstText: 'اشتراك',
                      secondText: 'ليس لديك حساب؟',
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     GestureDetector(
                    //         onTap: () {},
                    //         child: const Text("اشتراك",
                    //             textDirection: TextDirection.rtl,
                    //             style: TextStyle(
                    //                 fontSize: 16, color: Color(0xff252C63)))),
                    //     const SizedBox(
                    //       width: 5,
                    //     ),
                    //     const Text(" ليس لديك حساب؟",
                    //         textDirection: TextDirection.rtl,
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 16,
                    //             fontFamily: 'Mulish-Reg',
                    //             color: Color(0xff000000))),
                    //   ],
                    // )
                  ],
                ),
              ),
            )));
  }
}
