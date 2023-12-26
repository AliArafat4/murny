import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeleteLogoutAccount extends StatelessWidget {
  const DeleteLogoutAccount(
      {super.key, required this.text, required this.image});
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 19.sp, top: 15.sp),
      child: Row(
        children: [
          SvgPicture.asset(
            image,
            colorFilter:
                const ColorFilter.mode(Color(0xff000000), BlendMode.srcIn),
          ),
          SizedBox(
            width: 2.w,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
