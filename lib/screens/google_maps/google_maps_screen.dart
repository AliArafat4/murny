import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/bloc/public_bloc/public_cubit.dart';
import 'package:murny_final_project/extentions/size_extention.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/method/show_main_bottom_sheet.dart';
import 'package:murny_final_project/method/show_order_bottom_sheet.dart';
import 'package:murny_final_project/screens/balance/payment_type.dart';
import 'package:murny_final_project/screens/google_maps/components/filter_bottom_sheet.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/golf_cart_detail.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Marker> driversMarker = [];
    String locationName = "";

    GoogleMapController? googleMapController;

    CameraPosition initialCameraPosition;
    initialCameraPosition = const CameraPosition(target: LatLng(0, 0), zoom: 10);
    Map<PolylineId, Polyline> distance = {};

    return Scaffold(
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
                        context.read<MapBloc>().add(MapGetCurrentLocationEvent());
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
                    panel: ("LAST ORDER " != "CANCELED OR NULL OR DECLINED")
                        ? const FilterSheet()
                        : ("LAST ORDER " == "JUST CREATED")
                            ? SizedBox() // TODO: SHOW ORDER LOADING
                            : ("LAST ORDER " == "ACCEPTED")
                                ? SizedBox() // TODO: SHOW DRIVING IS COMING OR NOTHING
                                : SizedBox(), // TODO: SHOW ??

                    maxHeight: ("LAST ORDER " != "ACCEPTED") ? context.getHeight(factor: 0.45) : 0,
                    // backdropEnabled: true,
                  );
                },
                listener: (BuildContext context, MapState state) async {
                  //GO TO USER LOCATION
                  if (state is MapGetCurrentLocationState) {
                    locationName = state.locationName;
                    googleMapController?.animateCamera(CameraUpdate.newLatLngZoom(
                        LatLng(state.userLocation.latitude, state.userLocation.longitude), 10));
                  }

                  //Add drivers markers to the map
                  if (state is MapGetDriversMarkerState) {
                    Navigator.pop(context);
                    for (var marker in state.driverModelList) {
                      driversMarker.add(Marker(
                          markerId: MarkerId((marker.userId.toString())),
                          position: LatLng(marker.lat!, marker.lng!),
                          icon: await BitmapDescriptor.fromAssetImage(
                              const ImageConfiguration(), "assets/images/markerX3.png"),
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
                                const ImageConfiguration(), "assets/images/markerX3.png"),
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
          ],
        ),
      ),
    );
  }
}
