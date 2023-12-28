part of 'dropdownlist_cubit.dart';

@immutable
sealed class DropdownlistState {}

final class DropdownlistInitial extends DropdownlistState {}

final class SelectCityState extends DropdownlistState {
  final String selectCity;
  SelectCityState({required this.selectCity});
}
