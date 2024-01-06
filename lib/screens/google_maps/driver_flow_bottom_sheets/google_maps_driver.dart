import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murny_final_project/bloc/driver_bloc/driver_cubit.dart';
import 'package:murny_final_project/bloc/driver_map_bloc/map_bloc.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/models/auth_model.dart';

class GoogleMapDriverBody extends StatelessWidget {
  GoogleMapDriverBody({Key? key, required this.user}) : super(key: key);

  final AuthModel user;
  CameraPosition initialCameraPosition = const CameraPosition(target: LatLng(0, 0), zoom: 10);
  @override
  Widget build(BuildContext context) {
    GoogleMapController? googleMapController;
    List<Marker> location = [];

    Geolocator.getPositionStream().listen((Position newLocation) async {
      location.clear();
      location.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(newLocation.latitude, newLocation.longitude),
          icon: await BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(), "assets/images/markerX3.png")));
      if (context.mounted) {
        context.read<DriverMapBloc>().add(MapGetCurrentLocationEvent());
        context.read<DriverCubit>().getDriver(token: user.token ?? "", newLocation: newLocation);
      }
    });
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: BlocConsumer<DriverMapBloc, MapState>(
        builder: (context, state) {
          return Stack(
            children: [
              GoogleMap(
                compassEnabled: true,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal, // MapType.satellite,
                initialCameraPosition: initialCameraPosition,
                markers: Set.from(location),
                onMapCreated: (GoogleMapController controller) {
                  googleMapController = controller;
                  context.read<DriverMapBloc>().add(MapGetCurrentLocationEvent());
                },
              ),
            ],
          );
        },
        listener: (BuildContext context, MapState state) async {
          //GO TO USER LOCATION
          if (state is MapGetCurrentLocationState) {
            googleMapController?.animateCamera(CameraUpdate.newLatLngZoom(
                LatLng(state.userLocation.latitude, state.userLocation.longitude), 20));
          }

          //show loading dialog on the map
          if (context.mounted) {
            state is MapLoadingState ? showLoadingDialog(context: context) : const SizedBox();
          }
        },
      ),
    );
  }
}
