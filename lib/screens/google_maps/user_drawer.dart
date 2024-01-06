import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_bloc.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_event.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_state.dart';
import 'package:murny_final_project/bloc/profile_bloc/profile_bloc.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_bloc.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_event.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/screens/balance/balance_home.dart';
import 'package:murny_final_project/screens/contactWithUs/contact_with_us_screen.dart';
import 'package:murny_final_project/screens/editAccount/edit_account_screen.dart';
import 'package:murny_final_project/widgets/content_drawer.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

    return Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: currentLanguage == 'ar'
                ? const BorderRadius.only(
                    topLeft: Radius.circular(80), bottomLeft: Radius.circular(80))
                : const BorderRadius.only(
                    topRight: Radius.circular(80), bottomRight: Radius.circular(80))),
        child: ListView(children: [
          BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: currentLanguage == 'ar'
                    ? EdgeInsets.only(top: 20.sp, right: 10.sp)
                    : EdgeInsets.only(top: 20.sp, left: 10.sp),
                child: CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    radius: 44,
                    child: state is ProfileGetCurrentUserState
                        ? Image.network(
                            state.user.image ??
                                'https://icons.veryicon.com/png/o/miscellaneous/conventional-use/personal-43.png',
                            height: 9.5.h,
                          )
                        : null),
              ),
              SizedBox(
                height: 2.h,
              ),

              Padding(
                padding: currentLanguage == "ar"
                    ? EdgeInsets.only(right: 12.sp)
                    : EdgeInsets.only(left: 12.sp),
                child: Text(
                  state is ProfileGetCurrentUserState ? '${state.user.name}' : '',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: currentLanguage == "ar"
                    ? EdgeInsets.only(right: 12.sp)
                    : EdgeInsets.only(left: 12.sp),
                child: Text(
                  state is ProfileGetCurrentUserState
                      ? currentLanguage == "ar"
                          ? '966${state.user.phone}+'
                          : '+966${state.user.phone}'
                      : '',
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                ),
              ),

              ContentDrawer(
                text: AppLocalizations.of(context)!.editAccount,
                imageSvg: 'assets/images/imageEditAccount.svg',
                spaceTop: 0.sp,
                naviPush: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditAccount()),
                  );

                  // //MurnyApi().signOut(context: context);
                  // showMainBottomSheet(context: context);
                },
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.support,
                imageSvg: 'assets/images/imageSupport.svg',
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
                imageSvg: 'assets/images/imageWallet.svg',
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
              ContentDrawer(
                text: AppLocalizations.of(context)!.aboutUs,
                imageSvg: 'assets/images/imageInfo.svg',
                spaceTop: 15.sp,
                naviPush: () {
                  //showAcceptOrderBottomSheet(context: context);
                  // showOrderBottomSheet(context: context, currentLocation: '', destination: '', markerInfo:,)
                },
              ),
              const Divider(
                thickness: 1,
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.termsAndConditions,
                imageSvg: 'assets/images/imageConditions.svg',
                spaceTop: 15.sp,
                naviPush: () {},
              ),
              const Divider(
                thickness: 1,
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.privacyPolicy,
                imageSvg: 'assets/images/imagePrivacy.svg',
                spaceTop: 15.sp,
                naviPush: () {},
              ),
              const Divider(
                thickness: 1,
              ),
              // SizedBox(
              //     // height: 23,
              //     child: SegmentControl(
              //   textOne: 'العربية',
              //   textTwo: 'English',
              //   colorSelected: const Color(0xff000000),
              //   // isSegmentUser: false,
              // )),
              Row(
                children: [
                  Padding(
                    padding: currentLanguage == "ar"
                        ? EdgeInsets.only(right: 15.sp)
                        : EdgeInsets.only(left: 15.sp),
                    child: const Text(
                      "اللغة العربية",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                  ),
                  const Spacer(),
                  BlocBuilder<LocaleBloc, LocaleState>(
                    builder: (context, state) {
                      if (state is LocaleUpdateState) {
                        currentLocle = state.locale;
                      }

                      return Switch(
                        activeColor: Colors.white,
                        activeTrackColor: const Color(0xff252C63),
                        inactiveThumbColor: Colors.white,
                        inactiveTrackColor: Colors.grey,
                        value: currentLocle == const Locale("ar"),
                        onChanged: (value) {
                          value
                              ? currentLocle = const Locale("ar")
                              : currentLocle = const Locale("en");
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
                    ? EdgeInsets.only(top: 53.sp, left: 67.sp)
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
            ]);
          })
        ]));
  }
}
