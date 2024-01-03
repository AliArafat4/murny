part of 'map_bloc.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class MapGetCurrentLocationState extends MapState {
  final LatLng userLocation;
  final String locationName;

  MapGetCurrentLocationState(
      {required this.locationName, required this.userLocation});
}

// class MapSetMarkersState extends MapState {
//   final List<Marker> userMarker;
//
//   MapSetMarkersState({required this.userMarker});
// }
//
// class MapResetMarkersState extends MapState {
//   final LatLng userLocation;
//
//   MapResetMarkersState({required this.userLocation});
// }

class MapGetMarkerLocationState extends MapState {
  final String location;

  MapGetMarkerLocationState({required this.location});
}

class MapGetDriversMarkerState extends MapState {
  final List<DriverModel> driverModelList;

  MapGetDriversMarkerState({required this.driverModelList});
}

class MapFilterDriversMarkerState extends MapState {
  final List<DriverModel> driverModelList;

  MapFilterDriversMarkerState({required this.driverModelList});
}

class MapLoadingState extends MapState {}

class MapSearchState extends MapState {
  final List<PlacesSearchResult> results;

  MapSearchState({required this.results});
}

class GetDestinationState extends MapState {
  final PlacesSearchResult destination;

  GetDestinationState({required this.destination});
}

class GetDestinationFromLongPressState extends MapState {
  final Placemark destination;

  GetDestinationFromLongPressState({required this.destination});
}
