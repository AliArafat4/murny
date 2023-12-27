import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_rounded,
          size: 30,
        ),
      ),
    );
  }
}
