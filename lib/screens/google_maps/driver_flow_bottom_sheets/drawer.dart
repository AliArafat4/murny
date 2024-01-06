import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DriverDrawerMaps extends StatelessWidget {
  const DriverDrawerMaps({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  Widget build(BuildContext context) {
    bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Positioned(
        top: 35.sp,
        right: 15.sp,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              child: Container(
                  width: 8.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: isSwitched ? const Color(0xff393f44) : const Color(0xffFFFFFF),
                  ),
                  child: isSwitched
                      ? Image.asset(
                          'assets/images/menu.png',
                          color: Colors.white,
                        )
                      : Image.asset('assets/images/menu.png')

                  /* SvgPicture.asset(
                        'assets/images/imageDrawer.svg',
                        colorFilter: const ColorFilter.mode(
                            Color(0xff000000), BlendMode.srcIn),
                      ),*/
                  ),
            ),
            Padding(
              padding: currentLanguage == "ar"
                  ? EdgeInsets.only(right: 13.sp, top: 14.sp)
                  : EdgeInsets.only(left: 13.sp, top: 14.sp),
              child: Align(
                alignment: currentLanguage == "ar" ? Alignment.topRight : Alignment.topLeft,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 9.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSwitched ? const Color(0xff393f44) : const Color(0xffFFFFFF),
                    ),
                    child: isSwitched
                        ? SvgPicture.asset('assets/images/satellite.svg',
                            fit: BoxFit.none,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ))
                        : SvgPicture.asset(
                            'assets/images/satellite.svg',
                            fit: BoxFit.none,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
