import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget(
      {super.key, required this.hint, required this.controller});

  final String hint;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            hintText: hint,
            filled: true,
            fillColor: Colors.transparent,
            hintStyle: TextStyle(color: Color(0xffCDCED3))),
        controller: controller,
        onChanged: (val) {
          context.read<MapBloc>().add(MapSearchEvent(searchedText: val));
          print(val);
        },
      ),
    );
  }
}
