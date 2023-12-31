import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/balance/payment_radio_button.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentTypeScreen extends StatefulWidget {
  const PaymentTypeScreen({super.key});

  @override
  State<PaymentTypeScreen> createState() => _PaymentTypeScreenState();
}

enum Payment { visa, wallet, applePay, cash }

class _PaymentTypeScreenState extends State<PaymentTypeScreen> {
  Payment selectedValue = Payment.cash;
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width / 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Align(
                alignment: currentLanguage == "ar"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context)!.payment,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Align(
                alignment: currentLanguage == "ar"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context)!.selectPaymentMethod,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              PaymentRadioButton(
                value: Payment.visa,
                selectedValue: selectedValue,
                onChange: (value) {
                  setState(() {});
                  selectedValue = value!;
                },
                paymentMethod: AppLocalizations.of(context)!.creditCard,
                imagePath: "assets/images/visa_icon.png",
              ),
              PaymentRadioButton(
                value: Payment.wallet,
                selectedValue: selectedValue,
                onChange: (value) {
                  setState(() {});
                  selectedValue = value!;
                },
                paymentMethod: AppLocalizations.of(context)!.wallet,
                imagePath: "assets/images/wallet_icon.png",
              ),
              PaymentRadioButton(
                value: Payment.cash,
                selectedValue: selectedValue,
                onChange: (value) {
                  setState(() {});
                  selectedValue = value!;
                },
                paymentMethod: AppLocalizations.of(context)!.cash,
                imagePath: "assets/images/cash_icon.png",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              PrimaryButton(
                title: AppLocalizations.of(context)!.confirmation,
                onPressed: () {},
                isText: true,
                isPadding: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
