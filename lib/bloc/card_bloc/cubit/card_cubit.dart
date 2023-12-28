import 'package:bloc/bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:meta/meta.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit() : super(CardInitial());

  updateCard(String cardNumber, String expiryDate, String cardHolderName,
      String cvvCode, bool isCvvFocused) {
    //  cardNumber = creditCardModel!.cardNumber;
    // expiryDate = creditCardModel.expiryDate;
    // cardHolderName = creditCardModel.cardHolderName;
    // cvvCode = creditCardModel.cvvCode;
    // isCvvFocused = creditCardModel.isCvvFocused;
  }
}
