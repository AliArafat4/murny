import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({
    super.key,
    this.text,
    required this.typeKeyboard,
    this.scure = false,
    this.visiblePhone = false,
    required this.controller,
  });
  final String? text;
  final TextInputType typeKeyboard;
  final bool scure;
  final bool visiblePhone;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: scure ? true : false,
      keyboardType: typeKeyboard,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: visiblePhone
            ? Padding(
                padding: EdgeInsets.only(right: 2.sp),
                child: SizedBox(
                  width: 17.w,
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15.sp),
                      child: const Row(
                        children: [
                          Flexible(
                            child: Text(
                              '966+',
                              // style: TextStyle(color: Color(0xff000000)),
                            ),
                          ),
                          VerticalDivider(
                            thickness: 1,
                            indent: 3,
                            endIndent: 3,
                            color: Color(0xffCDCED3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            : null,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff252C63)),
            borderRadius: BorderRadius.circular(8)),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff252C63)),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff252C63)),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
