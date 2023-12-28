import 'package:flutter/material.dart';
import 'package:murny_final_project/method/show_accept_order_bottom_sheet.dart';
import 'package:murny_final_project/method/show_new_order_bottom_sheet.dart';

class Home extends StatelessWidget {
  const Home({super.key});
//delete this screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showNewOrderBottomSheet(context: context);
              },
              child: Text("test"),
            ),
          )
        ],
      ),
    ));
  }
}
