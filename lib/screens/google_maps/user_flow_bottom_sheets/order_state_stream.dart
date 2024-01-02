import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:murny_final_project/bloc/order_state_bloc/order_state_cubit.dart';
import 'package:murny_final_project/extentions/size_extention.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/models/order_model.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/accepted_order_bottom_sheet.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/filter_bottom_sheet.dart';
import 'package:murny_final_project/screens/google_maps/user_flow_bottom_sheets/user_waiting_bottom_sheet.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class OrderStateStream extends StatelessWidget {
  const OrderStateStream({
    super.key,
    required this.user,
  });

  final AuthModel user;

  @override
  Widget build(BuildContext context) {
    double panelHeight = context.getHeight(factor: 0.65);

    Stream<http.Response> getOrders() async* {
      final uri =
          Uri.parse("https://murny-api.onrender.com/common/get_user_order");

      yield* Stream.periodic(const Duration(seconds: 5), (_) async {
        final res = http.get(uri, headers: {"token": user.token ?? ""});
        final body = await res;
        final order = jsonDecode(body.body).first['order_state'];

        if (context.mounted) {
          context
              .read<OrderStateCubit>()
              .checkOrderState(orderState: order.toUpperCase());
        }

        return res;
      }).asyncMap((event) async => await event);
    }

    return BlocConsumer<OrderStateCubit, OrderStateState>(
      builder: (context, state) {
        return SlidingUpPanel(
          panel: StreamBuilder(
              stream: getOrders(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List response = jsonDecode(snapshot.data!.body);

                  if (response.isNotEmpty) {
                    final OrderModel lastOrder =
                        OrderModel.fromJson(response.last);

                    return state is OrderFilterState
                        ? const FilterSheet()
                        : state is OrderWaitingState
                            ? UserWaitingBottomSheet(
                                order: lastOrder,
                                user: user,
                              ) //SHOW WAITING LOADING
                            : state is OrderAcceptState
                                ? AcceptedOrderBottomSheet(
                                    order: lastOrder,
                                    user: user,
                                  ) //SHOW DRIVER IS COMING
                                : const SizedBox();
                  } else {
                    return const FilterSheet();
                  }
                } else {
                  return const LinearProgressIndicator();
                }
              }),
          maxHeight: panelHeight,
        );
      },
      listener: (BuildContext context, OrderStateState state) {
        state is OrderFilterState
            ? panelHeight = context.getHeight(factor: 0.45)
            : state is OrderWaitingState
                ? panelHeight = context.getHeight(factor: 0.45)
                : panelHeight = context.getHeight(factor: 0.65);
      },
    );
  }
}
