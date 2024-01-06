import 'package:flutter/material.dart';
import 'package:murny_final_project/method/show_main_bottom_sheet.dart';
import 'package:murny_final_project/widgets/book_detil.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showSuccessfulTripBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          //  color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 42,
                ),
                Image.asset(
                  "assets/images/success_icon.png",
                  width: MediaQuery.of(context).size.width / 5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 90,
                ),
                Text(
                  AppLocalizations.of(context)!.successTrip,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const BookLocation(
                  locationFrom: "A2 كلية الصيدلة",
                  locationTo: "A3 كلية علوم الحاسب والمعلومات",
                ),
                const BookDetil(
                  price: "10SAR",
                  paymentMethod: "البطاقة الائتمانية",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 200,
                ),
                PrimaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showMainBottomSheet(context: context);
                  },
                  title: AppLocalizations.of(context)!.endTrip,
                  buttonColor: const Color(0xff252C63),
                  isText: true,
                  isPadding: true,
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
