import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.all(21),
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 75, left: 295),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Row(
                        children: [
                          Text(
                            'رجوع',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 23,
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('أدخل رمز OTP الخاص بك',
                      style: TextStyle(color: Color(0xff8E98A8), fontSize: 16),
                      textDirection: TextDirection.rtl),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 290,
                height: 48,
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
              const SizedBox(
                height: 23,
              ),
              Visibility(
                child: isVisible
                    ? Container()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {},
                              child: const Text("إعادة إرساله مرة أخرى",
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Color(0xff252C63)))),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(" لم تتلق الرمز؟",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  fontFamily: 'Mulish-Reg',
                                  color: Color(0xff000000))),
                        ],
                      ),
              ),
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
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff252C63))),
                      onPressed: () {},
                      child: const Text('تحقق')),
                ),
              )
            ])));
  }
}
