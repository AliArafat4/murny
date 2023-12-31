import 'package:flutter/material.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArrowBackCircleContainer extends StatelessWidget {
  ArrowBackCircleContainer(
      {super.key, required this.text, required this.textSpace});
  final String text;
  final double textSpace;

  bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Row(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
              width: 8.w,
              height: 10.h,
// <<<<<<< Arwa-Alzahrani
//               margin: EdgeInsets.only(right: 17.sp),
//               decoration: isSwitched
//                   ? const BoxDecoration(
//                       color: Color(0xffFFFFFF), shape: BoxShape.circle)
//                   : BoxDecoration(boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         blurRadius: 4,
//                         offset: const Offset(3, 2),
//                       ),
//                     ], color: const Color(0xffFFFFFF), shape: BoxShape.circle),
// =======
              margin: currentLanguage == "ar"
                  ? EdgeInsets.only(right: 17.sp)
                  : EdgeInsets.only(left: 17.sp),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(3, 2),
                ),
              ], color: const Color(0xffFFFFFF), shape: BoxShape.circle),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  size: 30,
                ),
              )),
        ),
        Padding(
          padding: currentLanguage == "ar"
              ? EdgeInsets.only(top: 20.sp, right: textSpace)
              : EdgeInsets.only(top: 20.sp, left: textSpace),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ],
    );
  }
}
