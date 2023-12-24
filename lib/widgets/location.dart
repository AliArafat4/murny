import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location(
      {super.key,
      required this.color,
      required this.icon,
      required this.title});
  final Color color;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 42,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
