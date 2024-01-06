import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_bloc.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_event.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_bloc.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_event.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_state.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/screens/balance/balance_home.dart';
import 'package:murny_final_project/screens/contactWithUs/contact_with_us_screen.dart';
import 'package:murny_final_project/widgets/content_drawer.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DriverDrawer extends StatelessWidget {
  const DriverDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: currentLanguage == 'ar'
            ? const BorderRadius.only(topLeft: Radius.circular(80), bottomLeft: Radius.circular(80))
            : const BorderRadius.only(
                topRight: Radius.circular(80), bottomRight: Radius.circular(80)),
      ),
      child: ListView(
        children: [
          Padding(
            padding: currentLanguage == 'ar'
                ? EdgeInsets.only(top: 20.sp, left: 180)
                : EdgeInsets.only(top: 20.sp, right: 180),
            child: const CircleAvatar(
              radius: 44,
              foregroundImage: AssetImage("assets/images/personalImage.png"),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
                MaterialPageRoute(builder: (context) => const ContactWithUs()),
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
                MaterialPageRoute(builder: (context) => const HomeBalanceScreen()),
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
              const Text("اللغة العربية"),
              const Spacer(),
              BlocBuilder<LocaleBloc, LocaleState>(
                builder: (context, state) {
                  if (state is LocaleUpdateState) {
                    currentLocle = state.locale;
                  }

                  return Switch(
                    value: currentLocle == const Locale("ar"),
                    onChanged: (value) {
                      value ? currentLocle = const Locale("ar") : currentLocle = const Locale("en");
                      currentLocle == const Locale("ar")
                          ? context.read<LocaleBloc>().add(ChangeLocaleEvent("ar"))
                          : context.read<LocaleBloc>().add(ChangeLocaleEvent("en"));
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
                    ? context.read<ThemeBloc>().add(ChangeThemeEvent(themeText: "light"))
                    : context.read<ThemeBloc>().add(ChangeThemeEvent(themeText: "dark"));
              },
              child: isSwitched
                  ? const Icon(
                      Icons.light_mode_outlined,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.dark_mode_outlined,
                      color: Colors.black,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
