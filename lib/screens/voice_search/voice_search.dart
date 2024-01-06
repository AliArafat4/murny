import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/voice_search/search_bar.dart';
import 'package:murny_final_project/screens/voice_search/voice_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class VoiceSearchScreen extends StatelessWidget {
  VoiceSearchScreen({super.key});
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
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ),
            SearchBarWidget(
              hint: AppLocalizations.of(context)!.destination,
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
