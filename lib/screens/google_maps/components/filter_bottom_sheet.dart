import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/bloc/public_bloc/public_cubit.dart';
import 'package:murny_final_project/bloc/select_cart_bloc/select_cart_cubit.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/golf_cart_detail.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<PublicCubit>().getAllCartsCubit();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 42,
            ),
            BlocBuilder<MapBloc, MapState>(
              buildWhen: (previous, current) =>
                  current is MapGetCurrentLocationState,
              builder: (context, state) {
                return BookLocation(
                  locationFrom: state is MapGetCurrentLocationState
                      ? state.locationName.toString()
                      : "موقعك الحالي",
                  locationTo: "الى أين تريد/ين الذهاب",
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 42,
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "اختر نوع العربة المناسبة لك",
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<MapBloc>().add(MapGetDriversMarkerEvent());
                        context
                            .read<SelectCartCubit>()
                            .selectCart(selectedCart: -1);
                      },
                      icon: const Icon(Icons.drive_eta_outlined))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 62,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6.5,
              child: BlocBuilder<PublicCubit, PublicState>(
                builder: (context, state) {
                  return state is PublicGetCartsState
                      ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.cartModel.length,
                          separatorBuilder: (context, index) => SizedBox(
                            width: MediaQuery.of(context).size.width / 20,
                          ),
                          itemBuilder: (context, index) => GolfCartDetail(
                            numberOfSeat:
                                "${state.cartModel[index].seats} مقاعد",
                            price: "${state.cartModel[index].price} SAR",
                            onTap: () {
                              return index;
                            },
                            index: index,
                            cartID: state.cartModel[index].id!.toString(),
                          ),
                        )
                      : const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
