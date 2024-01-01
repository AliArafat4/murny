import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/extentions/size_extention.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/method/show_order_bottom_sheet.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/models/order_model.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/accepted_order_bottom_sheet.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/filter_bottom_sheet.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/user_waiting_bottom_sheet.dart';
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
  String orderState = "";
  @override
  Widget build(BuildContext context) {
    GoogleMapController? googleMapController;
    Stream<http.Response> getOrders() async* {
      final uri =
          Uri.parse("https://murny-api.onrender.com/common/get_user_order");

      yield* Stream.periodic(const Duration(seconds: 5), (_) {
        return http.get(uri, headers: {"token": user.token ?? ""});
      }).asyncMap((event) async => await event);
    }

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
              mapType: MapType.normal, // MapType.satellite,
              polylines: Set<Polyline>.of(distance.values),
              markers: Set.from(driversMarker),
              initialCameraPosition: initialCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
                context.read<MapBloc>().add(MapGetCurrentLocationEvent());
                context.read<MapBloc>().add(MapGetDriversMarkerEvent());
              },
              onLongPress: (location) async {
                // TODO: SIGN OUT
                // MurnyApi().signOut(context: context);
              },
            ),

            //Check last order state
            panel: StreamBuilder(
                stream: getOrders(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List response = jsonDecode(snapshot.data!.body);

                    print(response.length);
                    print(response.last);
                    final OrderModel lastOrder =
                        OrderModel.fromJson(response.last);
                    orderState = lastOrder.orderState!.toUpperCase();
                    return (lastOrder.orderState!.toUpperCase() == "CANCELED" ||
                            lastOrder.orderState!.toUpperCase() == "DECLINED")
                        ? const FilterSheet()
                        : (lastOrder.orderState!.toUpperCase() ==
                                "JUST CREATED")
                            ? UserWaitingBottomSheet(
                                order: lastOrder) //SHOW WAITING LOADING
                            : (lastOrder.orderState!.toUpperCase() ==
                                    "ACCEPTED")
                                ? AcceptedOrderBottomSheet(
                                    order: lastOrder) //SHOW DRIVER IS COMING
                                : const SizedBox();
                  } else {
                    return const LinearProgressIndicator();
                  }
                }),

            maxHeight: (orderState == "CANCELED" ||
                    orderState == "DECLINED" ||
                    orderState == "JUST CREATED")
                ? context.getHeight(factor: 0.45)
                : (orderState == "ACCEPTED")
                    ? context.getHeight(factor: 0.65)
                    : context.getHeight(factor: 0.65),
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
                          markerInfo: marker);
                    }));
              }
            } else {
              driversMarker.clear();
            }
          }

          //show loading dialog on the map
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
