import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/widgets/order_bottom_sheet.dart';

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
      body: Stack(
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
          ElevatedButton(
              onPressed: () async {
                await MurnyApi().profile(
                    function: Profile.getProfile,
                    body: {
                      "sent_to": "6ab8e1cb-9c92-4b4d-af59-a1ba0f51c2fa",
                      "message": "hiii"
                    },
                    token:
                        'eyJhbGciOiJIUzI1NiIsImtpZCI6IkVxWFhIZWpzSzdVSXFFRUYiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNzAzNDM0NDMzLCJpYXQiOjE3MDM0MzA4MzMsImlzcyI6Imh0dHBzOi8vdndzZmRnZGdyc2tpdGdhdHhqYXAuc3VwYWJhc2UuY28vYXV0aC92MSIsInN1YiI6ImZmZjIxZjA2LWI4MmUtNGIwNC1hMTU5LWVmZjY4NDZkYmIyYyIsImVtYWlsIjoiZGV6eWtvd2lAdHV0dWFwcC5iaWQiLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7InR5cGUiOiJ1c2VyIn0sInJvbGUiOiJhdXRoZW50aWNhdGVkIiwiYWFsIjoiYWFsMSIsImFtciI6W3sibWV0aG9kIjoib3RwIiwidGltZXN0YW1wIjoxNzAzNDMwODMzfV0sInNlc3Npb25faWQiOiI4NDhmZGFjNy0zZDRmLTRmNDktODBiZS1jMGRkYjBjNDE2MTMifQ.H-ZQQ1QoWW12Hvd0kPbHL4UxS27zQAuWXS6UDHF39qU');
              },
              child: const Text("Button"))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const OrderBottomSheet(),
    );
  }
}
