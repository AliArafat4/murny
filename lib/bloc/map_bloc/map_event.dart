part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class MapGetLocationEvent extends MapEvent {
  final LatLng location;
  MapGetLocationEvent({required this.location});
}

class MapGetCurrentLocationEvent extends MapEvent {}

class MapGetMarkerLocationEvent extends MapEvent {
  final Marker marker;

  MapGetMarkerLocationEvent({required this.marker});
}

class MapResetMarkersEvent extends MapEvent {}

class MapGetDriversMarkerEvent extends MapEvent {}

class MapSearchEvent extends MapEvent {
  final String searchedText;

  MapSearchEvent({required this.searchedText});
}

class MapFilterDriversMarkerEvent extends MapEvent {
  final String cartTierID;

  MapFilterDriversMarkerEvent({required this.cartTierID});
}

class GetDestinationEvent extends MapEvent {
  final PlacesSearchResult place;

  GetDestinationEvent({required this.place});
}

class GetDestinationFromLongPressEvent extends MapEvent {
  final LatLng location;

  GetDestinationFromLongPressEvent({required this.location});
}
