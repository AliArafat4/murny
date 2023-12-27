import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/models/user_model.dart';
import 'dart:convert';
import 'package:murny_final_project/main.dart';

part 'check_token_state.dart';

class CheckTokenCubit extends Cubit<CheckTokenState> {
  CheckTokenCubit() : super(CheckTokenInitial());

  checkTokenValidity() async {
    final UserModel currentUser =
        UserModel.fromJson(jsonDecode(pref.getUser()));

    if (currentUser.token == null) {
      return false;
    } else {
      final response = await MurnyApi().common(
          body: {}, function: Common.getOrder, token: currentUser.token!);
      if (response == false) {
        return response;
      }
    }
  }
}
