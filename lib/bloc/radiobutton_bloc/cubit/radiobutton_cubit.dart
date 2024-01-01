import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:murny_final_project/screens/balance/payment_type.dart';

part 'radiobutton_state.dart';

class RadiobuttonCubit extends Cubit<RadiobuttonState> {
  RadiobuttonCubit() : super(RadiobuttonInitial());

  radiobuttonSignup({required int selectedType}) {
    int choice;

    switch (selectedType) {
      case 0:
        choice = 1;
        break;
      case 1:
        choice = 0;
        break;

      default:
        choice = 1;
    }

    emit(RadioButtonSignupSelectState(selected: choice));
  }

  radiobuttonGender({required String selectedType}) {
    emit(RadioButtonGenderSelectState(selected: selectedType));
  }

  radiobuttonPayment({required Payment selectedType}) {
    emit(RadioButtonPaymentSelectState(selected: selectedType));
  }
}
