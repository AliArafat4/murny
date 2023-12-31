import 'package:flutter/material.dart';
import 'package:murny_final_project/method/show_confirm_dilog.dart';

import 'package:murny_final_project/screens/contactWithUs/component/call_phone_whatsapp.dart';
import 'package:murny_final_project/widgets/arrow_back_circle_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactWithUs extends StatelessWidget {
  const ContactWithUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
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
                  image: 'assets/images/imageCall.svg',
                  funAlert: () {},
                ),
                const Divider(),
                CallPhoneWhatsapp(
                  text: AppLocalizations.of(context)!.contactUs,
                  image: 'assets/images/imageContactusWhatsapp.svg',
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
