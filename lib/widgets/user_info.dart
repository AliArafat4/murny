import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.userName, required this.userPhone});
  final String userName;
  final String userPhone;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Color(0xff252C63),
            ),
            Icon(Icons.phone, color: Color(0xff252C63))
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 42,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              userPhone,
              style: const TextStyle(fontSize: 16),
            )
          ],
        ),
      ],
    );
  }
}
