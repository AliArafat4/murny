import 'package:flutter/material.dart';

class DriverRate extends StatelessWidget {
  const DriverRate({super.key, required this.rate});
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 6,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Color(0xff252C63), width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_rounded,
            color: Color(0xffFFC212),
          ),
          Text(rate),
        ],
      ),
    );
  }
}
