import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Marker> driversMarker = [];
    //TODO: USER PERMISSION
    // final isAllowed = await userPermission();
    // if (isAllowed) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) =>
    //           const GoogleMapScreen()));
    // }
    GoogleMapController? googleMapController;

    CameraPosition initialCameraPosition;
    initialCameraPosition =
        const CameraPosition(target: LatLng(0, 0), zoom: 10);
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
                  return GoogleMap(
                    compassEnabled: true,
                    mapToolbarEnabled: true,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    mapType: MapType.satellite, //MapType.normal,
                    polylines: Set<Polyline>.of(distance.values),
                    markers: Set.from(driversMarker),
                    initialCameraPosition: initialCameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      googleMapController = controller;
                      context.read<MapBloc>().add(MapGetDriversMarkerEvent());
                    },
                    onTap: (location) async {
                      // distance = await getPolyline(
                      //     userLocation: const LatLng(24.788661, 46.639270),
                      //     driverLocation: const LatLng(20.787648, 46.637006));
                      // print(distance.values);
                      // print("distance");
                      print("location");
                      print(location);
                    },
                  );
                },
                listener: (BuildContext context, MapState state) async {
                  //GO TO USER LOCATION
                  if (state is MapGetCurrentLocationState) {
                    googleMapController?.animateCamera(
                        CameraUpdate.newLatLngZoom(
                            LatLng(state.userLocation.latitude,
                                state.userLocation.longitude),
                            10));
                  } else {
                    context.read<MapBloc>().add(MapGetDriversMarkerEvent());
                  }

                  //Add drivers markers to the map
                  if (state is MapGetDriversMarkerState &&
                      driversMarker.length < state.driverModelList.length) {
                    for (var marker in state.driverModelList) {
                      var customIcon;

                      await BitmapDescriptor.fromAssetImage(
                              const ImageConfiguration(),
                              "assets/images/markerX3.png")
                          .then((d) {
                        customIcon = d;

                        Future.delayed(const Duration(seconds: 2));
                      });

                      driversMarker.add(Marker(
                          markerId: MarkerId((marker.id.toString())),
                          position: LatLng(marker.lat!, marker.lng!),
                          icon: customIcon,
                          onTap: () {
                            print(marker.lat!);
                            print(marker.lng!);
                            print("marker.lng!");

                          }));

                      print("driversMarker");
                      print(driversMarker);
                    }
                  }
                },
              ),
            ),
            //TODO: ADD WIDGETS HERE
          ],
        ),
      ),
    );
  }
}
