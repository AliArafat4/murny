import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:murny_final_project/screens/balance/payment_type.dart';

part 'radiobutton_state.dart';

class RadiobuttonCubit extends Cubit<RadiobuttonState> {
  RadiobuttonCubit() : super(RadiobuttonInitial());

  radiobuttonGender({required String selectedType}) {
    emit(RadioButtonGenderSelectState(selected: selectedType));
  }

  radiobuttonPayment({required Payment selectedType}) {
    emit(RadioButtonPaymentSelectState(selected: selectedType));
  }
}
