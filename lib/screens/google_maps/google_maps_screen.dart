import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/bloc/profile_bloc/profile_bloc.dart';
import 'package:murny_final_project/bloc/public_bloc/public_cubit.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_bloc.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_event.dart';
import 'package:murny_final_project/extentions/size_extention.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/method/show_main_bottom_sheet.dart';
import 'package:murny_final_project/method/show_order_bottom_sheet.dart';
import 'package:murny_final_project/screens/balance/balance_home.dart';
import 'package:murny_final_project/screens/balance/payment_type.dart';
import 'package:murny_final_project/screens/contactWithUs/contact_with_us_screen.dart';
import 'package:murny_final_project/screens/editAccount/edit_account_screen.dart';
import 'package:murny_final_project/screens/google_maps/components/filter_bottom_sheet.dart';
import 'package:murny_final_project/screens/home/home_screen.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/content_drawer.dart';
import 'package:murny_final_project/widgets/golf_cart_detail.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:murny_final_project/widgets/segment_control.dart';
import 'package:murny_final_project/widgets/text_field_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    bool isSwitched = SharedPref().getCurrentTheme() == "dark" ? true : false;

    List<Marker> driversMarker = [];
    String locationName = "";
    Locale myLocale = Localizations.localeOf(context);

    String currentLanguage = myLocale.languageCode;
    GoogleMapController? googleMapController;

    CameraPosition initialCameraPosition;
    initialCameraPosition =
        const CameraPosition(target: LatLng(0, 0), zoom: 10);
    Map<PolylineId, Polyline> distance = {};

    return Scaffold(
      drawer: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: currentLanguage == 'ar'
                ? BorderRadius.only(
                    topLeft: Radius.circular(80),
                    bottomLeft: Radius.circular(80))
                : BorderRadius.only(
                    topRight: Radius.circular(80),
                    bottomRight: Radius.circular(80)),
          ),
          child: ListView(
            children: [
              Padding(
                padding: currentLanguage == 'ar'
                    ? EdgeInsets.only(top: 20.sp, left: 180)
                    : EdgeInsets.only(top: 20.sp, right: 180),
                child: const CircleAvatar(
                  radius: 44,
                  foregroundImage:
                      AssetImage("assets/images/personalImage.png"),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: currentLanguage == 'ar'
                    ? EdgeInsets.only(right: 12.sp)
                    : EdgeInsets.only(left: 12.sp),
                child: const Text(
                  'مروة',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: currentLanguage == 'ar'
                    ? EdgeInsets.only(right: 12.sp)
                    : EdgeInsets.only(left: 12.sp),
                child: Row(
                  children: [
                    const Text(
                      '966548784080+',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                    )
                  ],
                ),
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.editAccount,
                imageSvg: 'assets/images/editAccount.png',
                spaceTop: 0.sp,
                naviPush: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditAccount()),
                  );
                },
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.support,
                imageSvg: 'assets/images/support.png',
                spaceTop: 20.sp,
                naviPush: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactWithUs()),
                  );
                },
              ),
              const Divider(
                thickness: 1,
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.wallet,
                imageSvg: 'assets/images/wallet.png',
                spaceTop: 15.sp,
                naviPush: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeBalanceScreen()),
                  );
                },
              ),
              const Divider(
                thickness: 1,
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.aboutUs,
                imageSvg: 'assets/images/aboutUs.png',
                spaceTop: 15.sp,
              ),
              const Divider(
                thickness: 1,
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.termsAndConditions,
                imageSvg: 'assets/images/terms.png',
                spaceTop: 15.sp,
              ),
              const Divider(
                thickness: 1,
              ),
              ContentDrawer(
                text: AppLocalizations.of(context)!.privacyPolicy,
                imageSvg: 'assets/images/privacy.png',
                spaceTop: 15.sp,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                  // height: 23,
                  child: SegmentControl(
                textOne: 'العربية',
                textTwo: 'English',
                colorSelected: Color(0xff000000),
                // isSegmentUser: false,
              )),
              Padding(
                padding: currentLanguage == 'ar'
                    ? EdgeInsets.only(top: 52.sp, left: 61.sp)
                    : EdgeInsets.only(top: 52.sp, right: 66.sp),
                child: InkWell(
                  onTap: () {
                    isSwitched
                        ? context
                            .read<ThemeBloc>()
                            .add(ChangeThemeEvent(themeText: "light"))
                        : context
                            .read<ThemeBloc>()
                            .add(ChangeThemeEvent(themeText: "dark"));
                  },
                  child: isSwitched
                      ? const Icon(
                          Icons.light_mode_outlined,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.dark_mode_outlined,
                          color: Colors.black,
                        ),
                ),
              )
            ],
          )),
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: BlocConsumer<MapBloc, MapState>(
                builder: (context, state) {
                  return SlidingUpPanel(
                    body: GoogleMap(
                      compassEnabled: true,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      mapType: MapType.normal, // MapType.satellite, //,
                      polylines: Set<Polyline>.of(distance.values),
                      markers: Set.from(driversMarker),
                      initialCameraPosition: initialCameraPosition,
                      onMapCreated: (GoogleMapController controller) {
                        googleMapController = controller;
                        context
                            .read<MapBloc>()
                            .add(MapGetCurrentLocationEvent());
                        context.read<MapBloc>().add(MapGetDriversMarkerEvent());
                      },
                      onTap: (location) async {
                        // TODO: SEARCH FUNCTION
                        // final places = GoogleMapsPlaces(apiKey: dotenv.env['GoogleMapsApiKey']);
                        //                         PlacesSearchResponse response = await places.searchByText("Riyad");
                        //
                        //                         print(response.status);
                        //                         print(response.errorMessage);
                        //                         print(response.results.first.name);
                        print("location");
                        print(location);
                        // TODO: SIGN OUT
                        // MurnyApi().signOut(context: context);
                      },
                    ),

                    //TODO: CHECK LAST ORDER STATE
                    panel: const FilterSheet(),
                    // ("LAST ORDER " != "CANCELED OR NULL OR DECLINED")
                    //   ? const FilterSheet()
                    //   : ("LAST ORDER " == "JUST CREATED")
                    //       ? SizedBox() // TODO: SHOW ORDER LOADING
                    //       : ("LAST ORDER " == "ACCEPTED")
                    //           ? SizedBox() // TODO: SHOW DRIVING IS COMING OR NOTHING
                    //           : SizedBox(), // TODO: SHOW ??

                    maxHeight: ("LAST ORDER " != "ACCEPTED")
                        ? context.getHeight(factor: 0.45)
                        : 0,
                    // backdropEnabled: true,
                  );
                },
                listener: (BuildContext context, MapState state) async {
                  //GO TO USER LOCATION
                  if (state is MapGetCurrentLocationState) {
                    locationName = state.locationName;
                    googleMapController?.animateCamera(
                        CameraUpdate.newLatLngZoom(
                            LatLng(state.userLocation.latitude,
                                state.userLocation.longitude),
                            10));
                  }

                  //Add drivers markers to the map
                  if (state is MapGetDriversMarkerState) {
                    Navigator.pop(context);
                    for (var marker in state.driverModelList) {
                      driversMarker.add(Marker(
                          markerId: MarkerId((marker.userId.toString())),
                          position: LatLng(marker.lat!, marker.lng!),
                          icon: await BitmapDescriptor.fromAssetImage(
                              const ImageConfiguration(),
                              "assets/images/markerX3.png"),
                          onTap: () {
                            print(marker.userId);

                            print(marker.lat!);
                            print(marker.lng!);
                            print("marker.lng!");

                            showOrderBottomSheet(
                                context: context,
                                currentLocation: locationName,
                                destination: '',
                                cartID: marker.cartID!,
                                driverID: marker.userId!);
                          }));
                    }
                  }

                  //filter drivers markers on the map
                  if (state is MapFilterDriversMarkerState) {
                    context.mounted ? Navigator.pop(context) : const SizedBox();
                    if (state.driverModelList.isNotEmpty) {
                      for (var marker in state.driverModelList) {
                        driversMarker.clear();
                        driversMarker.add(Marker(
                            markerId: MarkerId((marker.userId.toString())),
                            position: LatLng(marker.lat!, marker.lng!),
                            icon: await BitmapDescriptor.fromAssetImage(
                                const ImageConfiguration(),
                                "assets/images/markerX3.png"),
                            onTap: () {
                              showOrderBottomSheet(
                                  context: context,
                                  currentLocation: locationName,
                                  destination: '',
                                  cartID: marker.cartID!,
                                  driverID: marker.userId!);
                            }));
                      }
                    } else {
                      driversMarker.clear();
                    }
                  }

                  if (context.mounted) {
                    state is MapLoadingState
                        ? showLoadingDialog(context: context)
                        : const SizedBox();
                  }
                },
              ),
            ),
            Positioned(
                child: Padding(
              padding: EdgeInsets.only(
                top: 30.sp,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldSearch(
                    fun: () => _scaffoldKey.currentState!.openDrawer(),
                  ),
                ],
              ),
            )
                //     // child: TextFieldSearch(
                //     //   fun: () => _scaffoldKey.currentState!.openDrawer(),
                //     // ),
                ),
          ],
        ),
      ),
    );
  }
}
