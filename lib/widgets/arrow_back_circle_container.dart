import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArrowBackCircleContainer extends StatelessWidget {
  const ArrowBackCircleContainer({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
              width: 8.w,
              height: 10.h,
              margin: EdgeInsets.only(right: 17.sp),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 4,
                  offset: const Offset(3, 2),
                ),
              ], color: const Color(0xffFFFFFF), shape: BoxShape.circle),
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 30,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.sp, right: 37.sp),
          child: Text(
            text,
            style: TextStyle(fontSize: 28),
          ),
        ),
      ],
    );
  }
}
