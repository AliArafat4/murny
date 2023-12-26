import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/primary_button.dart';

class BalanceAddScreen extends StatelessWidget {
  const BalanceAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("إضافة رصيد")),
      body: Column(
        children: [
          const Divider(),
          SizedBox(height: MediaQuery.of(context).size.height / 32),
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
            child: const Align(
              alignment: Alignment.topRight,
              child: Text("إضافة رصيد"),
            ),
          ),
          //add text filed here
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),

          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          PrimaryButton(
            title: "تأكيد",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
