import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/models/cart_model.dart';
import 'package:murny_final_project/models/driver_model.dart';

part 'get_by_id_state.dart';

class GetByIdCubit extends Cubit<GetByIdState> {
  GetByIdCubit() : super(GetByIdInitial());

  getCartByID({required String cartID}) async {
    CartModel cart =
        await MurnyApi().public(body: {"cart_id": cartID}, function: Public.getCartByID);

    emit(GetCartByIdSuccessState(getCartByID: cart));
  }

  getDriverByID({required String driverID, required String token}) async {
    DriverModel driver = await MurnyApi()
        .driver(body: {"driver_id": driverID}, function: Driver.getDriverByID, token: token);

    emit(GetDriverByIdSuccessState(getDriverByID: driver));
  }
}
