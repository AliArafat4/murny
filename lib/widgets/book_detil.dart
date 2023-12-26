import 'package:flutter/material.dart';

class BookDetil extends StatelessWidget {
  const BookDetil(
      {super.key, required this.price, required this.paymentMethod});
  final String price;
  final String paymentMethod;

  @override
  Widget build(BuildContext context) {
    String iconPath = "";
    switch (paymentMethod) {
      case "نقداً":
        iconPath = "assets/images/money_icon.png";
      case "البطاقة الائتمانية":
        iconPath = "assets/images/credit_card_icon.png";
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text(
              "التكلفة",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.width / 4,
            width: MediaQuery.of(context).size.width / 4),
        Column(
          children: [
            const Text(
              "طريقة الدفع",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            ),
            Row(
              children: [
                Text(
                  paymentMethod,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 32,
                ),
                Image.asset(iconPath),
              ],
            )
          ],
        )
      ],
    );
  }
}
