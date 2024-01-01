import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/widgets/custom_divider.dart';
import 'package:murny_final_project/widgets/location_search.dart';
import 'package:murny_final_project/widgets/location_search_result.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final TextEditingController currentLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LocationSearch(),
            const CustomDivider(),
            Flexible(
              child: BlocBuilder<MapBloc, MapState>(
                buildWhen: (previous, current) => current is MapSearchState,
                builder: (context, state) {
                  return state is MapSearchState
                      ? ListView.builder(
                          itemCount: state.results.length,
                          itemBuilder: (context, index) {
                            return LocationSearchResult(
                              buildingName: state.results[index].name,
                              cityName:
                                  "${state.results[index].formattedAddress}",
                              place: state.results[index],
                            );
                          },
                        )
                      : const SizedBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
