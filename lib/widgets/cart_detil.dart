import 'package:flutter/material.dart';

class CartDetil extends StatelessWidget {
  const CartDetil({super.key, required this.numberOfCartSeat});
final String numberOfCartSeat;
  @override
  Widget build(BuildContext context) {
    return  Row(
                children: [
                  Image.asset(
                    "assets/images/golf_cart_icon_32.png",
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 22,
                  ),
                   Text(numberOfCartSeat)
                ],
              );
  }
}