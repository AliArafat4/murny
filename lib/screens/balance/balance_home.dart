import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/balance/balance_add.dart';
import 'package:murny_final_project/widgets/app_bar.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeBalanceScreen extends StatelessWidget {
  const HomeBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        AppLocalizations.of(context)!.wallet,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(),
            SizedBox(height: MediaQuery.of(context).size.height / 22),
            Stack(
              children: [
                Container(
                  child: Image.asset("assets/images/balance_card.png"),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 22,
                  right: MediaQuery.of(context).size.width / 22,
                  child: Container(
                    child: Image.asset("assets/images/balanc_icon.png"),
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            PrimaryButton(
                title: AppLocalizations.of(context)!.addBalance,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BalanceAddScreen()),
                  );
                },
                isText: true,
                isPadding: true),
          ],
        ),
      ),
    );
  }
}
