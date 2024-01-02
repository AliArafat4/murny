import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'order_state_state.dart';

class OrderStateCubit extends Cubit<OrderStateState> {
  OrderStateCubit() : super(OrderStateInitial());

  checkOrderState({required String orderState}) {
    print("orderState");
    print(orderState);
    if (orderState.toUpperCase() == "CANCELED" ||
        orderState.toUpperCase() == "DECLINED") {
      emit(OrderFilterState());
    } else if (orderState.toUpperCase() == "JUST CREATED") {
      emit(OrderWaitingState());
    } //SHOW WAITING LOADING
    else if (orderState.toUpperCase() == "ACCEPTED") {
      emit(OrderAcceptState());
    } //SHOW DRIVER IS COMING
    else {
      emit(OrderFilterState());
    }
  }
}
