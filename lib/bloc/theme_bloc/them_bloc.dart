import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_.state.dart';
import 'package:murny_final_project/bloc/theme_bloc/them_event.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';
import 'package:murny_final_project/theme/app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(GetThemeState(appThemeMap[SharedPref().getCurrentTheme()])) {
    on<ChangeThemeEvent>((event, emit) {
      SharedPref().setTheme(event.themeText);
      emit(GetThemeState(appThemeMap[event.themeText]));
    });
    on<GetThemeEvent>(
      (event, emit) async {
        final currentThemeText = await SharedPref().getCurrentTheme();
        emit(GetThemeState(appThemeMap[currentThemeText]));
      },
    );
  }
}
