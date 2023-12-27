import 'package:flutter_bloc/flutter_bloc.dart';

part 'driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(DriverInitial());
}
