import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/token_bloc/check_token_cubit.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double move = 37.h;
  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 15), (timer) {
      setState(() {
        move -= 5;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckTokenCubit>().checkTokenValidity();
    return Scaffold(
      backgroundColor: const Color(0xffEEF0F2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'مُرني',
            style: TextStyle(color: Color(0xff232B69), fontSize: 64),
          ),
          Padding(
            padding: EdgeInsets.only(right: 30.sp),
            child: const Text(
              'Murny',
              style: TextStyle(color: Color(0xff232B69), fontSize: 24),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Stack(children: [
            Image.asset(
              'assets/images/splashImage.png',
              width: 430.w,
              fit: BoxFit.cover,
            ),
            Positioned(
                top: 48.7.sp,
                right: move,
                child: Image.asset('assets/images/carRight.png'))
          ]),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            decoration: const BoxDecoration(color: Color(0xffFFFFFF)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        MurnyApi().signIn(
            body: {"email": "dezykowi@tutuapp.bid", "otp": "777187"},
            function: Auth.signIn);
      }),
    );
  }
}
