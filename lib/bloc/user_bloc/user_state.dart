part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserSuccessOrderState extends UserState {}

class UserErrorOrderState extends UserState {
  final String errMsg;

  UserErrorOrderState({required this.errMsg});
}

class UserLoadingOrderState extends UserState {}
