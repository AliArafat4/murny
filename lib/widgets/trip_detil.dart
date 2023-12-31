import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TripDetil extends StatelessWidget {
  const TripDetil(
      {super.key,
      required this.tripStartTime,
      required this.destinationArrivalTime});
  final String tripStartTime;
  final String destinationArrivalTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              AppLocalizations.of(context)!.startTrip,
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            Text(
              tripStartTime,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        Image.asset(
          "assets/images/golf_cart_icon.png",
          color: Colors.grey,
        ),
        Column(
          children: [
            Text(
              AppLocalizations.of(context)!.endTrip,
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            Text(
              destinationArrivalTime,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
