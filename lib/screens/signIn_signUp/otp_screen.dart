import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/account_text.dart';
import 'package:murny_final_project/widgets/up_side_signin_siginup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController conOtp = TextEditingController();

  bool isVisible = false;

  updateButtonVisibility() {
    bool isFilled = conOtp.text.length == 5;

    setState(() {
      isVisible = isFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Padding(
          padding: EdgeInsets.only(
            top: 20.sp,
          ),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(right: 20.sp),
              child: const UpSideSigninSignup(
                visibleImage: false,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Column(
              children: [
                Visibility(
                  child: isVisible
                      ? const Text(
                          'رمز تحقق الجوال',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        )
                      : const Text(
                          'تم إرسال رمز التحقق على جوالك',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                const Text('أدخل رمز OTP الخاص بك',
                    style: TextStyle(color: Color(0xff8E98A8), fontSize: 16),
                    textDirection: TextDirection.rtl),
              ],
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 77.w,
              height: 5.5.h,
              child: PinFieldAutoFill(
                currentCode: conOtp.text,
                decoration: BoxLooseDecoration(
                    strokeWidth: 0.71,
                    radius: const Radius.circular(7.08),
                    strokeColorBuilder:
                        const FixedColorBuilder(Color(0xffD0D0D0))),
                codeLength: 5,
                onCodeChanged: (value) {
                  setState(() {
                    conOtp.text = value!;
                    updateButtonVisibility();
                  });
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Visibility(
                child: isVisible
                    ? Container()
                    : const AccountText(
                        firstText: 'إعادة إرساله مرة أخرى',
                        secondText: 'لم تتلق الرمز؟',
                      )),
            const SizedBox(
              height: 100,
            ),
            Visibility(
              visible: isVisible,
              child: SizedBox(
                height: 54,
                width: 340,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff252C63))),
                    onPressed: () {},
                    child: const Text(
                      'تحقق',
                      style: TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                    )),
              ),
            )
          ]),
        ));
  }
}
