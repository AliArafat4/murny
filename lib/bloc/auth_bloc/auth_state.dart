part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginSuccessState extends AuthState {}

class AuthLoginErrorState extends AuthState {
  final String errorMsg;
  AuthLoginErrorState({required this.errorMsg});
}

class AuthRegisterSuccessState extends AuthState {}

class AuthOTPSuccessState extends AuthState {}

class AuthDriverRegisterErrorState extends AuthState {
  final String errorMsg;
  AuthDriverRegisterErrorState({required this.errorMsg});
}

class AuthUserRegisterErrorState extends AuthState {
  final String errorMsg;
  AuthUserRegisterErrorState({required this.errorMsg});
}

class AuthOTPErrorState extends AuthState {
  final String errorMsg;
  AuthOTPErrorState({required this.errorMsg});
}

class LoadingState extends AuthState {}

class AuthGetCurrentUserState extends AuthState {
  final UserModel user;
  AuthGetCurrentUserState({required this.user});
}
