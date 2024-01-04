import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/method/show_order_bottom_sheet.dart';
import 'package:murny_final_project/models/auth_model.dart';

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

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: BlocConsumer<MapBloc, MapState>(
        builder: (context, state) {
          return GoogleMap(
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
            onLongPress: (location) async {},
          );

          //Check last order state
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
                        markerInfo: marker,
                        user: user);
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
                          markerInfo: marker,
                          user: user);
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
