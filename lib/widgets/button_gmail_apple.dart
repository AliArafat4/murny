// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class ButtonGmailApple extends StatelessWidget {
//   ButtonGmailApple(
//       {super.key,
//       required this.text,
//       required this.image,
//       required this.leftSpace});

//   final String text;
//   final String image;
//   final double leftSpace;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 48,
//         width: 353,
//         // child: ElevatedButton(
//         //     style: ButtonStyle(
//         //         foregroundColor:
//         //             MaterialStateProperty.all<Color>(const Color(0xff000000)),
//         //         backgroundColor:
//         //             MaterialStateProperty.all<Color>(const Color(0xffFFFFFF)),
//         //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//         //             RoundedRectangleBorder(
//         //                 borderRadius: BorderRadius.circular(8),
//         //                 side: const BorderSide(color: Color(0xff252C63))))),
//         //     onPressed: () {
//         //       // Navigator.push(
//         //       //   context,
//         //       //   MaterialPageRoute(
//         //       //       builder: (context) => const SignInScreen()),
//         //       // );
//         //     },
//         child: Padding(
//           padding: EdgeInsets.only(left: leftSpace),
//           child: ListTile(
//             title: SvgPicture.asset(image),
//             subtitle: Text(
//               text,
//               textDirection: TextDirection.rtl,
//               style: const TextStyle(color: Color(0xff8E98A8)),
//             ),

//             //  Image.asset(image),
//           ),
//         ));
//   }
// }
