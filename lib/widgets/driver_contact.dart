import 'package:flutter/material.dart';

class DriverContact extends StatelessWidget {
  const DriverContact(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.contactType});

  final Function() onTap;
  final IconData icon;
  final String contactType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: MediaQuery.of(context).size.width / 10,
              height: MediaQuery.of(context).size.height / 22,
              color: const Color(0xff252C63).withOpacity(0.2),
              child: Icon(
                icon,
                color: const Color(0xff252C63),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 62,
        ),
        Text(contactType)
      ],
    );
  }
}
