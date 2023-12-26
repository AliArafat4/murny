import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/models/driver_model.dart';
import 'package:murny_final_project/models/user_model.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    final UserModel currentUser =
        UserModel.fromJson(jsonDecode(pref.getUser()));

    on<MapGetCurrentLocationEvent>((event, emit) async {
      try {
        // do {
        if (await userPermission()) {
          await Geolocator.getCurrentPosition().then((currLocation) {
            final currentLatLng =
                LatLng(currLocation.latitude, currLocation.longitude);
            emit(MapGetCurrentLocationState(userLocation: currentLatLng));
          });
        }
        // } while (!await userPermission());
      } catch (err) {
        print(err);
      }
    });

    // on<MapResetMarkersEvent>((event, emit) async {
    //   final userLocation = await Geolocator.getCurrentPosition();
    //   emit(MapResetMarkersState(
    //       userLocation: LatLng(userLocation.latitude, userLocation.longitude)));
    // });

    on<MapGetMarkerLocationEvent>((event, emit) async {
      final location = await geocoding.placemarkFromCoordinates(
          localeIdentifier: "en",
          event.marker.position.latitude,
          event.marker.position.longitude);

      emit(MapGetMarkerLocationState(
          location:
              "${location.first.country},${location.first.name},${location.first.street}"));
    });
    on<MapGetDriversMarkerEvent>((event, emit) async {
      final List<DriverModel> driversList = await MurnyApi().common(
          body: {},
          function: Common.getDrivers,
          token: currentUser.token ?? "");

      emit(MapGetDriversMarkerState(driverModelList: driversList));
    });
  }
}

Future<bool> userPermission() async {
  LocationPermission permission;
  permission = await Geolocator.checkPermission();
  print(permission);
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    return false;
  } else {
    return true;
  }
}

calculateDistance(
    {required LatLng userLocation, required LatLng driverLocation}) async {
  if (await userPermission()) {
    GoogleMapPolyline googleMapPolyline =
        GoogleMapPolyline(apiKey: "AIzaSyA5DlFq4L9onyOBAeXU77hRqE_U--38PXM");
    final result = await googleMapPolyline.getCoordinatesWithLocation(
        origin: LatLng(userLocation.latitude, userLocation.longitude),
        destination: LatLng(driverLocation.latitude, driverLocation.longitude),
        mode: RouteMode.driving);
    print(result);
    // PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates();
  }
}
