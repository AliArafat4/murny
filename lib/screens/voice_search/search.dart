import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/custom_divider.dart';
import 'package:murny_final_project/widgets/location_search.dart';
import 'package:murny_final_project/widgets/location_search_result.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController currentLocation = TextEditingController();

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
                  child: Text(
                    AppLocalizations.of(context)!.selectLocation,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              ],
            ),
            const Divider(
                // color: Colors.black,
                ),
            LocationSearchResult(
              buildingName: "كلية علوم الحاسب والمعلوماتA3",
              cityName: "الرياض، محافظة الرياض، المملكة العربية السعودية",
            ),
          ],
        ),
      ),
    );
  }
}
