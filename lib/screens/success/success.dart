import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/screens/success/success_message.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            Image.asset("assets/images/success_blue.png"),
            SizedBox(height: MediaQuery.of(context).size.height / 32),
            SuccessMessage(
              message: message,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            PrimaryButton(
              onPressed: () {},
              title: "الرجوع الى الصفحة الرئيسية",
            )
          ],
        ),
      ),
    );
  }
}
