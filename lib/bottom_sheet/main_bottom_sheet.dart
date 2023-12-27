import 'package:flutter/material.dart';

class MainBottomSheet extends StatelessWidget {
  const MainBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 62,
            ),
            Image.asset(
              "assets/images/waiting_icon.png",
              width: MediaQuery.of(context).size.width / 4,
            ),
            const Text(
              "انتظر طلبك القادم",
              style: TextStyle(fontSize: 18, color: Color(0xff252C63)),
            ),
          ],
        ),
      ),
    );
  }
}
