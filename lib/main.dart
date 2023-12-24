import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/screens/google_maps_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await dotenv.load(fileName: ".env");

  prefs = await SharedPreferences.getInstance();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<MapBloc>(create: (context) => MapBloc()),
          ],
          child: MaterialApp(
            locale: const Locale('ar'),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar'), // Arabic
            ],
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return const Directionality(
                textDirection: TextDirection.rtl,
                child: GoogleMapScreen(),
              );
            },
          ));
    });
  }
}
