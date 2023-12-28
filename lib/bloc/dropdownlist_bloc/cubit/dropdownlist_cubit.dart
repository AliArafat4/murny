import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dropdownlist_state.dart';

class DropdownlistCubit extends Cubit<DropdownlistState> {
  DropdownlistCubit() : super(DropdownlistInitial());

  selectCity({required String city}) {
    emit(SelectCityState(selectCity: city));
  }
}
