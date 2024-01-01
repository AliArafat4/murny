import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/bloc/token_bloc/check_token_cubit.dart';
import 'package:murny_final_project/screens/google_maps/google_maps_screen.dart';
import 'package:murny_final_project/screens/splash_screen/splash_signIn_signUp_screen.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double move = 37.h;
  late CheckTokenCubit checkToken;
  late Timer cartTimer;

  @override
  void initState() {
    moveCart();
    checkLocationPermission();
    context.read<CheckTokenCubit>().checkTokenValidity();
    _selectRoute(context);

    super.initState();
  }

  checkLocationPermission() async {
    await userPermission();
  }

  @override
  void didChangeDependencies() {
    checkToken = context.read<CheckTokenCubit>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // checkToken.close();
    cartTimer.cancel();

    super.dispose();
  }

  void moveCart() {
    cartTimer = Timer.periodic(const Duration(milliseconds: 15), (timer) {
      if (mounted) {
        setState(() {
          move -= 5;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              //S  color: Colors.grey,
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
    );
  }

  //Check user token & route
  Future<void> _selectRoute(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2), () {
      context.read<CheckTokenCubit>().state is InvalidTokenState
          ? Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const SplashSignInSignUpScreen()),
              (route) => false,
            )
          : Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const GoogleMapScreen()),
              (route) => false,
            );
    });
  }
}
