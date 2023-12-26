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

    List<Marker> driversMarker = [];
    CameraPosition initialCameraPosition;
    initialCameraPosition =
        const CameraPosition(target: LatLng(0, 0), zoom: 15);
    LatLng currentLocation = LatLng(0, 0);
    Polyline distance = Polyline(polylineId: PolylineId('0'));
    return Scaffold(
// <<<<<<< lujain
//       body: Column(
//         children: [
//           SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             child: BlocConsumer<MapBloc, MapState>(
//               builder: (context, state) {
//                 return GoogleMap(
//                   compassEnabled: true,
//                   mapToolbarEnabled: true,
//                   myLocationEnabled: true,
//                   myLocationButtonEnabled: true,
//                   mapType: MapType.satellite,
//                   onLongPress: (onPressedDestination) {
//                     userMarker = [];
//                     context.read<MapBloc>().add(
//                         MapGetLocationEvent(location: onPressedDestination));
//                   },
//                   markers: state is MapSetMarkersState
//                       ? Set.from(state.userMarker)
//                       : Set.from(userMarker),
//                   initialCameraPosition: CameraPosition(
//                       target: state is MapGetCurrentLocationState
//                           ? userLocation = state.userLocation
//                           : userLocation),
//                   onMapCreated: (GoogleMapController controller) {
//                     googleMapController = controller;
//                   },
//                 );
//               },
//               listener: (BuildContext context, MapState state) {
//                 state is MapSetMarkersState
//                     ? userMarker.add(state.userMarker.first)
//                     : const SizedBox();
//                 state is MapGetCurrentLocationState
//                     ? userLocation = state.userLocation
//                     : const SizedBox();
//               },
// =======
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
                    mapType: MapType.satellite,
                    polylines: {distance},
                    markers: Set.from(driversMarker),
                    initialCameraPosition: initialCameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      googleMapController = controller;
                      // context.read<MapBloc>().add(MapGetCurrentLocationEvent());

                      context.read<MapBloc>().add(MapGetDriversMarkerEvent());
                    },
                    onTap: (location) async {
                      print("distance1");

                      distance = await calculateDistance(
                          userLocation: currentLocation,
                          driverLocation: location);
                      print(distance);
                      print("distance");
                    },
                  );
                },
                listener: (BuildContext context, MapState state) {
                  print(state);
                  if (state is MapGetCurrentLocationState) {
                    currentLocation = LatLng(state.userLocation.latitude,
                        state.userLocation.longitude);
                    googleMapController?.animateCamera(
                        CameraUpdate.newLatLngZoom(
                            LatLng(state.userLocation.latitude,
                                state.userLocation.longitude),
                            15));
                  }

                  if (state is MapGetDriversMarkerState) {
                    for (var marker in state.driverModelList) {
                      driversMarker.add(Marker(
                          markerId: MarkerId((marker.id.toString())),
                          position: LatLng(marker.lat!, marker.lng!)));
                    }
                  }
                },
              ),
// >>>>>>> main
            ),
            //TODO: ADD WIDGETS HERE
            // ElevatedButton(
            //     onPressed: () async {
            //       final x = await MurnyApi().signIn(
            //           function: Auth.signIn,
            //           body: {"email": "dezykowi@tutuapp.bid", "otp": "549485"});
            //     },
            //     child: const Text("Button"))
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButton: const OrderBottomSheet(),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: const OrderBottomSheet(),

    );
  }
}
