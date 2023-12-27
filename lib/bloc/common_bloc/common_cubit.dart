import 'package:flutter_bloc/flutter_bloc.dart';

part 'common_state.dart';

class CommonCubit extends Cubit<CommonState> {
  CommonCubit() : super(CommonInitial());
}
