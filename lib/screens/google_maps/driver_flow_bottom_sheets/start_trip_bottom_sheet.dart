import 'package:flutter/material.dart';

class StartTripBottomSheet extends StatelessWidget {
  const StartTripBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text("Waiting For Order"), LinearProgressIndicator()],
    );
  }
}
