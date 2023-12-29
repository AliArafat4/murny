import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/bloc/select_cart_bloc/select_cart_cubit.dart';

class GolfCartDetail extends StatelessWidget {
  const GolfCartDetail(
      {super.key,
      required this.numberOfSeat,
      required this.price,
      required this.onTap,
      required this.index,
      required this.cartID});
  final String numberOfSeat;
  final String price;
  final int Function() onTap;
  final int index;
  final String cartID;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectCartCubit, SelectCartState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<SelectCartCubit>().selectCart(selectedCart: onTap.call());

            context.read<MapBloc>().add(MapFilterDriversMarkerEvent(cartTierID: cartID));
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
                color: state is SelectCartSwichState
                    ? state.selected == index
                        ? const Color(0xff252C63)
                        : Colors.transparent
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xff252C63), width: 4)),
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Image.asset(
                    "assets/images/golf_cart_icon.png",
                    color: state is SelectCartSwichState
                        ? state.selected == index
                            ? Colors.white
                            : Colors.black
                        : Colors.black,
                  )),
                  Flexible(
                      child: Text(
                    numberOfSeat,
                    style: TextStyle(
                      color: state is SelectCartSwichState
                          ? state.selected == index
                              ? Colors.white
                              : Colors.black
                          : Colors.black,
                    ),
                  )),
                  Flexible(
                      child: Text(
                    price,
                    style: TextStyle(
                      color: state is SelectCartSwichState
                          ? state.selected == index
                              ? Colors.white
                              : Colors.black
                          : Colors.black,
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
