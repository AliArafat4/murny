import 'package:flutter/material.dart';
import 'package:murny_final_project/method/show_dialog_success_add_balanc.dart';
import 'package:murny_final_project/widgets/app_bar.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class BalanceAddScreen extends StatelessWidget {
  BalanceAddScreen({super.key});
  TextEditingController balanceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(
        AppLocalizations.of(context)!.addBalance,
      ),
      body: Column(
        children: [
          const Divider(),
          SizedBox(height: MediaQuery.of(context).size.height / 32),
          Padding(
            padding: currentLanguage == "ar"
                ? EdgeInsets.only(right: MediaQuery.of(context).size.width / 20)
                : EdgeInsets.only(left: MediaQuery.of(context).size.width / 20),
            child: Align(
              alignment: currentLanguage == "ar"
                  ? Alignment.topRight
                  : Alignment.topLeft,
              child: Text(
                AppLocalizations.of(context)!.addBalance,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 32),
            child: TextFieldWidget(
              text: AppLocalizations.of(context)!.enterBalance,
              typeKeyboard: TextInputType.number,
              scure: false,
              visiblePhone: false,
              controller: balanceController,
              isEditAccount: false,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.4),
          PrimaryButton(
            title: AppLocalizations.of(context)!.confirmation,
            onPressed: () {
              if (balanceController.text.isNotEmpty) {
                showSuccessAddBalanceDiolg(
                    context: context, balance: balanceController.text);
              }
            },
            isText: true,
            isPadding: false,
          )
        ],
      ),
    );
  }
}
