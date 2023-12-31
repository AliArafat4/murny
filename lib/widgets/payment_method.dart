import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key, required this.paymentMethod});
  final String paymentMethod;
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    String iconPath = "";
    switch (paymentMethod) {
      case "نقداً":
        iconPath = "assets/images/money_icon.png";
      case "البطاقة الائتمانية":
        iconPath = "assets/images/credit_card_icon.png";
    }
    return Padding(
      padding: currentLanguage == "ar"
          ? EdgeInsets.only(right: MediaQuery.of(context).size.width / 20)
          : EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
      child: Row(
        children: [
          Image.asset(iconPath),
          SizedBox(
            width: MediaQuery.of(context).size.width / 22,
          ),
          Text(paymentMethod)
        ],
      ),
    );
  }
}
