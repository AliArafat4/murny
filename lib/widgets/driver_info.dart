import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/driver_contact.dart';
import 'package:murny_final_project/widgets/driver_rate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo(
      {super.key, required this.driverImage, required this.driverName});
  final String driverImage;
  final String driverName;
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Row(children: [
      Stack(children: [
        Padding(
          padding: currentLanguage == "ar"
              ? EdgeInsets.only(right: MediaQuery.of(context).size.width / 20)
              : EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xff252C63), width: 2),
            ),
            child: Image.asset(
              driverImage,
              width: MediaQuery.of(context).size.width / 6,
            ),
          ),
        ),
        currentLanguage == "ar"
            ? Positioned(
                top: MediaQuery.of(context).size.height / 17,
                right: MediaQuery.of(context).size.width / 20,
                child: Container(
                  child: const DriverRate(rate: "5.0"),
                ),
              )
            : Positioned(
                top: MediaQuery.of(context).size.height / 17,
                left: MediaQuery.of(context).size.width / 20,
                child: Container(
                  child: const DriverRate(rate: "5.0"),
                ),
              ),
      ]),
      SizedBox(
        width: MediaQuery.of(context).size.width / 32,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(driverName),
          SizedBox(
            height: MediaQuery.of(context).size.height / 80,
          ),
          Row(
            children: [
              DriverContact(
                onTap: () {},
                icon: Icons.phone,
                contactType: AppLocalizations.of(context)!.call,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 32,
              ),
              DriverContact(
                onTap: () {},
                icon: Icons.chat,
                contactType: AppLocalizations.of(context)!.chat,
              )
            ],
          ),
        ],
      )
    ]);
  }
}
