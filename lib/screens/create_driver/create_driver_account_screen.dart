import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_in_screen.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_up_screen.dart';
import 'package:murny_final_project/screens/splash_screen/splash_screen.dart';
import 'package:murny_final_project/screens/splash_screen/splash_signIn_signUp_screen.dart';
import 'package:murny_final_project/widgets/account_text.dart';
import 'package:murny_final_project/widgets/button_gmail_apple.dart';
import 'package:murny_final_project/widgets/city_dropdown_menu.dart';
import 'package:murny_final_project/widgets/divider_signin_signup.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:murny_final_project/widgets/text_field.dart';
import 'package:murny_final_project/widgets/up_side_signin_siginup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreatDriverAccountScreen extends StatefulWidget {
  const CreatDriverAccountScreen({super.key});

  @override
  State<CreatDriverAccountScreen> createState() => _CreatAccountState();
}

class _CreatAccountState extends State<CreatDriverAccountScreen> {
  String? selectedOption = "";
  TextEditingController conName = TextEditingController();
  TextEditingController conPhone = TextEditingController();
  TextEditingController conEmail = TextEditingController();
  TextEditingController conPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UpSideSigninSignup(
                visibleImage: true,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => SplashSignInSignUpScreen()),
                      (Route route) => false);
                },
              ),
              const Align(
                  alignment: Alignment.topRight,
                  child: Text('إنشاء حساب',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xff252C63),
                      ))),
              SizedBox(
                height: 3.h,
              ),
              TextFieldWidget(
                text: 'الإسم الثلاثي',
                typeKeyboard: TextInputType.name,
                scure: false,
                visiblePhone: false,
                controller: conName,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFieldWidget(
                text: 'ادخل رقم جوالك',
                typeKeyboard: TextInputType.phone,
                scure: false,
                visiblePhone: true,
                controller: conPhone,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFieldWidget(
                text: 'ادخل ايميلك',
                typeKeyboard: TextInputType.emailAddress,
                scure: false,
                visiblePhone: false,
                controller: conEmail,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFieldWidget(
                text: 'ادخل كلمة المرور',
                typeKeyboard: TextInputType.visiblePassword,
                scure: true,
                visiblePhone: false,
                controller: conPass,
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: const Text(
                  "الجنس",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                children: [
                  Radio(
                    value: "male",
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedOption = value;
                        },
                      );
                    },
                  ),
                  const Icon(
                    Icons.boy,
                    size: 32,
                  ),
                  Radio(
                    value: "female",
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(
                        () {
                          selectedOption = value;
                        },
                      );
                    },
                  ),
                  const Icon(
                    Icons.girl,
                    size: 32,
                  ),
                  const Spacer(),
                  const CityDropDownMenu(),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: const Text(
                  "ارفق رخصة القيادة",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 52,
              ),
              Center(
                child: SecondButton(
                  title: "رخصة القيادة",
                  onPressed: () {},
                  color: Colors.white,
                  isFill: false,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 82,
              ),
              const Center(
                child: Text(
                  "(ميغابايت 2) PDF,DOCX,DOC",
                  style: TextStyle(color: Color(0xff8E98A8)),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              PrimaryButton(
                  title: "اشتراك",
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                        (Route route) => false);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
