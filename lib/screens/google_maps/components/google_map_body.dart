import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/extentions/size_extention.dart';
import 'package:murny_final_project/method/alert_snackbar.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/method/show_order_bottom_sheet.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/models/order_model.dart';
import 'package:murny_final_project/screens/google_maps/components/filter_bottom_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;

class GoogleMapBody extends StatelessWidget {
  GoogleMapBody({Key? key, required this.user}) : super(key: key);

  final AuthModel user;
  final List<Marker> driversMarker = [];
  String locationName = "";
  String destination = "";

  CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(0, 0), zoom: 10);
  Map<PolylineId, Polyline> distance = {};
  @override
  Widget build(BuildContext context) {
    GoogleMapController? googleMapController;

    return SizedBox(
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
              onLongPress: (location) async {
                // context.read<MapBloc>().add(GetDestinationFromLongPressEvent(
                //     location: LatLng(location.latitude, location.longitude)));
                // state is GetDestinationFromLongPressState
                //     ? showSuccessSnackBar(
                //         context, "Location selected ${state.destination.name}")
                //     : const SizedBox();
                // TODO: SIGN OUT
                // MurnyApi().signOut(context: context);
              },
            ),

            //TODO: CHECK LAST ORDER STATE
            panel: BottomSheetStates(user: user),

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
            googleMapController?.animateCamera(CameraUpdate.newLatLngZoom(
                LatLng(
                    state.userLocation.latitude, state.userLocation.longitude),
                10));
          }
          if (state is GetDestinationState) {
            destination = state.destination.name;
          }
          // if (state is GetDestinationFromLongPressState) {
          //   destination = state.destination.name!;
          // }

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
                    showOrderBottomSheet(
                        context: context,
                        currentLocation: locationName,
                        destination: destination,
                        // cartID: marker.cartID!,
                        // driverID: marker.userId!,
                        markerInfo: marker);
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
                          destination: destination,
                          // cartID: marker.cartID!,
                          // driverID: marker.userId!,
                          markerInfo: marker);
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
    );
  }
}

class BottomSheetStates extends StatelessWidget {
  const BottomSheetStates({
    super.key,
    required this.user,
  });

  final AuthModel user;
  Stream<http.Response> getOrders() async* {
    final uri =
        Uri.parse("https://murny-api.onrender.com/common/get_user_order");

    yield* Stream.periodic(const Duration(seconds: 5), (_) {
      return http.get(uri, headers: {"token": user.token ?? ""});
    }).asyncMap((event) async => await event);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: null,
        stream: getOrders(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List respones = jsonDecode(snapshot.data!.body);
            print("respones");
            print(respones.length);
            print(respones.last);
            final OrderModel lastOrder = OrderModel.fromJson(respones.last);
            return (lastOrder.orderState!.toUpperCase() == "CANCELED" ||
                    lastOrder.orderState!.toUpperCase() == "DECLINED")
                ? const FilterSheet()
                : (lastOrder.orderState!.toUpperCase() == "JUST CREATED")
                    ? const Text("JUST CREATED") // TODO: SHOW ORDER LOADING
                    : (lastOrder.orderState!.toUpperCase() == "ACCEPTED")
                        ? const Text(
                            "ACCEPTED") // TODO: SHOW DRIVING IS COMING OR NOTHING
                        : const SizedBox(); // TODO: SHOW ??
          } else {
            return const Center(child: LinearProgressIndicator());
          }
        });
  }
}
