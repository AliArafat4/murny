import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/method/alert_snackbar.dart';
import 'package:murny_final_project/method/show_confirm_dilog.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/models/order_model.dart';
import 'package:murny_final_project/models/profile_model.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:murny_final_project/widgets/user_info.dart';

class AcceptDenyOrderBottomSheet extends StatelessWidget {
  const AcceptDenyOrderBottomSheet(
      {Key? key, required this.order, required this.user, required this.orderFrom})
      : super(key: key);

  final OrderModel order;
  final AuthModel user;
  final ProfileModel orderFrom;
  @override
  Widget build(BuildContext context) {
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
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w400, color: Color(0xff252C63)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              //TODO: FIX USER INFO
              UserInfo(
                userName: orderFrom.name ?? "",
                userPhone: orderFrom.phone ?? "",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 32,
              ),
              BookLocation(
                locationFrom: order.locationFrom ?? "",
                locationTo: order.locationTo ?? "",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SecondButton(
                    onPressed: () async {
                      await MurnyApi().driver(body: {
                        "order_from_id": order.orderFromId,
                        "id": order.id,
                        "cart_id": order.cartId,
                        "order_state": "accepted"
                      }, function: Driver.responseToOrder, token: user.token ?? "");

                      if (context.mounted) {
                        showSuccessSnackBar(context, "Order Accepted Successfully");
                      }
                      // showOrderBottomSheet(context: context);
                    },
                    title: AppLocalizations.of(context)!.accept,
                    color: const Color(0xff252C63),
                  ),
                  SecondButton(
                    onPressed: () {
                      showConfirmDiolg(
                          context: context,
                          title: AppLocalizations.of(context)!.cancelOrderConfirm,
                          acceptFun: () async {
                            await MurnyApi().driver(body: {
                              "order_from_id": order.orderFromId,
                              "id": order.id,
                              "cart_id": order.cartId,
                              "order_state": "canceled"
                            }, function: Driver.responseToOrder, token: user.token ?? "");

                            if (context.mounted) {
                              showSuccessSnackBar(context, "Order Canceled Successfully");
                              Navigator.pop(context);
                            }
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
  }
}
