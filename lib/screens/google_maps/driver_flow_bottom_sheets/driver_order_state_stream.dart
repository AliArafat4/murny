import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:murny_final_project/bloc/order_state_bloc/order_state_cubit.dart';
import 'package:murny_final_project/extentions/size_extention.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/models/order_model.dart';
import 'package:murny_final_project/models/profile_model.dart';
import 'package:murny_final_project/screens/google_maps/driver_flow_bottom_sheets/accept_deny_order_bottom_sheet.dart';
import 'package:murny_final_project/screens/google_maps/driver_flow_bottom_sheets/driver_response_bottom_sheet.dart';
import 'package:murny_final_project/screens/google_maps/driver_flow_bottom_sheets/start_trip_bottom_sheet.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/accepted_order_bottom_sheet.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/filter_bottom_sheet.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/user_waiting_bottom_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DriverOrderStateStream extends StatelessWidget {
  const DriverOrderStateStream({
    super.key,
    required this.user,
  });

  final AuthModel user;

  @override
  Widget build(BuildContext context) {
    double panelHeight = context.getHeight(factor: 0.45);

    Stream<http.Response> getOrders() async* {
      final uri = Uri.parse(
          "https://murny-api.onrender.com/common/get_last_driver_order");

      yield* Stream.periodic(const Duration(seconds: 3), (_) async {
        final res = http.get(uri, headers: {"token": user.token ?? ""});
        final body = await res;
        final order = OrderModel.fromJson(jsonDecode(body.body));
        print(order.runtimeType);
        print(body.body);
        if (context.mounted) {
          context
              .read<OrderStateCubit>()
              .checkOrderState(orderState: order.orderState!.toUpperCase());
        }

        return res;
      }).asyncMap((event) async => await event);
    }

    return BlocConsumer<OrderStateCubit, OrderStateState>(
      buildWhen: (previous, current) =>
          current != previous || current is OrderStateInitial,
      builder: (context, state) {
        return SlidingUpPanel(
          panel: StreamBuilder(
              stream: getOrders(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, dynamic> response =
                      jsonDecode(snapshot.data!.body);

                  if (response.isNotEmpty) {
                    final OrderModel lastOrder = OrderModel.fromJson(response);

                    return state is OrderFilterState
                        ? const StartTripBottomSheet()
                        : state is OrderWaitingState
                            ? AcceptDenyOrderBottomSheet(
                                order: lastOrder,
                                user: user,
                                orderFrom: ProfileModel(),
                              ) //SHOW WAITING LOADING
                            : state is OrderAcceptState
                                ? DriverResponseBottomSheet(
                                    order: lastOrder,
                                    // user: user,
                                  )
                                : const SizedBox();
                  } else {
                    return const StartTripBottomSheet();
                  }
                } else {
                  return const StartTripBottomSheet();
                }
              }),
          maxHeight: panelHeight,
        );
      },
      listener: (BuildContext context, OrderStateState state) {
        state is OrderFilterState
            ? panelHeight = context.getHeight(factor: 0.45)
            : state is OrderWaitingState
                ? panelHeight = context.getHeight(factor: 0.5)
                : panelHeight = context.getHeight(factor: 0.65);
        if (state is OrderStateInitial) {
          panelHeight = context.getHeight(factor: 0.45);
        }
      },
    );
  }
}
