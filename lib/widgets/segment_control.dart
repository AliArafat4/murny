import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:murny_final_project/bloc/segment_bloc/cubit/segment_cubit.dart';
import 'package:murny_final_project/bloc/segment_bloc/cubit/segment_cubit.dart';
import 'package:murny_final_project/bloc/segment_bloc/cubit/segment_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../bloc/segment_bloc/cubit/segment_cubit.dart';

class SegmentControl extends StatelessWidget {
  const SegmentControl(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.colorSelected,
      //required this.isSegmentUser

      this.func});
  final String textOne;
  final String textTwo;
  final Color colorSelected;

  //final bool isSegmentUser;
  //TODO: make it required
  final void Function(int val)? func;

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return BlocBuilder<SegmentCubit, SegmentState>(
      builder: (context, state) {
        return MaterialSegmentedControl(
            horizontalPadding: currentLanguage == "ar"
                ? EdgeInsets.only(left: 50.sp, right: 20, top: 20.sp)
                : EdgeInsets.only(right: 50.sp, left: 20, top: 20.sp),
            children: {
              0: Text(textOne),
              1: Text(textTwo),
            },
            selectionIndex: state is SegmentSwichState ? state.type : 0,
            borderColor: const Color(0xff000000),
            selectedColor: colorSelected,
            unselectedColor: Colors.white,
            selectedTextStyle:
                const TextStyle(color: Color(0xffFFFFFF), fontSize: 14),
            unselectedTextStyle:
                const TextStyle(color: Color(0xff000000), fontSize: 14),
            borderWidth: 0.7,
            borderRadius: 4.0,
            disabledChildren: null,
            verticalOffset: 3,
            onSegmentTapped: (index) {
              func!.call(index);
              context.read<SegmentCubit>().switchSegment(selectedType: index);
            });
      },
    );
  }
}
