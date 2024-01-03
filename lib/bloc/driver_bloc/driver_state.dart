part of 'driver_cubit.dart';

abstract class DriverState {}

class DriverInitial extends DriverState {}

class DriverInfoState extends DriverState {
  final DriverModel driverModel;

  DriverInfoState({required this.driverModel});
}
