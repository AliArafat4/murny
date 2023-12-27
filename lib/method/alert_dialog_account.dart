import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

alertDialogAccount(
    {required BuildContext context,
    required String title,
    required String subtitle,
    required String textButton1,
    required String textButton2}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 0,
      backgroundColor: Colors.white,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 200),
              Text(
                title,
                style: TextStyle(fontSize: 22),
              ),
              Text(
                subtitle,
                style: TextStyle(color: Color(0xff898989), fontSize: 12),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 62),
              Row(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text(textButton1)),
                  SizedBox(height: 20.h),
                  ElevatedButton(onPressed: () {}, child: Text(textButton2))
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
