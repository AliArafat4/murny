import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/models/driver_model.dart';
import 'package:murny_final_project/models/auth_model.dart';

part 'map_event.dart';
part 'map_state.dart';

class DriverMapBloc extends Bloc<MapEvent, MapState> {
  DriverMapBloc() : super(MapInitial()) {
    final AuthModel currentUser =
        AuthModel.fromJson(jsonDecode(pref.getUser()));

    on<MapGetCurrentLocationEvent>((event, emit) async {
      try {
        if (await userPermission()) {
          await Geolocator.getCurrentPosition().then((currLocation) async {
            final currentLatLng =
                LatLng(currLocation.latitude, currLocation.longitude);
            List<Placemark> locationName = await placemarkFromCoordinates(
                currLocation.latitude, currLocation.longitude);
            emit(MapGetCurrentLocationState(
                userLocation: currentLatLng,
                locationName:
                    "${locationName.first.name}, ${locationName.first.locality}"));
          });
        }
      } catch (err) {
        print(err);
      }
    });

    on<MapGetDriversMarkerEvent>((event, emit) async {
      emit(MapLoadingState());
      final List<DriverModel> driversList = await MurnyApi().common(
          body: {},
          function: Common.getDrivers,
          token: currentUser.token ?? "");
      print(driversList.first.name);
      emit(MapGetDriversMarkerState(driverModelList: driversList));
    });

    on<GetDestinationEvent>((event, emit) async {
      emit(GetDestinationState(destination: event.place));
    });

    on<GetDestinationFromLongPressEvent>((event, emit) async {
      emit(MapLoadingState());
      List<Placemark> locationName = await placemarkFromCoordinates(
          event.location.latitude, event.location.longitude);

      emit(GetDestinationFromLongPressState(destination: locationName.first));
    });

    on<MapSearchEvent>((event, emit) async {
      final places = GoogleMapsPlaces(apiKey: dotenv.env['GoogleMapsApiKey']);
      PlacesSearchResponse response =
          await places.searchByText(event.searchedText, radius: 500);

      print(response.status);
      print(response.errorMessage);
      print(response.results.first.name);
      emit(MapSearchState(results: response.results));
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
