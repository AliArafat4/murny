import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/balance/payment_radio_button.dart';
import 'package:murny_final_project/widgets/primary_button.dart';

class PaymentTypeScreen extends StatefulWidget {
  const PaymentTypeScreen({super.key});

  @override
  State<PaymentTypeScreen> createState() => _PaymentTypeScreenState();
}

enum Payment { visa, wallet, applePay, cash }

class _PaymentTypeScreenState extends State<PaymentTypeScreen> {
  Payment selectedValue = Payment.cash;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width / 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "الدفع",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "اختر طريقة الدفع المناسبة لك",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              PaymentRadioButton(
                value: Payment.visa,
                selectedValue: selectedValue,
                onChange: (value) {
                  setState(() {});
                  selectedValue = value!;
                },
                paymentMethod: "البطاقة الإئتمانية",
                imagePath: "assets/images/visa_icon.png",
              ),
              PaymentRadioButton(
                value: Payment.wallet,
                selectedValue: selectedValue,
                onChange: (value) {
                  setState(() {});
                  selectedValue = value!;
                },
                paymentMethod: "المحفظة",
                imagePath: "assets/images/wallet_icon.png",
              ),
              PaymentRadioButton(
                value: Payment.cash,
                selectedValue: selectedValue,
                onChange: (value) {
                  setState(() {});
                  selectedValue = value!;
                },
                paymentMethod: "نقداً",
                imagePath: "assets/images/cash_icon.png",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              PrimaryButton(
                title: "تأكيد الطلب",
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
