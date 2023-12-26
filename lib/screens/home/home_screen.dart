import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:murny_final_project/screens/editAccount/edit_account_screen.dart';
import 'package:murny_final_project/widgets/segment_control.dart';
import 'package:murny_final_project/widgets/text_field_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color.fromARGB(189, 44, 44, 205),
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  bottomLeft: Radius.circular(80))),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.sp, left: 154),
                child: const CircleAvatar(
                  radius: 44,
                  foregroundImage:
                      AssetImage("assets/images/personalImage.png"),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.sp),
                child: const Text(
                  'مروة',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.sp),
                child: Row(
                  children: [
                    const Text(
                      'الجوال',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    const Text(
                      '966548784080+',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.sp),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditAccount()),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.edit_note_sharp,
                        size: 30,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      const Text(
                        'تعديل الحساب',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.sp, right: 15.sp),
                child: Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 30,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    const Text(
                      'الدعم',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.sp, right: 15.sp),
                child: Row(
                  children: [
                    const Icon(
                      Icons.wallet,
                      size: 30,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    const Text(
                      'المحفظة',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.sp, right: 15.sp),
                child: Row(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 30,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    const Text(
                      'معلومات عنا',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.sp, right: 15.sp),
                child: Row(
                  children: [
                    const Icon(
                      Icons.file_present_sharp,
                      size: 30,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    const Text(
                      'الشروط والأحكام',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.sp, right: 15.sp),
                child: Row(
                  children: [
                    const Icon(
                      Icons.security,
                      size: 30,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    const Text(
                      'سياسة الخصوصية',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    )
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                  // height: 23,
                  child: SegmentControl(
                textOne: 'العربية',
                textTwo: 'English',
                colorSelected: const Color(0xff000000),
              )

                  // MaterialSegmentedControl(
                  //     horizontalPadding:
                  //         EdgeInsets.only(left: 50.sp, right: 20, top: 20.sp),
                  //     children: _children,
                  //     selectionIndex: _currentSelection,
                  //     borderColor: const Color(0xff000000),
                  //     selectedColor: const Color(0xff000000),
                  //     unselectedColor: Colors.white,
                  //     selectedTextStyle:
                  //         const TextStyle(color: Color(0xffFFFFFF), fontSize: 14),
                  //     unselectedTextStyle:
                  //         const TextStyle(color: Color(0xff000000), fontSize: 14),
                  //     borderWidth: 0.7,
                  //     borderRadius: 6.0,
                  //     disabledChildren: _disabledIndices,
                  //     verticalOffset: 8.0,
                  //     onSegmentTapped: (index) {
                  //       setState(() {
                  //         _currentSelection = index;
                  //       });
                  //     }),
                  ),
              SizedBox(
                height: 30.sp,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.sp, left: 64.sp),
                child: const Icon(Icons.light_mode_outlined),
              )
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            top: 40.sp,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFieldSearch(
                fun: () => _scaffoldKey.currentState!.openDrawer(),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 20.h,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      color: Color(0xffFFFFFF)),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Center(
                          child: SizedBox(
                            height: 6.h,
                            width: 85.w,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    backgroundColor: MaterialStateProperty.all(
                                        const Color(0xff252C63))),
                                onPressed: () {},
                                child: const Text(
                                  'اطلب الآن',
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF), fontSize: 20),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
