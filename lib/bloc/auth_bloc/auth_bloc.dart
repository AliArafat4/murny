import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/extentions/email_validator.dart';

import '../../models/auth_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    //

    on<AuthRegisterUserEvent>((event, emit) async {
      emit(LoadingState());
      if (event.email.trim().isEmpty) {
        emit(AuthUserRegisterErrorState(errorMsg: "Please Enter Your Email"));
      } else if (!event.email.trim().isValidEmail()) {
        emit(
            AuthUserRegisterErrorState(errorMsg: "Please Enter a Valid Email"));
      } else if (event.password.isEmpty) {
        emit(
            AuthUserRegisterErrorState(errorMsg: "Please Enter Your Password"));
      } else if (event.password.trim().length < 6) {
        emit(AuthUserRegisterErrorState(
            errorMsg: "Password Must be Greater Than 6 characters"));
      } else if (event.phone.isEmpty) {
        emit(AuthUserRegisterErrorState(
            errorMsg: "Please Enter Your Phone Number"));
      } else {
        final response = await MurnyApi().signIn(body: {
          "email": event.email,
          "password": event.password,
          "phone": event.phone,
          "name": event.userName
        }, function: Auth.userSignUp);

        if (response) {
          emit(AuthRegisterSuccessState());
        } else {
          emit(AuthUserRegisterErrorState(
              errorMsg:
                  "A user with this email address has already been registered"));
        }
      }
    });

    on<AuthRegisterDriverEvent>((event, emit) async {
      emit(LoadingState());
      if (event.email.trim().isEmpty) {
        emit(AuthDriverRegisterErrorState(errorMsg: "Please Enter Your Email"));
      } else if (!event.email.trim().isValidEmail()) {
        emit(AuthDriverRegisterErrorState(
            errorMsg: "Please Enter a Valid Email"));
      } else if (event.password.isEmpty) {
        emit(AuthDriverRegisterErrorState(
            errorMsg: "Please Enter Your Password"));
      } else if (event.password.trim().length < 6) {
        emit(AuthDriverRegisterErrorState(
            errorMsg: "Password Must be Greater Than 6 characters"));
      } else if (event.phone.isEmpty) {
        emit(AuthDriverRegisterErrorState(
            errorMsg: "Please Enter Your Phone Number"));
      } else {
        final response = await MurnyApi().signIn(body: {
          "email": event.email,
          "password": event.password,
          "phone": event.phone,
          "name": event.userName,
          "gender": event.gender.toLowerCase() == "male" ? true : false,
          "city": event.city,
          "license": ""
        }, function: Auth.driverSignUp);

        if (response) {
          await MurnyApi().profile(
              body: {"license": event.license},
              function: Profile.uploadDriverLicense,
              token: response.token);
          emit(AuthRegisterSuccessState());
        } else {
          emit(AuthDriverRegisterErrorState(errorMsg: response.toString()));
        }
      }
    });

    on<AuthOTPEvent>((event, emit) async {
      emit(LoadingState());
      if (event.email.trim().isEmpty) {
        emit(AuthOTPErrorState(errorMsg: "Please Enter Your Email"));
      } else if (event.otp.isEmpty) {
        emit(AuthOTPErrorState(
            errorMsg: "Please Enter the OTP Sent to The email ${event.email}"));
      } else {
        final response = await MurnyApi().signIn(body: {
          "email": event.email,
          "otp": event.otp,
        }, function: Auth.signIn);
        if (response) {
          emit(AuthOTPSuccessState());
        } else {
          emit(AuthOTPErrorState(errorMsg: "Email or Password are incorrect"));
        }
      }
    });

    on<AuthResendOTPEvent>((event, emit) async {
      emit(LoadingState());

      final response = await MurnyApi().signIn(body: {
        "email": event.email,
      }, function: Auth.resendOtp);

      if (response) {
        emit(AuthResendOTPSuccessState());
      } else {
        emit(AuthResendOTPErrorState(errorMsg: "error occurred"));
      }
    });

    on<AuthLoginEvent>((event, emit) async {
      emit(LoadingState());
      if (event.email.trim().isEmpty) {
        emit(AuthLoginErrorState(errorMsg: "Please Enter Your Email"));
      } else if (event.password.isEmpty) {
        emit(AuthLoginErrorState(errorMsg: "Please Enter Your Password"));
      } else {
        final response = await MurnyApi().signIn(body: {
          "email": event.email,
          "password": event.password,
        }, function: Auth.otp);
        print(response);

        if (response) {
          emit(AuthLoginSuccessState());
        } else {
          emit(
              AuthLoginErrorState(errorMsg: "Email or Password are incorrect"));
        }
      }
    });
  }
}
