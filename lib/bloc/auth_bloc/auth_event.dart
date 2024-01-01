part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email, password;
  AuthLoginEvent({required this.email, required this.password});
}

class AuthOTPEvent extends AuthEvent {
  final String email, otp;
  AuthOTPEvent({required this.email, required this.otp});
}

class AuthResendOTPEvent extends AuthEvent {
  final String email;
  AuthResendOTPEvent({required this.email});
}

class AuthRegisterUserEvent extends AuthEvent {
  final String phone, email, password, userName; //, confirmPassword;

  AuthRegisterUserEvent({
    required this.phone,
    required this.email,
    required this.password,
    required this.userName,
    // required this.confirmPassword,
  });
}

class AuthRegisterDriverEvent extends AuthEvent {
  final String email,
      password,
      userName,
      // confirmPassword,
      phone,
      gender,
      city;
  final String /*Uint8List*/ license;

  AuthRegisterDriverEvent({
    required this.email,
    required this.password,
    required this.userName,
    // required this.confirmPassword,
    required this.gender,
    required this.phone,
    required this.license,
    required this.city,
  });
}

class AuthGetCurrentUserEvent extends AuthEvent {
  final String token;

  AuthGetCurrentUserEvent({required this.token});
}
