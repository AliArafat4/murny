import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murny_final_project/screens/voice_search/voice_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextFieldSearch extends StatelessWidget {
  TextFieldSearch({
    super.key,
    required this.fun,
  });
  final Function fun;
  final TextEditingController conSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Padding(
      padding: EdgeInsets.only(top: 8.0.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => fun(),
                child: Container(
                  width: 8.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xffFFFFFF),
                  ),
                  child: Icon(
                    Icons.menu,
                    size: 18,
                  ),

                  /* SvgPicture.asset(
                    'assets/images/imageDrawer.svg',
                    colorFilter: const ColorFilter.mode(
                        Color(0xff000000), BlendMode.srcIn),
                  ),*/
                ),
              ),
              SizedBox(
                width: 1.5.w,
              ),
              SizedBox(
                height: 5.h,
                width: 84.w,
                child: TextField(
                  controller: conSearch,
                  decoration: InputDecoration(
                      hintText:
                          AppLocalizations.of(context)!.findYourDestination,
                      suffixIcon: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VoiceSearchScreen()),
                          );
                        },
                        color: const Color(0xff000000),
                        icon: const Icon(
                          Icons.keyboard_voice_outlined,
                          size: 24,
                        ),
                      ),
                      prefixIcon: SizedBox(
                        width: 12.w,
                        child: Padding(
                          padding: currentLanguage == "ar"
                              ? EdgeInsets.only(right: 14.sp)
                              : EdgeInsets.only(left: 14.sp),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/images/imageSearch.svg',
                                  colorFilter: const ColorFilter.mode(
                                      Color(0xff000000), BlendMode.srcIn),
                                  fit: BoxFit.none,
                                ),
                              ),
                              const VerticalDivider(
                                thickness: 1,
                                indent: 13,
                                endIndent: 13,
                                color: Color(0xffCDCED3),
                              ),
                            ],
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintStyle:
                          TextStyle(color: Color(0xff000000), height: 0.1.h),
                      filled: true,
                      fillColor: const Color(0xffFFFFFF)),
                ),
              ),
            ],
          ),
          Padding(
            padding: currentLanguage == "ar"
                ? EdgeInsets.only(right: 13.sp, top: 14.sp)
                : EdgeInsets.only(left: 13.sp, top: 14.sp),
            child: Align(
              alignment: currentLanguage == "ar"
                  ? Alignment.topRight
                  : Alignment.topLeft,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 9.w,
                  height: 4.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFFFFFF),
                  ),
                  child: SvgPicture.asset(
                    'assets/images/satellite.svg',
                    colorFilter: const ColorFilter.mode(
                        Color(0xff111111), BlendMode.srcIn),
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
