import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/extentions/size_extention.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/method/show_order_bottom_sheet.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/screens/google_maps/components/filter_bottom_sheet.dart';
import 'package:murny_final_project/screens/google_maps/components/google_map_body.dart';
import 'package:murny_final_project/screens/home/home_screen.dart';
import 'package:murny_final_project/widgets/text_field_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final AuthModel user = AuthModel.fromJson(jsonDecode(pref.getUser()));
    return Scaffold(
      drawer: const CustomDrawer(),
      key: scaffoldKey,
      body: SafeArea(
          child: user.userType == "user"
              ? Stack(
                  children: [
                    GoogleMapBody(user: user),
                    GoogleMapSearchBar(scaffoldKey: scaffoldKey),
                  ],
                )
              : const CircularProgressIndicator() // TODO: DRIVER FLOW,
          ),
    );
  }
}

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
