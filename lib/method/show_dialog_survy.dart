import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/success/success.dart';
import 'package:murny_final_project/widgets/comment_text_filed.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/rating.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showSurvyDiolg({required BuildContext context}) {
  Locale myLocale = Localizations.localeOf(context);
  String currentLanguage = myLocale.languageCode;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      scrollable: true,
      elevation: 0,
      //backgroundColor: Colors.white,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 200),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                  )),
            ),
            Image.asset("assets/images/success_blue.png"),
            SizedBox(height: MediaQuery.of(context).size.height / 62),
            Text(
              AppLocalizations.of(context)!.reachedDestination,
              // onSecondary
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const Divider(),
            Text(
              AppLocalizations.of(context)!.experienceRating,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            Text(
              AppLocalizations.of(context)!.rateItNow,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const Rating(),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 20),
              child: Align(
                alignment: currentLanguage == "ar"
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Text(
                  AppLocalizations.of(context)!.comment,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
            CommentTextFiled(),
            Text(
              AppLocalizations.of(context)!.thankSurvy,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            PrimaryButton(
              title: AppLocalizations.of(context)!.send,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => SuccessScreen(
                        message: AppLocalizations.of(context)!.sendSurvySuccess,
                      ),
                    ),
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
  );
}
