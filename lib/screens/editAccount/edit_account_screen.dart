import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murny_final_project/method/show_confirm_dilog.dart';
import 'package:murny_final_project/screens/editAccount/component/delete_logout_account.dart';
import 'package:murny_final_project/screens/splash_screen/splash_signIn_signUp_screen.dart';
import 'package:murny_final_project/widgets/arrow_back_circle_container.dart';
import 'package:murny_final_project/widgets/text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditAccount extends StatelessWidget {
  EditAccount({super.key});
  final TextEditingController conFullName = TextEditingController();
  final TextEditingController conUserName = TextEditingController();
  final TextEditingController conPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ArrowBackCircleContainer(
                  text: AppLocalizations.of(context)!.editAccount,
                  textSpace: 37.sp,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Stack(children: [
                  const CircleAvatar(
                    radius: 60,
                    foregroundImage:
                        AssetImage("assets/images/personalImage.png"),
                  ),
                  Positioned(
                      top: 35.sp,
                      left: 35.sp,
                      child: Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                            color: const Color(0xffF5F5F5),
                            borderRadius: BorderRadius.circular(30)),
                        child: SvgPicture.asset(
                          'assets/images/editImage.svg',
                          colorFilter: const ColorFilter.mode(
                              Color(0xff000000), BlendMode.srcIn),
                        ),
                      ))
                ]),
                SizedBox(
                  height: 1.h,
                ),
                const Text(
                  'مروة',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                const Text(
                  '966548784080+',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Column(
                    children: [
                      Align(
                          alignment: currentLanguage == "ar"
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.fullName,
                            style: TextStyle(
                              color: Color(0xff8E98A8),
                            ),
                          )),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFieldWidget(
                        scure: false,
                        typeKeyboard: TextInputType.name,
                        visiblePhone: false,
                        text: '',
                        controller: conFullName,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                          alignment: currentLanguage == "ar"
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.userName,
                            style: TextStyle(
                              color: Color(0xff8E98A8),
                            ),
                          )),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFieldWidget(
                        scure: false,
                        typeKeyboard: TextInputType.name,
                        visiblePhone: false,
                        text: '',
                        controller: conUserName,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                          alignment: currentLanguage == "ar"
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context)!.mobile,
                            style: TextStyle(
                              color: Color(0xff8E98A8),
                            ),
                          )),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFieldWidget(
                        scure: false,
                        typeKeyboard: TextInputType.phone,
                        visiblePhone: true,
                        text: '',
                        controller: conPhoneNumber,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    showConfirmDiolg(
                        context: context,
                        title:
                            AppLocalizations.of(context)!.deleteAccountConfirm,
                        acceptFun: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SplashSignInSignUpScreen()),
                              (Route route) => false);
                        });
                  },
                  child: DeleteLogoutAccount(
                    text: AppLocalizations.of(context)!.deleteAccount,
                    image: 'assets/images/imageDelete.svg',
                  ),
                ),
                Padding(
                  padding: currentLanguage == "ar"
                      ? EdgeInsets.only(left: 60.sp)
                      : EdgeInsets.only(right: 60.sp),
                  child: InkWell(
                    onTap: () {
                      showConfirmDiolg(
                          context: context,
                          title: AppLocalizations.of(context)!.signOutConfirm,
                          acceptFun: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SplashSignInSignUpScreen()),
                                (Route route) => false);
                          });
                    },
                    child: DeleteLogoutAccount(
                      text: AppLocalizations.of(context)!.signOut,
                      image: 'assets/images/imageLogout.svg',
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  height: 6.h,
                  width: 85.w,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff252C63),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.save,
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
