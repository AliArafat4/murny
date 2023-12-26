import 'package:flutter/material.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SegmentControl extends StatefulWidget {
  SegmentControl(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.colorSelected});
  final String textOne;
  final String textTwo;
  final Color colorSelected;

  @override
  State<SegmentControl> createState() => _SegmentControlState();
}

class _SegmentControlState extends State<SegmentControl> {
  int? _currentSelection = 0;

  List<int> _disabledIndices = [];

  @override
  Widget build(BuildContext context) {
    return MaterialSegmentedControl(
        horizontalPadding: EdgeInsets.only(left: 50.sp, right: 20, top: 20.sp),
        children: {
          0: Text(widget.textOne),
          1: Text(widget.textTwo),
        },
        selectionIndex: _currentSelection,
        borderColor: const Color(0xff000000),
        selectedColor: widget.colorSelected,
        unselectedColor: Colors.white,
        selectedTextStyle:
            const TextStyle(color: Color(0xffFFFFFF), fontSize: 14),
        unselectedTextStyle:
            const TextStyle(color: Color(0xff000000), fontSize: 14),
        borderWidth: 0.7,
        borderRadius: 4.0,
        disabledChildren: _disabledIndices,
        verticalOffset: 3,
        onSegmentTapped: (index) {
          setState(() {
            _currentSelection = index;
          });
        });
  }
}
