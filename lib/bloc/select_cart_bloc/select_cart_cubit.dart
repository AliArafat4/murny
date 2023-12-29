import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_cart_state.dart';

class SelectCartCubit extends Cubit<SelectCartState> {
  SelectCartCubit() : super(SelectCartInitialState());

  selectCart({required int selectedCart}) {
    emit(SelectCartSwichState(selected: selectedCart));
  }
}
