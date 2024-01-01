import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
          width: 9.w,
          height: 4.h,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20.sp,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width / 42),
        Text(
          title,
          //change color text
          style: TextStyle(fontSize: 18.sp),
        )
      ],
    );
  }
}
