import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:murny_final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/bloc/token_bloc/check_token_cubit.dart';
import 'package:murny_final_project/l10n/10n.dart';
import 'package:murny_final_project/screens/google_maps_screen.dart';
import 'package:murny_final_project/screens/home.dart';
import 'package:murny_final_project/screens/home/home_screen%20copy.dart';
import 'package:murny_final_project/screens/home/home_screen.dart';
import 'package:murny_final_project/screens/signIn_signUp/otp_screen.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_in_screen.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_up_screen.dart';
import 'package:murny_final_project/screens/splash_screen/splash_signIn_signUp_screen.dart';
import 'package:murny_final_project/screens/success/success.dart';
import 'package:murny_final_project/screens/success/success_message.dart';
import 'package:murny_final_project/screens/voice_search/search.dart';
import 'package:murny_final_project/screens/voice_search/voice_search.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:murny_final_project/screens/splash_screen/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'bloc/profile_bloc/profile_bloc.dart';
import 'local_storage/shared_prefrences.dart';

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
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
          providers: [
            BlocProvider<MapBloc>(
                create: (context) =>
                    MapBloc()..add(MapGetCurrentLocationEvent())),
            BlocProvider<CheckTokenCubit>(
                create: (context) => CheckTokenCubit()),
            BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
            BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
          ],
          child: MaterialApp(
            locale: Locale('en'),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            debugShowCheckedModeBanner: false,
            home: SignUpScreen(),
          ));
    });
  }
}
