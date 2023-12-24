import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/accept_order_bottom_sheet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        children: [Spacer(), AcceptOrderBottomSheet()],
      ),
    );
  }
}
