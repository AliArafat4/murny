import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/dropdownlist_bloc/cubit/dropdownlist_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CityDropDownMenu extends StatelessWidget {
  const CityDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String riyadh = AppLocalizations.of(context)!.riyadh;
    String jeddah = AppLocalizations.of(context)!.jeddah;
    String dammam = AppLocalizations.of(context)!.dammam;
    String alKhobar = AppLocalizations.of(context)!.alKhobar;
    String rabigh = AppLocalizations.of(context)!.rabigh;
    String jazan = AppLocalizations.of(context)!.jazan;

    var items = [riyadh, jeddah, dammam, alKhobar, rabigh, jazan];
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Padding(
      padding: currentLanguage == "ar"
          ? EdgeInsets.only(left: MediaQuery.of(context).size.width / 42)
          : EdgeInsets.only(right: MediaQuery.of(context).size.width / 42),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff252C63),
        ),
        width: MediaQuery.of(context).size.width / 3,
        height: MediaQuery.of(context).size.height / 16,
        child: BlocBuilder<DropdownlistCubit, DropdownlistState>(
          builder: (context, state) {
            return DropdownButton(
              padding: currentLanguage == "ar"
                  ? EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 400,
                      right: MediaQuery.of(context).size.width / 32)
                  : EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 400,
                      left: MediaQuery.of(context).size.width / 32),
              dropdownColor: const Color(0xff252C63),
              style: const TextStyle(color: Colors.white),
              iconEnabledColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              value: state is SelectCityState ? state.selectCity : items.first,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {
                context.read<DropdownlistCubit>().selectCity(city: newValue!);
              },
            );
          },
        ),
      ),
    );
  }
}





//var items = ["الرياض", "جدة", "الدمام", "الخبر", "رابغ", "جيزان"];
