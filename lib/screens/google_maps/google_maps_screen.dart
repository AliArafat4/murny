import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/screens/google_maps/driver_drawer.dart';
import 'package:murny_final_project/screens/google_maps/driver_flow_bottom_sheets/drawer.dart';
import 'package:murny_final_project/screens/google_maps/user_drawer.dart';
import 'package:murny_final_project/screens/google_maps/driver_flow_bottom_sheets/google_maps_driver.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/order_state_stream.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/google_map_body.dart';
import 'driver_flow_bottom_sheets/driver_order_state_stream.dart';
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
      drawer: user.userType == "user" ? const UserDrawer() : const DriverDrawer(),
      key: scaffoldKey,

      body: SafeArea(
          child: user.userType == "user"
              //  USER FLOW,
              ? Stack(
                  children: [
                    GoogleMapBody(user: user),
                    GoogleMapSearchBar(scaffoldKey: scaffoldKey),
                    OrderStateStream(user: user),
                  ],
                )
              //  DRIVER FLOW,
              : Stack(
                  children: [
                    GoogleMapDriverBody(user: user),
                    DriverDrawerMaps(scaffoldKey: scaffoldKey),
                    DriverOrderStateStream(user: user),
                  ],
                )),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton:
    );
  }
}
