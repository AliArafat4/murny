import 'package:flutter/material.dart';
import 'package:murny_final_project/method/alert_snackbar.dart';
import 'package:murny_final_project/models/driver_model.dart';
import 'package:murny_final_project/screens/balance/payment_type.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/driver_info.dart';
import 'package:murny_final_project/widgets/golf_cart_detail.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showOrderBottomSheet({
  required BuildContext context,
  required String currentLocation,
  required String destination,
  // required String driverID,
  //   required int cartID,
  required DriverModel markerInfo,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          // color: Colors.white,
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
                BookLocation(
                  locationFrom: currentLocation,
                  locationTo: destination != ""
                      ? destination
                      : AppLocalizations.of(context)!.destination,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 42,
                ),
                DriverInfo(driver: markerInfo),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 62,
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
                      if (destination != "") {
                        Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (context) => PaymentTypeScreen(
                                  driverID: markerInfo.userId!,
                                  currentLocation: currentLocation,
                                  destination: destination,
                                  cartID: markerInfo.cartID!,
                                ),
                              ),
                            )
                            .then((value) => Navigator.pop(context));
                      } else {
                        Navigator.pop(context);
                        showErrorSnackBar(
                            context, "Please Select a destination");
                      }
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
