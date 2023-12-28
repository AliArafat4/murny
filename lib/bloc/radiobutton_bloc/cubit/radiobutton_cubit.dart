import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'radiobutton_state.dart';

class RadiobuttonCubit extends Cubit<RadiobuttonState> {
  RadiobuttonCubit() : super(RadiobuttonInitial());

  radiobuttonSignup({required int selectedType}) {
    emit(RadioButtonSignupSelectState(selected: selectedType));
  }
}
