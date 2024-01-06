import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/models/driver_model.dart';

part 'driver_state.dart';

class DriverCubit extends Cubit<DriverState> {
  DriverCubit() : super(DriverInitial());

  getDriver({required String token, required Position newLocation}) async {
    final DriverModel driver =
        await MurnyApi().profile(body: {"gender": ""}, function: Profile.getProfile, token: token);
    await MurnyApi().profile(body: {
      "name": driver.name,
      'lat': newLocation.latitude,
      'lng': newLocation.longitude,
      'phone': driver.phone,
      'city': driver.city,
      'gender': driver.gender,
    }, function: Profile.updateDriverProfile, token: token);
    emit(DriverInfoState(driverModel: driver));
  }
}
