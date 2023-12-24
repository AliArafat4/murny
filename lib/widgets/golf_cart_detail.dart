import 'package:flutter/material.dart';

class GolfCartDetail extends StatelessWidget {
  const GolfCartDetail(
      {super.key,
      required this.numberOfSeat,
      required this.price,
      required this.onTap});
  final String numberOfSeat;
  final String price;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xff252C63), width: 4)),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset("assets/images/golf_cart_icon.png"),
                  Text(numberOfSeat),
                  Text(price)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
