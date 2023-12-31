import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:murny_final_project/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//delete this screen
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.fullName,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.fullName,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
