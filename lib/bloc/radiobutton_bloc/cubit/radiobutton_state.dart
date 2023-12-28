part of 'radiobutton_cubit.dart';

@immutable
sealed class RadiobuttonState {}

final class RadiobuttonInitial extends RadiobuttonState {}

final class RadioButtonSignupSelectState extends RadiobuttonState {
  final int selected;
  RadioButtonSignupSelectState({required this.selected});
}
