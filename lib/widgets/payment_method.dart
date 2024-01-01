import 'package:flutter/material.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({super.key, required this.paymentMethod});
  final String paymentMethod;
  bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    String iconPath = "";
    switch (paymentMethod) {
      case "cash":
        iconPath = "assets/images/money_icon.png";
      case "credit card":
        iconPath = "assets/images/credit_card_icon.png";
    }
    return Padding(
      padding: currentLanguage == "ar"
          ? EdgeInsets.only(right: MediaQuery.of(context).size.width / 20)
          : EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
      child: Row(
        children: [
          isSwitched
              ? Image.asset(
                  iconPath,
                  color: Colors.white,
                )
              : Image.asset(iconPath),
          SizedBox(
            width: MediaQuery.of(context).size.width / 22,
          ),
          Text(paymentMethod)
        ],
      ),
    );
  }
}
