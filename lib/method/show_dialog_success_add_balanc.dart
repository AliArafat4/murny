import 'package:flutter/material.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:murny_final_project/screens/balance/balance_home.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showSuccessAddBalanceDiolg(
    {required BuildContext context, required String balance}) {
  bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 0,
      backgroundColor: isSwitched ? null : Colors.white,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 200),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close)),
              ),
              Image.asset("assets/images/success_blue.png"),
              SizedBox(height: MediaQuery.of(context).size.height / 62),
              Text(
                AppLocalizations.of(context)!.addBalanceSucc,
                style: TextStyle(fontSize: 22),
              ),
              Text(
                AppLocalizations.of(context)!.addBalanceSuccdescription,
                style: TextStyle(color: Color(0xff898989), fontSize: 12),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 62),
              Text(
                AppLocalizations.of(context)!.amount,
                style: TextStyle(color: Color(0xff5A5A5A)),
              ),
              Text(
                balance,
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 32),
              PrimaryButton(
                title: AppLocalizations.of(context)!.back,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => HomeBalanceScreen()),
                      (Route route) => false);
                },
                buttonColor: const Color(0xff252C63),
                isPadding: true,
                isText: true,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
