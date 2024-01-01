import 'package:flutter/material.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/method/show_confirm_dilog.dart';
import 'package:murny_final_project/models/order_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/cart_detil.dart';
import 'package:murny_final_project/widgets/payment_method.dart';
import 'package:murny_final_project/widgets/primary_button.dart';

class UserWaitingBottomSheet extends StatelessWidget {
  const UserWaitingBottomSheet({Key? key, required this.order})
      : super(key: key);
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    final Locale myLocale = Localizations.localeOf(context);
    final String currentLanguage = myLocale.languageCode;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 42,
            ),
            Padding(
              padding: currentLanguage == "ar"
                  ? EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 20)
                  : EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 20),
              child: Text(
                AppLocalizations.of(context)!.searchGolfCart,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 82,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 10,
                  left: MediaQuery.of(context).size.width / 10),
              child: LinearProgressIndicator(
                backgroundColor: const Color(0xffCDCED3),
                color: const Color(0xff252C63),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 42,
            ),
            BookLocation(
              locationFrom: order.locationFrom ?? "",
              locationTo: order.locationTo ?? "",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 42,
            ),
            const Divider(
              thickness: 8,
              color: Color(0xffF4F4F4),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 120,
            ),
            CartDetil(
              numberOfCartSeat: order.cartId.toString(),
            ),
            const Divider(
              color: Color(0xffF4F4F4),
            ),
            PaymentMethod(paymentMethod: order.paymentMethod ?? ""),
            SizedBox(
              height: MediaQuery.of(context).size.height / 120,
            ),
            const Divider(
              thickness: 8,
              color: Color(0xffF4F4F4),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 82,
            ),
            Center(
                child: PrimaryButton(
              isBorderBtn: false,
              isText: true,
              isPadding: true,
              title: AppLocalizations.of(context)!.cancelOrder,
              onPressed: () {
                showConfirmDiolg(
                    context: context,
                    title: AppLocalizations.of(context)!.cancelOrderConfirm,
                    acceptFun: () {
                      //TODO: MAKE ABLE TO CANCEL
                      Navigator.pop(context);
                      // showOrderBottomSheet(context: context);
                    });
              },
              buttonColor: const Color(0xffF21D53),
            ))
          ],
        ),
      ),
    );
  }
}
