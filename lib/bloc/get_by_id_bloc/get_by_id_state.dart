part of 'get_by_id_cubit.dart';

@immutable
abstract class GetByIdState {}

class GetByIdInitial extends GetByIdState {}

class GetCartByIdSuccessState extends GetByIdState {
  final CartModel getCartByID;

  GetCartByIdSuccessState({required this.getCartByID});
}

class GetDriverByIdSuccessState extends GetByIdState {
  final DriverModel getDriverByID;

  GetDriverByIdSuccessState({required this.getDriverByID});
}
