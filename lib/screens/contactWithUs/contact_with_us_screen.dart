import 'package:flutter/material.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:murny_final_project/method/show_confirm_dilog.dart';

import 'package:murny_final_project/screens/contactWithUs/component/call_phone_whatsapp.dart';
import 'package:murny_final_project/widgets/arrow_back_circle_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactWithUs extends StatelessWidget {
  ContactWithUs({super.key});
  bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ArrowBackCircleContainer(
            text: AppLocalizations.of(context)!.contactUs,
            textSpace: 37.sp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.sp),
            child: Column(
              children: [
                CallPhoneWhatsapp(
                  text: AppLocalizations.of(context)!.callUs,
                  image: isSwitched
                      ? 'assets/images/contactUsImageWhite1.svg'
                      : 'assets/images/contactUsImage1.svg',
                  funAlert: () {
                    //TODO: REDIRECT TO PHONE CALL

                    // alertDialogAccount(
                    //   context: context,
                    //   title: 'اتصل بنا على رقمنا',
                    //   subtitle: '0565553090',
                    //   textButton1: 'اتصل',
                    //   textButton2: 'إلغاء',
                    // );
                  },
                ),
                const Divider(),
                CallPhoneWhatsapp(
                  text: AppLocalizations.of(context)!.contactUs,
                  image: isSwitched
                      ? 'assets/images/contactUsImageWhite2.svg'
                      : 'assets/images/contactUsImage2.svg',
                  funAlert: () {},
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
