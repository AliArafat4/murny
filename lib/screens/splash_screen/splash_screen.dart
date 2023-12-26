import 'package:flutter/material.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
          const Padding(
            padding: EdgeInsets.only(right: 50),
            child: Text(
              'Murny',
              style: TextStyle(color: Color(0xff232B69), fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/images/carRight.png',
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            decoration: const BoxDecoration(color: Color(0xffFFFFFF)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        MurnyApi().signIn(
            body: {"email": "dezykowi@tutuapp.bid", "otp": "100458"},
            function: Auth.signIn);
      }),
    );
  }
}
