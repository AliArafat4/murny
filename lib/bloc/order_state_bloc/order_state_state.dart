part of 'order_state_cubit.dart';

@immutable
abstract class OrderStateState {}

class OrderStateInitial extends OrderStateState {}

class OrderWaitingState extends OrderStateState {}

class OrderAcceptState extends OrderStateState {}
class OrderFilterState extends OrderStateState {}
