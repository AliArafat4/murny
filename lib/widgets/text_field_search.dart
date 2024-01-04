import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murny_final_project/bloc/order_state_bloc/order_state_cubit.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:murny_final_project/method/show_dialog_survy.dart';
import 'package:murny_final_project/method/show_order_bottom_sheet.dart';
import 'package:murny_final_project/method/show_search_cart_bottom_sheet.dart';
import 'package:murny_final_project/method/show_success_trip_bottom_sheet.dart';
import 'package:murny_final_project/method/show_wating_trip_bottom_sheet.dart';
import 'package:murny_final_project/screens/home/home_screen.dart';
import 'package:murny_final_project/screens/voice_search/search.dart';
import 'package:murny_final_project/screens/voice_search/voice_search.dart';
import 'package:murny_final_project/widgets/golf_cart_detail.dart';
import 'package:murny_final_project/widgets/rating.dart';
import 'package:murny_final_project/widgets/segment_control.dart';
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
    bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

    return Padding(
      padding: EdgeInsets.only(top: 8.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: isSwitched
                          ? const Color(0xff393f44)
                          : const Color(0xffFFFFFF),
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
              SizedBox(width: 1.5.w),
              SizedBox(
                height: 5.h,
                width: 84.w,
                child: BlocBuilder<OrderStateCubit, OrderStateState>(
                  builder: (context, state) {
                    return state is OrderFilterState ||
                            state is OrderStateInitial
                        ? InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => SearchScreen()),
                              );
                            },
                            child: TextField(
                              enabled: false,
                              controller: conSearch,
                              decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!
                                      .findYourDestination,
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VoiceSearchScreen()),
                                      );
                                    },
                                    color: isSwitched
                                        ? Colors.white
                                        : const Color(0xff000000),
                                    icon: const Icon(
                                      Icons.keyboard_voice_outlined,
                                      size: 24,
                                    ),
                                  ),
                                  prefixIcon: SizedBox(
                                    width: 12.w,
                                    child: Padding(
                                      padding: currentLanguage == "ar"
                                          ? EdgeInsets.only(right: 11.sp)
                                          : EdgeInsets.only(left: 14.sp),
                                      child: Row(
                                        children: [
                                          InkWell(
                                              onTap: () {},
                                              child: isSwitched
                                                  ? Icon(
                                                      Icons.search,
                                                      color: Colors.white,
                                                    )
                                                  : Icon(Icons.search)),
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
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                  filled: true,
                                  fillColor: isSwitched
                                      ? const Color(0xff393f44)
                                      : const Color(0xffFFFFFF)),
                            ),
                          )
                        : const SizedBox();
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: currentLanguage == "ar"
                ? EdgeInsets.only(top: 14.sp)
                : EdgeInsets.only(top: 14.sp),
            child: Align(
              alignment: currentLanguage == "ar"
                  ? Alignment.topRight
                  : Alignment.topLeft,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 9.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSwitched
                        ? const Color(0xff393f44)
                        : const Color(0xffFFFFFF),
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
      ),
    );
  }
}
