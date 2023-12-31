import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murny_final_project/screens/editAccount/edit_account_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContentDrawer extends StatelessWidget {
  ContentDrawer(
      {super.key,
      required this.imageSvg,
      required this.text,
      required this.spaceTop,
      this.naviPush});
  final String imageSvg;
  final String text;
  final double spaceTop;
  final Function? naviPush;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.sp, top: spaceTop),
      child: InkWell(
        onTap: () => naviPush!(),
        child: Row(
          children: [
            SvgPicture.asset(imageSvg),
            SizedBox(
              width: 2.w,
            ),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
