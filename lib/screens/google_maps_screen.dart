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

    List<Marker> userMarker = [];
    LatLng userLocation = const LatLng(0, 0);
    return Scaffold(
      body: Column(
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
                  onLongPress: (onPressedDestination) {
                    userMarker = [];
                    context.read<MapBloc>().add(
                        MapGetLocationEvent(location: onPressedDestination));
                  },
                  markers: state is MapSetMarkersState
                      ? Set.from(state.userMarker)
                      : Set.from(userMarker),
                  initialCameraPosition: CameraPosition(
                      target: state is MapGetCurrentLocationState
                          ? userLocation = state.userLocation
                          : userLocation),
                  onMapCreated: (GoogleMapController controller) {
                    googleMapController = controller;
                  },
                );
              },
              listener: (BuildContext context, MapState state) {
                state is MapSetMarkersState
                    ? userMarker.add(state.userMarker.first)
                    : const SizedBox();
                state is MapGetCurrentLocationState
                    ? userLocation = state.userLocation
                    : const SizedBox();
              },
            ),
          ),
          //TODO: ADD WIDGETS HERE
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButton: const OrderBottomSheet(),
    );
  }
}
