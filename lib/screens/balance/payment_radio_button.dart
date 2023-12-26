import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/balance/payment_type.dart';

class PaymentRadioButton extends StatelessWidget {
  const PaymentRadioButton(
      {super.key,
      required this.value,
      required this.selectedValue,
      required this.onChange,
      required this.paymentMethod,
      required this.imagePath});
  final String paymentMethod;
  final Payment value;
  final Payment selectedValue;
  final Function(Payment?)? onChange;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 42),
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        height: MediaQuery.of(context).size.height / 12,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff252C63).withOpacity(0.4)),
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffCDCED3).withOpacity(0.4),
        ),
        child: Center(
          child: ListTile(
            title: Text(paymentMethod),
            leading: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffCDCED3), width: 4),
                  color: const Color(0xff252C63),
                  borderRadius: BorderRadiusDirectional.circular(90)),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height / 1,
              child: Image.asset(imagePath),
            ),
            trailing: Radio(
                value: value, groupValue: selectedValue, onChanged: onChange),
          ),
        ),
      ),
    );
  }
}
