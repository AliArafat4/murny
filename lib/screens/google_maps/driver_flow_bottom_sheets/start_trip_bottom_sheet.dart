import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:murny_final_project/method/show_confirm_dilog.dart';
import 'package:murny_final_project/models/order_model.dart';
import 'package:murny_final_project/screens/success/success.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/custom_divider.dart';
import 'package:murny_final_project/widgets/payment_method.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:murny_final_project/widgets/trip_detil.dart';
import 'package:murny_final_project/widgets/user_info.dart';

class StartTripBottomSheet extends StatelessWidget {
  const StartTripBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return const Column(
      children: [Text("Waiting For Order")],
    );
  }
}
