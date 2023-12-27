import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/extentions/email_validator.dart';

import '../../models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    //

    on<AuthRegisterUserEvent>((event, emit) async {
      emit(LoadingState());
      if (event.email.trim().isEmpty) {
        emit(AuthRegisterErrorState(errorMsg: "Please Enter Your Email"));
      } else if (!event.email.trim().isValidEmail()) {
        emit(AuthRegisterErrorState(errorMsg: "Please Enter a Valid Email"));
      } else if (event.password.isEmpty) {
        emit(AuthRegisterErrorState(errorMsg: "Please Enter Your Password"));
      } else if (event.password.trim().length < 6) {
        emit(AuthRegisterErrorState(
            errorMsg: "Password Must be Greater Than 6 characters"));
      } else if (event.phone.isEmpty) {
        emit(
            AuthRegisterErrorState(errorMsg: "Please Enter Your Phone Number"));
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
          emit(AuthRegisterErrorState(errorMsg: response.toString()));
        }
      }
    });

    on<AuthRegisterDriverEvent>((event, emit) async {
      emit(LoadingState());
      if (event.email.trim().isEmpty) {
        emit(AuthRegisterErrorState(errorMsg: "Please Enter Your Email"));
      } else if (!event.email.trim().isValidEmail()) {
        emit(AuthRegisterErrorState(errorMsg: "Please Enter a Valid Email"));
      } else if (event.password.isEmpty) {
        emit(AuthRegisterErrorState(errorMsg: "Please Enter Your Password"));
      } else if (event.password.trim().length < 6) {
        emit(AuthRegisterErrorState(
            errorMsg: "Password Must be Greater Than 6 characters"));
      } else if (event.phone.isEmpty) {
        emit(
            AuthRegisterErrorState(errorMsg: "Please Enter Your Phone Number"));
      } else {
        final response = await MurnyApi().signIn(body: {
          "email": event.email,
          "password": event.password,
          "phone": event.phone,
          "name": event.userName,
          "gender": event.gender.toLowerCase() == "male" ? true : false,
          "city": event.city,
          "license": ""
        }, function: Auth.userSignUp);

        if (response) {
          await MurnyApi().profile(
              body: {"license": event.license},
              function: Profile.uploadDriverLicense,
              token: response.token);
          emit(AuthRegisterSuccessState());
        } else {
          emit(AuthRegisterErrorState(errorMsg: response.toString()));
        }
      }
    });

    on<AuthOTPEvent>((event, emit) async {
      emit(LoadingState());
      if (event.email.trim().isEmpty) {
        emit(AuthLoginErrorState(errorMsg: "Please Enter Your Email"));
      } else if (event.otp.isEmpty) {
        emit(AuthLoginErrorState(
            errorMsg: "Please Enter the OTP Sent to The email ${event.email}"));
      } else {
        final response = await MurnyApi().signIn(body: {
          "email": event.email,
          "otp": event.otp,
        }, function: Auth.signIn);

        if (response) {
          emit(AuthLoginSuccessState());
        } else {
          emit(
              AuthLoginErrorState(errorMsg: "Email or Password are incorrect"));
        }
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
