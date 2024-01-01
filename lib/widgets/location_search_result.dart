import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';

class LocationSearchResult extends StatelessWidget {
  const LocationSearchResult(
      {super.key,
      required this.buildingName,
      required this.cityName,
      required this.place});
  final String buildingName;
  final String cityName;
  final PlacesSearchResult place;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<MapBloc>().add(GetDestinationEvent(place: place));

        Navigator.pop(context);
      },
      child: ListTile(
        leading: const Icon(
          Icons.location_on,
          color: Color(0xff252C63),
        ),
        title: Text(buildingName),
        subtitle: Text(
          cityName,
          style: const TextStyle(
            color: Color(0xffB8B8B8),
          ),
        ),
      ),
    );
  }
}
