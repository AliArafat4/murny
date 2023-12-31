import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CallPhoneWhatsapp extends StatelessWidget {
  const CallPhoneWhatsapp(
      {super.key,
      required this.image,
      required this.text,
      required this.funAlert});
  final String image;
  final String text;
  final Function() funAlert;
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Padding(
      padding: currentLanguage == "ar"
          ? EdgeInsets.only(right: 15.sp)
          : EdgeInsets.only(left: 15.sp),
      child: InkWell(
        onTap: () => funAlert,
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              matchTextDirection: true,
              colorFilter:
                  const ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
              fit: BoxFit.none,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              text,
              style: const TextStyle(color: Color(0xff000000), fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
