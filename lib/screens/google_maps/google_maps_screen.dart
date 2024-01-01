import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/google_map_body.dart';
import 'package:murny_final_project/screens/home/home_screen.dart';
import 'user_flow_bottom_sheets/google_maps_search.dart';

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
