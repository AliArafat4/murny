import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:murny_final_project/bloc/card_bloc/cubit/card_cubit.dart';
import 'package:murny_final_project/bloc/check_box_bloc/cubit/checkbox_cubit.dart';
import 'package:murny_final_project/bloc/checkfillOTP_bloc/cubit/checkfill_otp_cubit.dart';
import 'package:murny_final_project/bloc/dropdownlist_bloc/cubit/dropdownlist_cubit.dart';
import 'package:murny_final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:murny_final_project/bloc/image_bloc/image_bloc_bloc.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_bloc.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_state.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/bloc/order_state_bloc/order_state_cubit.dart';
import 'package:murny_final_project/bloc/public_bloc/public_cubit.dart';
import 'package:murny_final_project/bloc/radiobutton_bloc/cubit/radiobutton_cubit.dart';
import 'package:murny_final_project/bloc/segment_bloc/cubit/segment_cubit.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_.state.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_bloc.dart';
import 'package:murny_final_project/bloc/select_cart_bloc/select_cart_cubit.dart';
import 'package:murny_final_project/bloc/token_bloc/check_token_cubit.dart';
import 'package:murny_final_project/bloc/upload_licen_bloc/upload_licen_bloc_bloc.dart';
import 'package:murny_final_project/bloc/user_bloc/user_cubit.dart';
import 'package:murny_final_project/l10n/10n.dart';
import 'package:murny_final_project/screens/splash_screen/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/profile_bloc/profile_bloc.dart';
import 'local_storage/shared_prefrences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

SharedPref pref = SharedPref();

late SharedPreferences prefs;
Locale? currentLocle;
ThemeData? theme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  await dotenv.load(fileName: ".env");

  await pref.initializePref();
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
            BlocProvider<MapBloc>(
                create: (context) =>
                    MapBloc()), //..add(MapGetCurrentLocationEvent())),
            BlocProvider<CheckTokenCubit>(
                create: (context) => CheckTokenCubit()),

            BlocProvider<OrderStateCubit>(
                create: (context) => OrderStateCubit()),

            BlocProvider<ProfileBloc>(
                create: (context) =>
                    ProfileBloc()..add(ProfileGetCurrentUserEvent())),

            BlocProvider<SegmentCubit>(create: (context) => SegmentCubit()),
            BlocProvider<DropdownlistCubit>(
                create: (context) => DropdownlistCubit()),
            BlocProvider<RadiobuttonCubit>(
                create: (context) => RadiobuttonCubit()),
            BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
            BlocProvider<CardCubit>(create: (context) => CardCubit()),
            BlocProvider<PublicCubit>(
                create: (context) => PublicCubit()..getAllCartsCubit()),
            BlocProvider<SelectCartCubit>(
                create: (context) => SelectCartCubit()),
            BlocProvider<UserCubit>(create: (context) => UserCubit()),
            BlocProvider<CheckfillOtpCubit>(
                create: (context) => CheckfillOtpCubit()),
            BlocProvider(create: (context) => ThemeBloc()),

            BlocProvider<CheckboxCubit>(create: (context) => CheckboxCubit()),

            BlocProvider(create: (context) => ImageBloc()),
            BlocProvider(create: (context) => LocaleBloc()),
            BlocProvider(create: (context) => UploadLicenBloc()),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
            if (state is GetThemeState) {
              theme = state.themeData;
              return BlocBuilder<LocaleBloc, LocaleState>(
                builder: (context, state) {
                  if (state is GetLocaleState) {
                    currentLocle = state.locale;
                  }
                  return MaterialApp(
                      theme: theme,
                      locale: currentLocle,
                      localizationsDelegates: const [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: L10n.all,
                      debugShowCheckedModeBanner: false,
                      home: const SplashScreen());
                },
              );
            } else {
              return Container();
            }
          }));
    });
  }
}
