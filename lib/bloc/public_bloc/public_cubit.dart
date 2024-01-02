import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/models/cart_model.dart';

part 'public_state.dart';

class PublicCubit extends Cubit<PublicState> {
  PublicCubit() : super(PublicInitial());

  getAllCartsCubit() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final carts = await MurnyApi().public(function: Public.getCarts, body: {});

    emit(PublicGetCartsState(cartModel: carts));
  }
}
