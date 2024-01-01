// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:murny_final_project/api/mury_api.dart';
// import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
// import 'package:murny_final_project/bloc/theme_bloc/them_bloc.dart';
// import 'package:murny_final_project/bloc/theme_bloc/them_event.dart';
// import 'package:murny_final_project/local_storage/shared_prefrences.dart';
// import 'package:murny_final_project/screens/balance/balance_home.dart';
// import 'package:murny_final_project/screens/contactWithUs/contact_with_us_screen.dart';
// import 'package:murny_final_project/screens/editAccount/edit_account_screen.dart';
// import 'package:murny_final_project/widgets/content_drawer.dart';
// import 'package:murny_final_project/widgets/segment_control.dart';
// import 'package:murny_final_project/widgets/text_field_search.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;
//   @override
//   Widget build(BuildContext context) {
// <<<<<<< Arwa-Alzahrani
//     List<Marker> driversMarker = [];
//     GoogleMapController? googleMapController;

//     CameraPosition initialCameraPosition;
//     initialCameraPosition =
//         const CameraPosition(target: LatLng(0, 0), zoom: 10);
//     Map<PolylineId, Polyline> distance = {};
//     return GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             key: _scaffoldKey,
//             // backgroundColor: const Color.fromARGB(189, 44, 44, 205),
//             drawer: Drawer(
//               shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(80),
//                       bottomLeft: Radius.circular(80))),
//               child: ListView(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(top: 20.sp, left: 180),
//                     child: const CircleAvatar(
//                       radius: 44,
//                       foregroundImage:
//                           AssetImage("assets/images/personalImage.png"),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 2.h,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(right: 12.sp),
//                     child: const Text(
//                       'مروة',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(right: 12.sp),
//                     child: const Row(
//                       children: [
//                         Text(
//                           '966548784080+',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400, fontSize: 18),
//                         )
//                       ],
//                     ),
//                   ),
//                   ContentDrawer(
//                     text: AppLocalizations.of(context)!.editAccount,
//                     imageSvg: isSwitched
//                         ? 'assets/images/drawerImage6.svg'
//                         : 'assets/images/imageEditAccount.svg',
//                     spaceTop: 0.sp,
//                     naviPush: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => EditAccount()),
//                       );
//                     },
//                   ),
//                   ContentDrawer(
//                     text: AppLocalizations.of(context)!.support,
//                     imageSvg: isSwitched
//                         ? 'assets/images/drawerImage1.svg'
//                         : 'assets/images/imageSupport.svg',
//                     spaceTop: 20.sp,
//                     naviPush: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ContactWithUs()),
//                       );
//                     },
//                   ),
//                   const Divider(
//                     thickness: 1,
//                   ),
//                   ContentDrawer(
//                     text: AppLocalizations.of(context)!.wallet,
//                     imageSvg: isSwitched
//                         ? 'assets/images/drawerImage2.svg'
//                         : 'assets/images/imageWallet.svg',
//                     spaceTop: 15.sp,
//                     naviPush: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const HomeBalanceScreen()),
//                       );
//                     },
//                   ),
//                   const Divider(
//                     thickness: 1,
//                   ),
//                   ContentDrawer(
//                     text: AppLocalizations.of(context)!.aboutUs,
//                     imageSvg: isSwitched
//                         ? 'assets/images/drawerImage3.svg'
//                         : 'assets/images/imageInfo.svg',
//                     spaceTop: 15.sp,
//                   ),
//                   const Divider(
//                     thickness: 1,
//                   ),
//                   ContentDrawer(
//                     text: AppLocalizations.of(context)!.termsAndConditions,
//                     imageSvg: isSwitched
//                         ? 'assets/images/drawerImage4.svg'
//                         : 'assets/images/imageConditions.svg',
//                     spaceTop: 15.sp,
//                   ),
//                   const Divider(
//                     thickness: 1,
//                   ),
//                   ContentDrawer(
//                     text: AppLocalizations.of(context)!.privacyPolicy,
//                     imageSvg: isSwitched
//                         ? 'assets/images/drawerImage5.svg'
//                         : 'assets/images/imagePrivacy.svg',
//                     spaceTop: 15.sp,
//                   ),
//                   const Divider(
//                     thickness: 1,
//                   ),
//                   const SizedBox(
//                       // height: 23,
//                       child: SegmentControl(
//                     textOne: 'العربية',
//                     textTwo: 'English',
//                     colorSelected: Color(0xff000000),
//                     // isSegmentUser: false,
//                   )),
//                   Padding(
//                     padding: EdgeInsets.only(top: 50.sp, left: 67.sp),
//                     child: InkWell(
//                         onTap: () {
//                           isSwitched
//                               ? context
//                                   .read<ThemeBloc>()
//                                   .add(ChangeThemeEvent(themeText: "light"))
//                               : context
//                                   .read<ThemeBloc>()
//                                   .add(ChangeThemeEvent(themeText: "dark"));
//                         },
//                         child: isSwitched
//                             ? const Icon(Icons.light_mode_outlined)
//                             : const Icon(Icons.dark_mode_outlined)),
//                   )
//                 ],
//               ),
//             ),
//             body:
//                 // Stack(
//                 //   children: [
//                 //     SizedBox(
//                 //       height: MediaQuery.of(context).size.height,
//                 //       width: double.infinity,
//                 //       child: BlocConsumer<MapBloc, MapState>(
//                 //         builder: (context, state) {
//                 //           return GoogleMap(
//                 //             compassEnabled: true,
//                 //             mapToolbarEnabled: true,
//                 //             myLocationEnabled: true,
//                 //             myLocationButtonEnabled: true,
//                 //             mapType: MapType.satellite, //MapType.normal,
//                 //             polylines: Set<Polyline>.of(distance.values),
//                 //             markers: Set.from(driversMarker),
//                 //             initialCameraPosition: initialCameraPosition,
//                 //             onMapCreated: (GoogleMapController controller) {
//                 //               googleMapController = controller;
//                 //               context
//                 //                   .read<MapBloc>()
//                 //                   .add(MapGetDriversMarkerEvent());
//                 //             },
//                 //             onTap: (location) async {
//                 //               // distance = await getPolyline(
//                 //               //     userLocation: const LatLng(24.788661, 46.639270),
//                 //               //     driverLocation: const LatLng(20.787648, 46.637006));
//                 //               // print(distance.values);
//                 //               // print("distance");

//                 //               print("location");
//                 //               print(location);
//                 //               MurnyApi().signOut(context: context);
//                 //             },
//                 //           );
//                 //         },
//                 //         listener: (BuildContext context, MapState state) async {
//                 //           //GO TO USER LOCATION
//                 //           if (state is MapGetCurrentLocationState) {
//                 //             googleMapController?.animateCamera(
//                 //                 CameraUpdate.newLatLngZoom(
//                 //                     LatLng(state.userLocation.latitude,
//                 //                         state.userLocation.longitude),
//                 //                     10));
//                 //           } else {
//                 //             context.read<MapBloc>().add(MapGetDriversMarkerEvent());
//                 //           }

//                 //           //Add drivers markers to the map
//                 //           if (state is MapGetDriversMarkerState &&
//                 //               driversMarker.length < state.driverModelList.length) {
//                 //             for (var marker in state.driverModelList) {
//                 //               var customIcon;

//                 //               await BitmapDescriptor.fromAssetImage(
//                 //                       const ImageConfiguration(),
//                 //                       "assets/images/markerX3.png")
//                 //                   .then((d) {
//                 //                 customIcon = d;

//                 //                 Future.delayed(const Duration(seconds: 2));
//                 //               });

//                 //               driversMarker.add(Marker(
//                 //                   markerId: MarkerId((marker.id.toString())),
//                 //                   position: LatLng(marker.lat!, marker.lng!),
//                 //                   icon: customIcon,
//                 //                   onTap: () {
//                 //                     print(marker.lat!);
//                 //                     print(marker.lng!);
//                 //                     print("marker.lng!");
//                 //                   }));

//                 //               print("driversMarker");
//                 //               print(driversMarker);
//                 //             }
//                 //           }
//                 //         },
//                 //       ),
//                 //     ),
//                 Padding(
//               padding: EdgeInsets.only(
//                 top: 40.sp,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   TextFieldSearch(
//                     fun: () => _scaffoldKey.currentState!.openDrawer(),
//                   ),
//                   Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 20.h,
//                       decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(12),
//                               topRight: Radius.circular(12)),
//                           color: Color(0xffFFFFFF)),
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             child: Center(
//                               child: SizedBox(
//                                 height: 6.h,
//                                 width: 85.w,
//                                 child: ElevatedButton(
//                                     style: ButtonStyle(
//                                         shape: MaterialStateProperty.all<
//                                                 RoundedRectangleBorder>(
//                                             RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8))),
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 const Color(0xff252C63))),
//                                     onPressed: () {},
//                                     child: const Text(
//                                       'اطلب الآن',
//                                       style: TextStyle(
//                                           color: Color(0xffFFFFFF),
//                                           fontSize: 20),
//                                     )),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ))
//                 ],
//               ),
//             )
//             //   ],
//             // )

//             ));
// =======
//     Locale myLocale = Localizations.localeOf(context);
//     String currentLanguage = myLocale.languageCode;
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//       },
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         key: _scaffoldKey,
//         backgroundColor: const Color.fromARGB(189, 44, 44, 205),
//         drawer: Drawer(
//           shape: RoundedRectangleBorder(
//             borderRadius: currentLanguage == 'ar'
//                 ? BorderRadius.only(
//                     topLeft: Radius.circular(80),
//                     bottomLeft: Radius.circular(80))
//                 : BorderRadius.only(
//                     topRight: Radius.circular(80),
//                     bottomRight: Radius.circular(80)),
//           ),
//           child: ListView(
//             children: [
//               Padding(
//                 padding: currentLanguage == 'ar'
//                     ? EdgeInsets.only(top: 20.sp, left: 180)
//                     : EdgeInsets.only(top: 20.sp, right: 180),
//                 child: const CircleAvatar(
//                   radius: 44,
//                   foregroundImage:
//                       AssetImage("assets/images/personalImage.png"),
//                 ),
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//               Padding(
//                 padding: currentLanguage == 'ar'
//                     ? EdgeInsets.only(right: 12.sp)
//                     : EdgeInsets.only(left: 12.sp),
//                 child: const Text(
//                   'مروة',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//                 ),
//               ),
//               Padding(
//                 padding: currentLanguage == 'ar'
//                     ? EdgeInsets.only(right: 12.sp)
//                     : EdgeInsets.only(left: 12.sp),
//                 child: Row(
//                   children: [
//                     const Text(
//                       '966548784080+',
//                       style:
//                           TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
//                     )
//                   ],
//                 ),
//               ),
//               ContentDrawer(
//                 text: AppLocalizations.of(context)!.editAccount,
//                 imageSvg: 'assets/images/imageEditAccount.svg',
//                 spaceTop: 0.sp,
//                 naviPush: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => EditAccount()),
//                   );
//                 },
//               ),
//               ContentDrawer(
//                 text: AppLocalizations.of(context)!.support,
//                 imageSvg: 'assets/images/imageSupport.svg',
//                 spaceTop: 20.sp,
//                 naviPush: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const ContactWithUs()),
//                   );
//                 },
//               ),
//               const Divider(
//                 thickness: 1,
//               ),
//               ContentDrawer(
//                 text: AppLocalizations.of(context)!.wallet,
//                 imageSvg: 'assets/images/imageWallet.svg',
//                 spaceTop: 15.sp,
//                 naviPush: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const HomeBalanceScreen()),
//                   );
//                 },
//               ),
//               const Divider(
//                 thickness: 1,
//               ),
//               ContentDrawer(
//                 text: AppLocalizations.of(context)!.aboutUs,
//                 imageSvg: 'assets/images/imageInfo.svg',
//                 spaceTop: 15.sp,
//               ),
//               const Divider(
//                 thickness: 1,
//               ),
//               ContentDrawer(
//                 text: AppLocalizations.of(context)!.termsAndConditions,
//                 imageSvg: 'assets/images/imageConditions.svg',
//                 spaceTop: 15.sp,
//               ),
//               const Divider(
//                 thickness: 1,
//               ),
//               ContentDrawer(
//                 text: AppLocalizations.of(context)!.privacyPolicy,
//                 imageSvg: 'assets/images/imagePrivacy.svg',
//                 spaceTop: 15.sp,
//               ),
//               const Divider(
//                 thickness: 1,
//               ),
//               SizedBox(
//                   // height: 23,
//                   child: SegmentControl(
//                 textOne: 'العربية',
//                 textTwo: 'English',
//                 colorSelected: const Color(0xff000000),
//                 // isSegmentUser: false,
//               )),
//               Padding(
//                 padding: currentLanguage == 'ar'
//                     ? EdgeInsets.only(top: 52.sp, left: 61.sp)
//                     : EdgeInsets.only(top: 52.sp, right: 61.sp),
//                 child: const Icon(Icons.light_mode_outlined),
//               )
//             ],
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.only(
//             top: 40.sp,
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextFieldSearch(
//                 fun: () => _scaffoldKey.currentState!.openDrawer(),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: 20.h,
//                 decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(12),
//                         topRight: Radius.circular(12)),
//                     color: Color(0xffFFFFFF)),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       child: Center(
//                         child: SizedBox(
//                           height: 6.h,
//                           width: 85.w,
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                                 shape: MaterialStateProperty.all<
//                                         RoundedRectangleBorder>(
//                                     RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(8))),
//                                 backgroundColor: MaterialStateProperty.all(
//                                     const Color(0xff252C63))),
//                             onPressed: () {},
//                             child: Text(
//                               AppLocalizations.of(context)!.orderNow,
//                               style: const TextStyle(
//                                   color: Color(0xffFFFFFF), fontSize: 20),

//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomDrawer extends StatelessWidget {
//   const CustomDrawer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(80), bottomLeft: Radius.circular(80))),
//       child: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 20.sp, left: 180),
//             child: const CircleAvatar(
//               radius: 44,
//               foregroundImage: AssetImage("assets/images/personalImage.png"),
//             ),
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           Padding(
//             padding: EdgeInsets.only(right: 12.sp),
//             child: const Text(
//               'مروة',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(right: 12.sp),
//             child: Row(
//               children: [
//                 const Text(
//                   '966548784080+',
//                   style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
//                 )
//               ],
//             ),
//           ),
//           ContentDrawer(
//             text: AppLocalizations.of(context)!.editAccount,
//             imageSvg: 'assets/images/imageEditAccount.svg',
//             spaceTop: 0.sp,
//             naviPush: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => EditAccount()),
//               );
//             },
//           ),
//           ContentDrawer(
//             text: AppLocalizations.of(context)!.support,
//             imageSvg: 'assets/images/imageSupport.svg',
//             spaceTop: 20.sp,
//             naviPush: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ContactWithUs()),
//               );
//             },
//           ),
//           const Divider(
//             thickness: 1,
//           ),
//           ContentDrawer(
//             text: AppLocalizations.of(context)!.wallet,
//             imageSvg: 'assets/images/imageWallet.svg',
//             spaceTop: 15.sp,
//             naviPush: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => const HomeBalanceScreen()),
//               );
//             },
//           ),
//           const Divider(
//             thickness: 1,
//           ),
//           ContentDrawer(
//             text: AppLocalizations.of(context)!.aboutUs,
//             imageSvg: 'assets/images/imageInfo.svg',
//             spaceTop: 15.sp,
//           ),
//           const Divider(
//             thickness: 1,
//           ),
//           ContentDrawer(
//             text: AppLocalizations.of(context)!.termsAndConditions,
//             imageSvg: 'assets/images/imageConditions.svg',
//             spaceTop: 15.sp,
//           ),
//           const Divider(
//             thickness: 1,
//           ),
//           ContentDrawer(
//             text: AppLocalizations.of(context)!.privacyPolicy,
//             imageSvg: 'assets/images/imagePrivacy.svg',
//             spaceTop: 15.sp,
//           ),
//           const Divider(
//             thickness: 1,
//           ),
//           SizedBox(
//               // height: 23,
//               child: SegmentControl(
//             textOne: 'العربية',
//             textTwo: 'English',
//             colorSelected: const Color(0xff000000),
//             // isSegmentUser: false,
//           )),
//           Padding(
//             padding: EdgeInsets.only(top: 60.sp, left: 61.sp),
//             child: const Icon(Icons.light_mode_outlined),
//           )
//         ],
//       ),
//     );
// >>>>>>> main
//   }
// }
