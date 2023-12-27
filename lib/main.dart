import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/screens/add_credit_card/add_credit_card.dart';
import 'package:murny_final_project/screens/balance/balance_add.dart';
import 'package:murny_final_project/screens/balance/balance_home.dart';
import 'package:murny_final_project/screens/balance/payment_type.dart';
import 'package:murny_final_project/screens/create_driver/create_driver_account_screen.dart';
import 'package:murny_final_project/screens/google_maps_screen.dart';
import 'package:murny_final_project/screens/home.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_up_screen.dart';
import 'package:murny_final_project/screens/voice_search/search.dart';
import 'package:murny_final_project/screens/voice_search/voice_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'local_storage/shared_prefrences.dart';
import 'models/user_model.dart';

SharedPref pref = SharedPref();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await dotenv.load(fileName: ".env");

  await pref.initializePref();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: FIX, USE REQUEST
    final UserModel currentUser =
        UserModel.fromJson(jsonDecode(pref.getUser()));
    final convertedTime = DateTime.fromMillisecondsSinceEpoch(
        (currentUser.expiresAt ?? 0) * 1000);

    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<MapBloc>(
                create: (context) =>
                    MapBloc()..add(MapGetCurrentLocationEvent())),
          ],
          child: MaterialApp(
            locale: const Locale('ar'),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('ar'), // Arabic
            ],
            debugShowCheckedModeBanner: false,
            home: (convertedTime.compareTo(DateTime.now()) > 0)
                ? BalanceAddScreen()
                : BalanceAddScreen(),
          ));
    });
  }
}
