import 'package:flutter/material.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';

class CartDetil extends StatelessWidget {
  CartDetil({super.key, required this.numberOfCartSeat});
  final String numberOfCartSeat;
  bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Padding(
      padding: currentLanguage == "ar"
          ? EdgeInsets.only(right: MediaQuery.of(context).size.width / 20)
          : EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
      child: Row(
        children: [
          isSwitched
              ? Image.asset(
                  "assets/images/golf_cart_icon_32.png",
                  color: Colors.white,
                )
              : Image.asset(
                  "assets/images/golf_cart_icon_32.png",
                ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 22,
          ),
          Text(numberOfCartSeat)
        ],
      ),
    );
  }
}
