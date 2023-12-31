import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:murny_final_project/bloc/card_bloc/cubit/card_cubit.dart';
import 'package:murny_final_project/bloc/dropdownlist_bloc/cubit/dropdownlist_cubit.dart';
import 'package:murny_final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/bloc/public_bloc/public_cubit.dart';
import 'package:murny_final_project/bloc/radiobutton_bloc/cubit/radiobutton_cubit.dart';
import 'package:murny_final_project/bloc/segment_bloc/cubit/segment_cubit.dart';
import 'package:murny_final_project/bloc/select_cart_bloc/select_cart_cubit.dart';
import 'package:murny_final_project/bloc/token_bloc/check_token_cubit.dart';
import 'package:murny_final_project/screens/add_credit_card/add_credit_card.dart';
import 'package:murny_final_project/screens/balance/balance_add.dart';
import 'package:murny_final_project/screens/balance/balance_home.dart';
import 'package:murny_final_project/screens/balance/payment_type.dart';
import 'package:murny_final_project/screens/chat/chat_screen.dart';
import 'package:murny_final_project/screens/contactWithUs/contact_with_us_screen.dart';
import 'package:murny_final_project/screens/create_driver/create_driver_account_screen.dart';
import 'package:murny_final_project/screens/editAccount/edit_account_screen.dart';
import 'package:murny_final_project/screens/home.dart';
import 'package:murny_final_project/screens/home/home_screen.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_in_screen.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_up_screen.dart';
import 'package:murny_final_project/screens/splash_screen/splash_signIn_signUp_screen.dart';

import 'package:murny_final_project/bloc/user_bloc/user_cubit.dart';
import 'package:murny_final_project/l10n/10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:murny_final_project/screens/splash_screen/splash_screen.dart';
import 'bloc/profile_bloc/profile_bloc.dart';
import 'local_storage/shared_prefrences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<MapBloc>(
                create: (context) => MapBloc()), //..add(MapGetCurrentLocationEvent())
            BlocProvider<CheckTokenCubit>(create: (context) => CheckTokenCubit()),
            BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
            BlocProvider<SegmentCubit>(create: (context) => SegmentCubit()),
            BlocProvider<DropdownlistCubit>(create: (context) => DropdownlistCubit()),
            BlocProvider<RadiobuttonCubit>(create: (context) => RadiobuttonCubit()),
            BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
            BlocProvider<CardCubit>(create: (context) => CardCubit()),
            BlocProvider<PublicCubit>(create: (context) => PublicCubit()..getAllCartsCubit()),
            BlocProvider<SelectCartCubit>(create: (context) => SelectCartCubit()),
            BlocProvider<UserCubit>(create: (context) => UserCubit()),
          ],
          child: MaterialApp(

            locale: const Locale('en'),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          ));
    });
  }
}
