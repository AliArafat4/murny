import 'package:flutter/material.dart';
import 'package:murny_final_project/method/show_dialog_success_add_balanc.dart';
import 'package:murny_final_project/widgets/app_bar.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/text_field.dart';

// ignore: must_be_immutable
class BalanceAddScreen extends StatelessWidget {
  BalanceAddScreen({super.key});
  TextEditingController balanceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: customAppBar("اضافة رصيد"),
      body: Column(
        children: [
          const Divider(),
          SizedBox(height: MediaQuery.of(context).size.height / 32),
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
            child: const Align(
              alignment: Alignment.topRight,
              child: Text("اضافة رصيد"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width / 32),
            child: TextFieldWidget(
              text: 'ادخل المبلغ',
              typeKeyboard: TextInputType.number,
              scure: false,
              visiblePhone: false,
              controller: balanceController,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.4),
          PrimaryButton(
            title: "تأكيد",
            onPressed: () {
              if (balanceController.text.isNotEmpty) {
                showSuccessAddBalanceDiolg(
                    context: context, balance: balanceController.text);
              }
            },
          )
        ],
      ),
    );
  }
}
