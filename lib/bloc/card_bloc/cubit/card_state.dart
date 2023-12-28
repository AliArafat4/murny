part of 'card_cubit.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

final class UpdateCardState extends CardState {
  final CreditCardModel creditCardModel;
  UpdateCardState({required this.creditCardModel});
}
