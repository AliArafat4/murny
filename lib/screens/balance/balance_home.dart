import 'package:flutter/material.dart';
import 'package:murny_final_project/method/show_dialog_success_add_balanc.dart';

import 'package:murny_final_project/widgets/arrow_back_circle_container.dart';

import 'package:murny_final_project/screens/balance/balance_add.dart';

import 'package:murny_final_project/widgets/second_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeBalanceScreen extends StatelessWidget {
  const HomeBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: const Text("المحفظة")),
        body: SafeArea(
      child: Column(
        children: [
          ArrowBackCircleContainer(
            text: 'المحفظة',
            textSpace: 42.sp,
          ),
          const Divider(),
          SizedBox(height: MediaQuery.of(context).size.height / 22),
          Stack(children: [
            Container(child: Image.asset("assets/images/balance_card.png")),
            Positioned(
              top: MediaQuery.of(context).size.height / 22,
              right: MediaQuery.of(context).size.width / 22,
              child: Container(
                child: Image.asset("assets/images/balanc_icon.png"),
              ),
            )
          ]),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          SecondButton(
              title: "إضافة رصيد",
              onPressed: () {
                showSuccessAddBalanceDiolg(context: context, balance: "50SAR");
              },
              color: const Color(0xff252C63))
        ],
      ),
    ));

  }
}
