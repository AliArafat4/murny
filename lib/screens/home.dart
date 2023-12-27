import 'package:flutter/material.dart';
import 'package:murny_final_project/method/show_accept_order_bottom_sheet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
