part of 'radiobutton_cubit.dart';

@immutable
sealed class RadiobuttonState {}

final class RadiobuttonInitial extends RadiobuttonState {}

final class RadioButtonSignupSelectState extends RadiobuttonState {
  final int selected;
  RadioButtonSignupSelectState({required this.selected});
}

final class RadioButtonGenderSelectState extends RadiobuttonState {
  final String selected;
  RadioButtonGenderSelectState({required this.selected});
}

final class RadioButtonPaymentSelectState extends RadiobuttonState {
  final Payment selected;
  RadioButtonPaymentSelectState({required this.selected});
}
