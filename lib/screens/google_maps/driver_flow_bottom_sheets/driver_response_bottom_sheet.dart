import 'package:flutter/material.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/models/order_model.dart';
import 'package:murny_final_project/models/profile_model.dart';
import 'package:murny_final_project/screens/google_maps/driver_flow_bottom_sheets/driver_chat_screen.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/user_info.dart';

class DriverResponseBottomSheet extends StatelessWidget {
  const DriverResponseBottomSheet(
      {Key? key, required this.order, required this.orderFrom, required this.user})
      : super(key: key);

  final OrderModel order;
  final ProfileModel orderFrom;
  final AuthModel user;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.4,
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
              // Text(
              //   "${AppLocalizations.of(context)!.watingTime} 10 دقائق",
              //   style: const TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w400,
              //       color: Color(0xff252C63)),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.width / 20,
              // ),
              BookLocation(
                locationFrom: order.locationFrom ?? "",
                locationTo: order.locationTo ?? "",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserInfo(userName: orderFrom.name ?? "", userPhone: orderFrom.phone ?? ""),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DriverChatScreen(chatWith: orderFrom, user: user),
                            ));
                      },
                      icon: const Icon(Icons.chat, color: Color(0xff252C63)))
                ],
              ),

              // PrimaryButton(
              //   onPressed: () {
              //     // Navigator.pop(context);
              //   },
              //   title: AppLocalizations.of(context)!.startTrip,
              //   buttonColor: const Color(0xff252C63),
              //   isText: true,
              //   isPadding: true,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
