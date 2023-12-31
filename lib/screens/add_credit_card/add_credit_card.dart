import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:murny_final_project/bloc/card_bloc/cubit/card_cubit.dart';
import 'package:murny_final_project/screens/google_maps_screen.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCreditCardScreen extends StatefulWidget {
  AddCreditCardScreen({super.key});

  @override
  State<AddCreditCardScreen> createState() => _AddCreditCardScreenState();
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void onCreditCardModel(CreditCardModel? creditCardModel) {
    setState(
      () {
        cardNumber = creditCardModel!.cardNumber;
        expiryDate = creditCardModel.expiryDate;
        cardHolderName = creditCardModel.cardHolderName;
        cvvCode = creditCardModel.cvvCode;
        isCvvFocused = creditCardModel.isCvvFocused;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: currentLanguage == "ar"
                    ? EdgeInsets.only(
                        right: MediaQuery.of(context).size.height / 42)
                    : EdgeInsets.only(
                        left: MediaQuery.of(context).size.height / 42),
                child: Align(
                    alignment: currentLanguage == "ar"
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Text(
                      AppLocalizations.of(context)!.creditCard,
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 400),
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                isHolderNameVisible: true,
                glassmorphismConfig: Glassmorphism(
                  blurX: 0,
                  blurY: 0,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(0.8, 1),
                    colors: [
                      Color(0xff0A397E),
                      Color(0xff703C6D),
                    ],
                  ),
                ),
                isSwipeGestureEnabled: true,
                onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          onCreditCardModelChange: onCreditCardModel),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 32,
                      ),
                      PrimaryButton(
                        title: AppLocalizations.of(context)!.pay,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => GoogleMapScreen()),
                                (Route route) => false);
                          }
                        },
                        isText: true,
                        isPadding: false,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
