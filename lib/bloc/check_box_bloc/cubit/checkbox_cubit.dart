import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'checkbox_state.dart';

class CheckboxCubit extends Cubit<CheckboxState> {
  CheckboxCubit() : super(CheckboxInitial());

  checkboxSignUp({required bool select}) {
    emit(CheckboxSignupSelectState(selected: select));
  }
}
