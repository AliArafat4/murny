import 'package:flutter/material.dart';
import 'package:murny_final_project/method/show_confirm_dilog.dart';
import 'package:murny_final_project/method/show_order_bottom_sheet.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:murny_final_project/widgets/user_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showNewOrderBottomSheet({required BuildContext context}) {
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
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 42,
                ),
                Text(
                  AppLocalizations.of(context)!.newOrder,
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w400, color: Color(0xff252C63)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const UserInfo(
                  userName: "عبدالله احمد",
                  userPhone: "0543874565",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 32,
                ),
                const BookLocation(
                  locationFrom: "A2 كلية الصيدلة",
                  locationTo: "A3 كلية علوم الحاسب والمعلومات",
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SecondButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      title: AppLocalizations.of(context)!.accept,
                      color: const Color(0xff252C63),
                    ),
                    SecondButton(
                      onPressed: () {
                        showConfirmDiolg(
                            context: context,
                            title: AppLocalizations.of(context)!
                                .cancelOrderConfirm,
                            acceptFun: () {
                              Navigator.pop(context);
                              // showOrderBottomSheet(context: context);
                            });
                      },
                      title: AppLocalizations.of(context)!.reject,
                      color: const Color(0xffD7053A),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
