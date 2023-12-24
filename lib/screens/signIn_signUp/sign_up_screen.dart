import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: Padding(
        padding: const EdgeInsets.all(21),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 72, left: 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/carLeft.png',
                      width: 125,
                      height: 120,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        'رجوع',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Align(
                alignment: Alignment.topRight,
                child: Text('إنشاء حساب',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff252C63),
                    )
                    //fontWeight: FontWeight.bold),
                    )),
            SizedBox(
              height: 4.h,
            ),
            TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff252C63)),
                      borderRadius: BorderRadius.circular(8)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff252C63)),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff252C63)),
                      borderRadius: BorderRadius.circular(8)),
                  hintText: 'الإسم الثلاثي',
                  // hintStyle: const TextStyle(fontSize: 18),
                  hintTextDirection: TextDirection.rtl),
            ),
            SizedBox(
              height: 2.h,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff252C63)),
                      borderRadius: BorderRadius.circular(8)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff252C63)),
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xff252C63)),
                      borderRadius: BorderRadius.circular(8)),
                  hintText: 'ادخل رقم جوالك',
                  // hintStyle: const TextStyle(fontSize: 18),
                  hintTextDirection: TextDirection.rtl),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  '.بالإشتراك أنت توافق على شروط الخدمة وسياسة الخصوصية',
                  style: TextStyle(color: Color(0xff000000), fontSize: 12),
                ),
                Radio(
                  value: 1,
                  activeColor: const Color(0xff252C63),
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                      print("Button value: $value");
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            SizedBox(
              height: 54,
              width: 340,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff252C63))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text('اشتراك')),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10),
                    child: const Divider(
                      thickness: 1,
                      color: Color(0xffB8B8B8),
                      height: 24,
                    )),
              ),
              const Text(
                "أو",
                style: TextStyle(color: Color(0xffB8B8B8)),
              ),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10.0),
                    child: const Divider(
                      thickness: 1,
                      color: Color(0xffB8B8B8),
                      height: 24,
                    )),
              ),
            ]),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
                height: 48,
                width: 353,
                child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff000000)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffFFFFFF)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                        color: Color(0xff252C63))))),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const SignInScreen()),
                      // );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('قم بالتسجيل باستخدام Gmail',
                            textDirection: TextDirection.rtl),
                        const SizedBox(
                          width: 12,
                        ),
                        Image.asset('assets/images/Gmail.png'),
                      ],
                    ))),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
                height: 48,
                width: 353,
                child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff000000)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xffFFFFFF)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                        color: Color(0xff252C63))))),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const SignInScreen()),
                      // );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('قم بالتسجيل باستخدام ابل',
                            textDirection: TextDirection.rtl),
                        const SizedBox(
                          width: 12,
                        ),
                        Image.asset('assets/images/Apple.png'),
                      ],
                    ))),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                    onTap: () {},
                    child: const Text("تسجيل الدخول",
                        textDirection: TextDirection.rtl,
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff252C63)))),
                const SizedBox(
                  width: 5,
                ),
                const Text(" هل لديك حساب؟",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Mulish-Reg',
                        color: Color(0xff000000))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
