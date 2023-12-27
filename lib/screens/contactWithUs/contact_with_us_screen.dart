import 'package:flutter/material.dart';
import 'package:murny_final_project/method/alert_dialog_account.dart';

import 'package:murny_final_project/screens/contactWithUs/component/call_phone_whatsapp.dart';
import 'package:murny_final_project/widgets/arrow_back_circle_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactWithUs extends StatelessWidget {
  const ContactWithUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(children: [
          ArrowBackCircleContainer(
            text: 'للتواصل معنا',
            textSpace: 37.sp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.sp),
            child: Column(
              children: [
                CallPhoneWhatsapp(
                  text: 'الإتصال بنا',
                  image: 'assets/images/imageCall.svg',
                  funAlert: () {
                    alertDialogAccount(
                      context: context,
                      title: 'اتصل بنا على رقمنا',
                      subtitle: '0565553090',
                      textButton1: 'اتصل',
                      textButton2: 'إلغاء',
                    );
                  },
                ),
                const Divider(),
                CallPhoneWhatsapp(
                  text: 'تواصل معنا',
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
