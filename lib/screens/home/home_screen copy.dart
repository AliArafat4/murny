import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_bloc.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_event.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_bloc.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_event.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_state.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/screens/balance/balance_home.dart';
import 'package:murny_final_project/screens/contactWithUs/contact_with_us_screen.dart';
import 'package:murny_final_project/screens/editAccount/edit_account_screen.dart';
import 'package:murny_final_project/widgets/content_drawer.dart';
import 'package:murny_final_project/widgets/segment_control.dart';
import 'package:murny_final_project/widgets/text_field_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//delete this screen (drawer for driver)
class HomeScreenDriver extends StatelessWidget {
  HomeScreenDriver({super.key});
  bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            drawer: Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: currentLanguage == 'ar'
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(80),
                        bottomLeft: Radius.circular(80))
                    : const BorderRadius.only(
                        topRight: Radius.circular(80),
                        bottomRight: Radius.circular(80)),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: currentLanguage == 'ar'
                        ? EdgeInsets.only(top: 20.sp, left: 180)
                        : EdgeInsets.only(top: 20.sp, right: 180),
                    child: const CircleAvatar(
                      radius: 44,
                      foregroundImage:
                          AssetImage("assets/images/personalImage.png"),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: currentLanguage == "ar"
                        ? EdgeInsets.only(right: 12.sp)
                        : EdgeInsets.only(left: 12.sp),
                    child: const Text(
                      'User name',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                  ContentDrawer(
                    text: AppLocalizations.of(context)!.editAccount,
                    imageSvg: 'assets/images/editAccount.png',
                    spaceTop: 0.sp,
                    naviPush: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => EditAccount()),
                      // );
                    },
                  ),
                  ContentDrawer(
                    text: AppLocalizations.of(context)!.support,
                    imageSvg: 'assets/images/support.png',
                    spaceTop: 20.sp,
                    naviPush: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactWithUs()),
                      );
                    },
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  ContentDrawer(
                    text: AppLocalizations.of(context)!.wallet,
                    imageSvg: 'assets/images/wallet.png',
                    spaceTop: 15.sp,
                    naviPush: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeBalanceScreen()),
                      );
                    },
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  /*  const SizedBox(
                      // height: 23,
                      child: SegmentControl(
                    textOne: 'العربية',
                    textTwo: 'English',
                    colorSelected: Color(0xff000000),
                    // isSegmentUser: false,
                  )),*/

                  Row(
                    children: [
                      Text("اللغة العربية"),
                      Spacer(),
                      BlocBuilder<LocaleBloc, LocaleState>(
                        builder: (context, state) {
                          if (state is LocaleUpdateState) {
                            print("object");
                            currentLocle = state.locale;
                          }

                          return Switch(
                            value: currentLocle == Locale("ar"),
                            onChanged: (value) {
                              value
                                  ? currentLocle = Locale("ar")
                                  : currentLocle = Locale("en");
                              currentLocle == Locale("ar")
                                  ? context
                                      .read<LocaleBloc>()
                                      .add(ChangeLocaleEvent("ar"))
                                  : context
                                      .read<LocaleBloc>()
                                      .add(ChangeLocaleEvent("en"));
                            },
                          );
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: currentLanguage == 'ar'
                        ? EdgeInsets.only(top: 77.sp, left: 61.sp)
                        : EdgeInsets.only(top: 77.sp, right: 66.sp),
                    child: InkWell(
                      onTap: () {
                        isSwitched
                            ? context
                                .read<ThemeBloc>()
                                .add(ChangeThemeEvent(themeText: "light"))
                            : context
                                .read<ThemeBloc>()
                                .add(ChangeThemeEvent(themeText: "dark"));
                      },
                      child: isSwitched
                          ? Icon(
                              Icons.light_mode_outlined,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.dark_mode_outlined,
                              color: Colors.black,
                            ),
                    ),
                  )
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                top: 40.sp,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldSearch(
                    fun: () => _scaffoldKey.currentState!.openDrawer(),
                  ),
                ],
              ),
            )));
  }
}
