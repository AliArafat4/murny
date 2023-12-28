import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {super.key,
      this.title,
      required this.onPressed,
      this.image,
      this.text,
      this.textColor,
      this.buttonColor,
      required this.isText,
      required this.isPadding});
  final String? title;
  final String? text;
  final String? image;
  final Function() onPressed;
  final Color? textColor;
  final Color? buttonColor;
  final bool isText;
  bool isPadding = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: MediaQuery.of(context).size.height / 18,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff252C63)),
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            backgroundColor: buttonColor ?? const Color(0xff252C63),
            foregroundColor: Colors.white),
        onPressed: onPressed,
        child: isText
            ? Text(title ?? "",
                style: TextStyle(color: textColor ?? const Color(0xffFFFFFF)))
            : Padding(
                padding: isPadding
                    ? EdgeInsets.only(left: 20.sp)
                    : EdgeInsets.only(left: 0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(image!),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      text!,
                      style: const TextStyle(color: Color(0xff8E98A8)),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
