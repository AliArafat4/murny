import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/text_field_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GoogleMapSearchBar extends StatelessWidget {
  const GoogleMapSearchBar({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30.sp,
      right: 10.sp,
      child: TextFieldSearch(
        fun: () => _scaffoldKey.currentState!.openDrawer(),
      ),
    );
  }
}
