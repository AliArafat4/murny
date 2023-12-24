import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/location.dart';
import 'package:flutter_dash/flutter_dash.dart';

class BookLocation extends StatelessWidget {
  const BookLocation(
      {super.key, required this.locationFrom, required this.locationTo});
  final String locationFrom;
  final String locationTo;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffCDCED3).withOpacity(0.4),
          borderRadius: BorderRadius.circular(16)),
      width: MediaQuery.of(context).size.width - 32,
      height: MediaQuery.of(context).size.height / 8,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Location(
                color: Color(0xff252C63),
                icon: Icons.my_location,
                title: locationFrom),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 28),
              child: const Dash(
                  direction: Axis.vertical,
                  length: 22,
                  dashLength: 4,
                  dashThickness: 2,
                  dashColor: Colors.black),
            ),
            Location(
              color: Color(0xffF21D53),
              icon: Icons.location_on_outlined,
              title: locationTo,
            ),
          ],
        ),
      ),
    );
  }
}
