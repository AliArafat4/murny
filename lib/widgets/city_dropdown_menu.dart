import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/dropdownlist_bloc/cubit/dropdownlist_cubit.dart';

class CityDropDownMenu extends StatelessWidget {
  const CityDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 42),
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
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 400,
                  right: MediaQuery.of(context).size.width / 32),
              dropdownColor: const Color(0xff252C63),
              style: const TextStyle(color: Colors.white),
              iconEnabledColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              value: state is SelectCityState ? state.selectCity : 'الرياض',
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

var items = ["الرياض", "جدة", "الدمام", "الخبر", "رابغ", "جيزان"];
