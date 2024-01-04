import 'package:flutter/material.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/models/driver_model.dart';
import 'package:murny_final_project/screens/chat/chat_screen.dart';
import 'package:murny_final_project/widgets/driver_contact.dart';
import 'package:murny_final_project/widgets/driver_rate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo({super.key, required this.driver, required this.user});
  final DriverModel driver;
  final AuthModel user;
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
            child: driver.image != null
                ? Image.asset(
                    driver.image!,
                    width: MediaQuery.of(context).size.width / 6,
                  )
                : Image.network(
                    "https://t4.ftcdn.net/jpg/02/29/75/83/360_F_229758328_7x8jwCwjtBMmC6rgFzLFhZoEpLobB6L8.jpg",
                    width: MediaQuery.of(context).size.width / 6,
                    fit: BoxFit.contain,
                  ),
          ),
        ),
        currentLanguage == "ar"
            ? Positioned(
                top: MediaQuery.of(context).size.height / 17,
                right: MediaQuery.of(context).size.width / 20,
                child: const DriverRate(rate: "5.0"),
              )
            : Positioned(
                top: MediaQuery.of(context).size.height / 17,
                left: MediaQuery.of(context).size.width / 20,
                child: const DriverRate(rate: "5.0"),
              ),
      ]),
      SizedBox(
        width: MediaQuery.of(context).size.width / 32,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(driver.name ?? ""),
          SizedBox(
            height: MediaQuery.of(context).size.height / 80,
          ),
          Row(
            children: [
              DriverContact(
                onTap: () async {
                  Uri phoneNo = Uri.parse('tel:${driver.phone}');
                  if (await launchUrl(phoneNo)) {
                    //dialer opened
                    print("good");
                  } else {
                    print("err");
                  }
                },
                icon: Icons.phone,
                contactType: AppLocalizations.of(context)!.call,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 32,
              ),
              DriverContact(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen(chatWith: driver, user: user,)));
                },
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
