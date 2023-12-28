import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpSideSigninSignup extends StatelessWidget {
  const UpSideSigninSignup(
      {super.key, required this.visibleImage, required this.onTap});
  final bool visibleImage;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: onTap,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                    Text(
                      AppLocalizations.of(context)!.back,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: visibleImage,
          child: Padding(
            padding: EdgeInsets.only(
              right: 63.sp,
            ),
            child: Image.asset(
              'assets/images/carMurny.png',
              alignment: Alignment.topRight,
              // colorFilter:
              //     const ColorFilter.mode(Colors.red, BlendMode.srcIn),
              width: 40.w,
            ),
          ),
        ),
      ],
    );
  }
}
