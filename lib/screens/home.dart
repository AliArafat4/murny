import 'package:flutter/material.dart';
import 'package:murny_final_project/bottom_sheet/accept_order_bottom_sheet.dart';
import 'package:murny_final_project/method/show_accept_order_bottom_sheet.dart';
import 'package:murny_final_project/method/show_accepted_order_dilog.dart';
import 'package:murny_final_project/method/show_confirm_dilog.dart';
import 'package:murny_final_project/method/show_main_bottom_sheet.dart';
import 'package:murny_final_project/method/show_new_order_bottom_sheet.dart';
import 'package:murny_final_project/method/show_order_bottom_sheet.dart';
import 'package:murny_final_project/method/show_search_cart_bottom_sheet.dart';
import 'package:murny_final_project/method/show_success_trip_bottom_sheet.dart';
import 'package:murny_final_project/method/show_wating_trip_bottom_sheet.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showAcceptOrderBottomSheet(context: context);
              },
              child: Text("test"),
            ),
          )
        ],
      ),
    ));
  }
}
