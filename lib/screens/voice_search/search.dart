import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/custom_divider.dart';
import 'package:murny_final_project/widgets/location_search.dart';
import 'package:murny_final_project/widgets/location_search_result.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LocationSearch(),
            const CustomDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/select_location.png"),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "تحديد الموقع على الخريطة",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            LocationSearchResult(
              buildingName: "كلية علوم الحاسب والمعلوماتA3",
              cityName: "الرياض، محافظة الرياض، المملكة العربية السعودية",
            )
          ],
        ),
      ),
    );
  }
}
