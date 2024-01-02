import 'package:flutter/material.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:murny_final_project/method/show_confirm_dilog.dart';
import 'package:murny_final_project/method/show_order_bottom_sheet.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/cart_detil.dart';
import 'package:murny_final_project/widgets/payment_method.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showSearchCartBottomSheet({required BuildContext context}) {
  bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

  Locale myLocale = Localizations.localeOf(context);
  String currentLanguage = myLocale.languageCode;
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: const BoxDecoration(
          //color: Colors.white,
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
                  style: TextStyle(fontSize: 16),
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
              const BookLocation(
                locationFrom: "كلية الصيدلة A2",
                locationTo: "كلية علوم الحاسب والمعلومات A3",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              Divider(
                thickness: 8,
                color: isSwitched
                    ? Color(0xffCDCED3)
                    : Color(0xffCDCED3).withOpacity(0.4),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 120,
              ),
              // CartDetail(
              //   numberOfCartSeat: "عربة جولف 4 مقاعد",
              // ),
              const Divider(
                color: Color(0xffF4F4F4),
              ),
              PaymentMethod(paymentMethod: "نقداً"),
              SizedBox(
                height: MediaQuery.of(context).size.height / 120,
              ),
              Divider(
                  thickness: 8,
                  color: isSwitched
                      ? Color(0xffCDCED3)
                      : Color(0xffCDCED3).withOpacity(0.4)),
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
    },
  );
}
