import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({super.key, required this.fun});
  final Function()? fun;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => fun,
                child: Container(
                  width: 8.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xffFFFFFF)),
                  child: SvgPicture.asset(
                    'assets/images/imageDrawer.svg',
                    colorFilter: const ColorFilter.mode(
                        Color(0xff000000), BlendMode.srcIn),
                  ),
                ),
              ),
              SizedBox(
                width: 1.5.w,
              ),
              SizedBox(
                height: 5.h,
                width: 84.w,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {},
                        color: const Color(0xff000000),
                        icon: const Icon(
                          Icons.keyboard_voice_outlined,
                          size: 24,
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 15.sp),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/images/imageSearch.svg',
                                colorFilter: const ColorFilter.mode(
                                    Color(0xff000000), BlendMode.srcIn),
                                fit: BoxFit.none,
                              ),
                            ),
                            const VerticalDivider(
                              thickness: 1,
                              indent: 13,
                              endIndent: 13,
                              color: Color(0xffCDCED3),
                            ),
                            const Text(
                              'ابحث عن وجهتك',
                              style: TextStyle(
                                  color: Color(0xff000000), fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      hintStyle: const TextStyle(color: Color(0xff000000)),
                      filled: true,
                      fillColor: const Color(0xffFFFFFF)),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(right: 13.sp, top: 14.sp),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 9.w,
                  height: 4.h,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffFFFFFF)),
                  child: SvgPicture.asset(
                    'assets/images/satellite.svg',
                    colorFilter: const ColorFilter.mode(
                        Color(0xff111111), BlendMode.srcIn),
                    fit: BoxFit.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
