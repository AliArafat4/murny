part of 'checkbox_cubit.dart';

@immutable
sealed class CheckboxState {}

final class CheckboxInitial extends CheckboxState {}

final class CheckboxSignupSelectState extends CheckboxState {
  final bool selected;
  CheckboxSignupSelectState({required this.selected});
}
