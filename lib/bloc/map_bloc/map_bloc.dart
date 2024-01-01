import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/models/driver_model.dart';
import 'package:murny_final_project/models/auth_model.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    final AuthModel currentUser = AuthModel.fromJson(jsonDecode(pref.getUser()));

    on<MapGetCurrentLocationEvent>((event, emit) async {
      try {
        if (await userPermission()) {
          await Geolocator.getCurrentPosition().then((currLocation) async {
            final currentLatLng = LatLng(currLocation.latitude, currLocation.longitude);
            List<Placemark> locationName =
                await placemarkFromCoordinates(currLocation.latitude, currLocation.longitude);
            emit(MapGetCurrentLocationState(
                userLocation: currentLatLng,
                locationName: "${locationName.first.name}, ${locationName.first.locality}"));
          });
        }
      } catch (err) {
        print(err);
      }
    });

    on<MapGetDriversMarkerEvent>((event, emit) async {
      emit(MapLoadingState());
      final List<DriverModel> driversList = await MurnyApi()
          .common(body: {}, function: Common.getDrivers, token: currentUser.token ?? "");
      print(driversList.first.name);
      emit(MapGetDriversMarkerState(driverModelList: driversList));
    });

    on<MapFilterDriversMarkerEvent>((event, emit) async {
      emit(MapLoadingState());
      final List<DriverModel> driversList = await MurnyApi().common(
          body: {'cart_id': event.cartTierID},
          function: Common.filterDrivers,
          token: currentUser.token ?? "");
      print(driversList);
      emit(MapFilterDriversMarkerState(driverModelList: driversList));
    });
  }
}

Future<bool> userPermission() async {
  LocationPermission permission;
  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    return false;
  } else {
    return true;
  }
}
