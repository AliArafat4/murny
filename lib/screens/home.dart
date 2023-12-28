import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
//delete this screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
              },
              child: Text("test"),
            ),
          )
        ],
      ),
    ));
  }
}
