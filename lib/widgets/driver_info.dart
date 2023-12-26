import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/driver_contact.dart';
import 'package:murny_final_project/widgets/driver_rate.dart';

class DriverInfo extends StatelessWidget {
  const DriverInfo(
      {super.key, required this.driverImage, required this.driverName});
  final String driverImage;
  final String driverName;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Stack(children: [
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width / 20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xff252C63), width: 2),
            ),
            child: Image.asset(
              driverImage,
              width: MediaQuery.of(context).size.width / 6,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 17,
          right: MediaQuery.of(context).size.width / 20,
          child: Container(
            child: const DriverRate(rate: "5.0"),
          ),
        ),
      ]),
      SizedBox(
        width: MediaQuery.of(context).size.width / 32,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(driverName),
          SizedBox(
            height: MediaQuery.of(context).size.height / 80,
          ),
          Row(
            children: [
              DriverContact(
                  onTap: () {}, icon: Icons.phone, contactType: "اتصال"),
              SizedBox(
                width: MediaQuery.of(context).size.width / 32,
              ),
              DriverContact(
                  onTap: () {}, icon: Icons.chat, contactType: "مراسلة")
            ],
          ),
        ],
      )
    ]);
  }
}
