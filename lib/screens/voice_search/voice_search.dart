import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/voice_search/search.dart';
import 'package:murny_final_project/screens/voice_search/search_bar.dart';
import 'package:murny_final_project/screens/voice_search/voice_button.dart';

// ignore: must_be_immutable
class VoiceSearch extends StatelessWidget {
  VoiceSearch({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                      (Route route) => false);
                },
                icon: const Icon(Icons.close),
              ),
            ),
            searchBar(
              hint: "الى أين تريد/ين الذهاب",
              controller: searchController,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            const Center(child: VoiceSearchButton()),
          ],
        ),
      ),
    ));
  }
}
