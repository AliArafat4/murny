import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'public_state.dart';

class PublicCubit extends Cubit<PublicState> {
  PublicCubit() : super(PublicInitial());
}
