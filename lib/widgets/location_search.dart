import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/voice_search/search_bar.dart';

class LocationSearch extends StatelessWidget {
  const LocationSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: Color(0xff252C63),
                size: 18,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 42,
              ),
              /*searchBar(
              hint: "الى أين تريد/ين الذهاب",
              controller: searchController,
            ),*/
            ],
          ),
          Row(
            children: [
              const SizedBox(
                height: 42,
                child: VerticalDivider(
                  thickness: 2,
                  endIndent: 9,
                  indent: 9,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 62,
                  child: const Divider(
                    endIndent: 62,
                    thickness: 3,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Color(0xffF21D53),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 42,
              ),
              const Text("موقعك الحالي")
            ],
          )
        ],
      ),
    );
  }
}
