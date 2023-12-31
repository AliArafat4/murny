import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/balance/payment_type.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/golf_cart_detail.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showOrderBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 42,
                ),
                const BookLocation(
                  locationFrom: "موقعك الحالي",
                  locationTo: "الى أين تريد/ين الذهاب",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 42,
                ),
                Text(
                  AppLocalizations.of(context)!.selectGlofCart,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 62,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GolfCartDetail(
                      numberOfSeat: AppLocalizations.of(context)!.eightSseats,
                      price: AppLocalizations.of(context)!.from3SAR,
                      onTap: () {},
                    ),
                    GolfCartDetail(
                      numberOfSeat: AppLocalizations.of(context)!.sixSeats,
                      price: AppLocalizations.of(context)!.from5SAR,
                      onTap: () {},
                    ),
                    GolfCartDetail(
                      numberOfSeat: AppLocalizations.of(context)!.fourSeats,
                      price: AppLocalizations.of(context)!.from3SAR,
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 42,
                ),
                Center(
                  child: PrimaryButton(
                    isBorderBtn: false,
                    isText: true,
                    isPadding: true,
                    title: AppLocalizations.of(context)!.pay,
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => PaymentTypeScreen(),
                          ),
                          (Route route) => false);
                    },
                    buttonColor: const Color(0xff252C63),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
