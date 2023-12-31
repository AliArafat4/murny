import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:murny_final_project/screens/balance/balance_home.dart';
import 'package:murny_final_project/screens/contactWithUs/contact_with_us_screen.dart';
import 'package:murny_final_project/screens/editAccount/edit_account_screen.dart';
import 'package:murny_final_project/widgets/content_drawer.dart';
import 'package:murny_final_project/widgets/segment_control.dart';
import 'package:murny_final_project/widgets/text_field_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
        backgroundColor: const Color.fromARGB(189, 44, 44, 205),
        drawer: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: currentLanguage == 'ar'
                ? BorderRadius.only(
                    topLeft: Radius.circular(80),
                    bottomLeft: Radius.circular(80))
                : BorderRadius.only(
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
                padding: currentLanguage == 'ar'
                    ? EdgeInsets.only(right: 12.sp)
                    : EdgeInsets.only(left: 12.sp),
                child: const Text(
                  'مروة',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: currentLanguage == 'ar'
                    ? EdgeInsets.only(right: 12.sp)
                    : EdgeInsets.only(left: 12.sp),
                child: Row(
                  children: [
                    const Text(
                      '966548784080+',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    )
                  ],
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
                },
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.support,
                imageSvg: 'assets/images/imageSupport.svg',
                spaceTop: 20.sp,
                naviPush: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContactWithUs()),
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
                    MaterialPageRoute(
                        builder: (context) => const HomeBalanceScreen()),
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
              ),
              const Divider(
                thickness: 1,
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.termsAndConditions,
                imageSvg: 'assets/images/imageConditions.svg',
                spaceTop: 15.sp,
              ),
              const Divider(
                thickness: 1,
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.privacyPolicy,
                imageSvg: 'assets/images/imagePrivacy.svg',
                spaceTop: 15.sp,
              ),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                  // height: 23,
                  child: SegmentControl(
                textOne: 'العربية',
                textTwo: 'English',
                colorSelected: const Color(0xff000000),
                // isSegmentUser: false,
              )),
              Padding(
                padding: currentLanguage == 'ar'
                    ? EdgeInsets.only(top: 52.sp, left: 61.sp)
                    : EdgeInsets.only(top: 52.sp, right: 61.sp),
                child: const Icon(Icons.light_mode_outlined),
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: 20.h,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    color: Color(0xffFFFFFF)),
                child: Stack(
                  children: [
                    Positioned(
                      child: Center(
                        child: SizedBox(
                          height: 6.h,
                          width: 85.w,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xff252C63))),
                            onPressed: () {},
                            child: Text(
                              AppLocalizations.of(context)!.orderNow,
                              style: const TextStyle(
                                  color: Color(0xffFFFFFF), fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
