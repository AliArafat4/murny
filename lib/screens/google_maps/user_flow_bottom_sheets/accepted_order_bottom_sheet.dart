import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:murny_final_project/models/driver_model.dart';
import 'package:murny_final_project/models/order_model.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/cart_detil.dart';
import 'package:murny_final_project/widgets/custom_divider.dart';
import 'package:murny_final_project/widgets/driver_info.dart';
import 'package:murny_final_project/widgets/payment_method.dart';
import 'package:murny_final_project/widgets/trip_detil.dart';

class AcceptedOrderBottomSheet extends StatelessWidget {
  const AcceptedOrderBottomSheet({Key? key, required this.order})
      : super(key: key);

  final OrderModel order;

  //TODO: GET DRIVER BY ID FROM API // NOT IMPLEMENTED IN API //
  //TODO: GET CART BY ID // NOT IMPLEMENTED IN API //
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 22,
            ),
            Padding(
              padding: currentLanguage == "ar"
                  ? EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 20)
                  : EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 20),
              child: Text(
                AppLocalizations.of(context)!.glofCartOnWay,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 42,
            ),
            TripDetil(
              tripStartTime: order.tripStart ?? "now",
              destinationArrivalTime: order.tripEnd ?? "end",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 42,
            ),
            Row(
              children: [
                DriverInfo(driver: DriverModel()
                    // MurnyApi().common(
                    //     body: {},
                    //     function: Common.getDrivers,
                    //     token: order.driverId),
                    ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 62,
            ),
            const CustomDivider(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 82,
            ),
            BookLocation(
              locationFrom: order.locationFrom ?? "",
              locationTo: order.locationTo ?? "",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 82,
            ),
            const CustomDivider(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 140,
            ),
            CartDetil(
              numberOfCartSeat: order.cartId.toString(),
            ),
            const Divider(color: Color(0xffF4F4F4)),
            PaymentMethod(paymentMethod: order.paymentMethod ?? ""),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 140,
            // ),
            // const CustomDivider(),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height / 82,
            // ),
            // Center(
            //   child: PrimaryButton(
            //     title: AppLocalizations.of(context)!.cancel,
            //     onPressed: () {
            //       showConfirmDiolg(
            //           context: context,
            //           title: AppLocalizations.of(context)!.cancelOrderConfirm,
            //           acceptFun: () {
            //             Navigator.of(context).pushAndRemoveUntil(
            //                 MaterialPageRoute(
            //                     builder: (context) => SuccessScreen(
            //                           message: AppLocalizations.of(context)!
            //                               .cancelOrderSuccess,
            //                         )),
            //                 (Route route) => false);
            //           });
            //     },
            //     isPadding: true,
            //     isText: true,
            //     buttonColor: const Color(0xffF21D53),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
