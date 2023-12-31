import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/location.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookLocation extends StatelessWidget {
  const BookLocation(
      {super.key, required this.locationFrom, required this.locationTo});
  final String locationFrom;
  final String locationTo;
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Padding(
      padding: currentLanguage == "ar"
          ? EdgeInsets.only(right: MediaQuery.of(context).size.width / 20)
          : EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffCDCED3).withOpacity(0.4),
            borderRadius: BorderRadius.circular(16)),
        width: MediaQuery.of(context).size.width - 32,
        height: MediaQuery.of(context).size.height / 8,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 42),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Location(
                  color: const Color(0xff252C63),
                  icon: Icons.my_location,
                  title: locationFrom),
              Padding(
                padding: currentLanguage == "ar"
                    ? EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 28)
                    : EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 28),
                child: Dash(
                    direction: Axis.vertical,
                    length: 1.9.h,
                    dashLength: .4.h,
                    dashThickness: .2.h,
                    dashColor: Colors.black),
              ),
              const Divider(
                indent: 42,
                height: 0,
                thickness: 3,
              ),
              Location(
                color: const Color(0xffF21D53),
                icon: Icons.location_on_outlined,
                title: locationTo,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
