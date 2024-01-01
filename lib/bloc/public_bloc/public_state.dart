part of 'public_cubit.dart';

@immutable
abstract class PublicState {}

class PublicInitial extends PublicState {}

class PublicGetCartsState extends PublicState {
  final List<CartModel> cartModel;

  PublicGetCartsState({required this.cartModel});
}
