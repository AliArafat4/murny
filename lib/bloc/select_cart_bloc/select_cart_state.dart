part of 'select_cart_cubit.dart';

@immutable
sealed class SelectCartState {}

final class SelectCartInitialState extends SelectCartState {}

final class SelectCartSwichState extends SelectCartState {
  final int selected;
  SelectCartSwichState({required this.selected});
}
