import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/models/auth_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  final AuthModel _currentUser = AuthModel.fromJson(jsonDecode(pref.getUser()));
  userPostOrder({
    required String driverId,
    required String locationFrom,
    required String locationTo,
    required int cartId,
    required String paymentMethod,
  }) async {
    emit(UserLoadingOrderState());

    await MurnyApi().user(body: {
      "driver_id": driverId,
      "location_from": locationFrom,
      "location_to": locationTo,
      "cart_id": cartId,
      "payment_method": paymentMethod,
    }, function: User.postUserOrder, token: _currentUser.token ?? "");

    emit(UserSuccessOrderState());
  }
}
