import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_event.dart';
import 'package:murny_final_project/bloc/locale_bloc/locale_state.dart';
import 'package:murny_final_project/local_storage/shared_prefrences.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc()
      : super(GetLocaleState(Locale(SharedPref().getCurrentLocale()))) {
    on<ChangeLocaleEvent>((event, emit) {
      SharedPref().setLocale(event.languageCode);
      emit(LocaleUpdateState(Locale(event.languageCode)));
    });

    on<GetLocaleEvent>(
      (event, emit) async {
        final currentLocaleText = await SharedPref().getCurrentLocale();
        emit(GetLocaleState(Locale(currentLocaleText)));
      },
    );
  }
}
