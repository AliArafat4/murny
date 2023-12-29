import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_cart_state.dart';

class SelectCartCubit extends Cubit<SelectCartState> {
  SelectCartCubit() : super(SelectCartInitial());
}
