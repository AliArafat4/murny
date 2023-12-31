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
    required this.isEditAccount,
  });
  final String? text;
  final TextInputType typeKeyboard;
  final bool scure;
  final bool visiblePhone;
  final TextEditingController controller;
  final bool isEditAccount;
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;

    isEditAccount ? controller.text = text! : null;
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
                      padding: currentLanguage == "ar"
                          ? EdgeInsets.only(right: 15.sp)
                          : EdgeInsets.only(left: 15.sp),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              currentLanguage == "ar" ? '966+' : '+966',
                              // style: TextStyle(color: Color(0xff000000)),
                            ),
                          ),
                          const VerticalDivider(
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
            borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
            borderRadius: BorderRadius.circular(8)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColorDark),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
