import 'package:flutter/material.dart';

class LocationSearchResult extends StatelessWidget {
  LocationSearchResult(
      {super.key, required this.buildingName, required this.cityName});
  final String buildingName;
  final String cityName;
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
