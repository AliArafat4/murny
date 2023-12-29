import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/bloc/map_bloc/map_bloc.dart';
import 'package:murny_final_project/bloc/public_bloc/public_cubit.dart';
import 'package:murny_final_project/extentions/size_extention.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/method/show_main_bottom_sheet.dart';
import 'package:murny_final_project/method/show_order_bottom_sheet.dart';
import 'package:murny_final_project/screens/balance/payment_type.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/golf_cart_detail.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Marker> driversMarker = [];

    //TODO: USER PERMISSION
    // final isAllowed = await userPermission();
    // if (isAllowed) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) =>
    //           const GoogleMapScreen()));
    // }
    GoogleMapController? googleMapController;

    CameraPosition initialCameraPosition;
    initialCameraPosition = const CameraPosition(target: LatLng(0, 0), zoom: 10);
    Map<PolylineId, Polyline> distance = {};

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: BlocConsumer<MapBloc, MapState>(
                builder: (context, state) {
                  return SlidingUpPanel(
                    body: GoogleMap(
                      compassEnabled: true,
                      // mapToolbarEnabled: true,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      mapType: MapType.normal, // MapType.satellite, //,
                      polylines: Set<Polyline>.of(distance.values),
                      markers: Set.from(driversMarker),
                      initialCameraPosition: initialCameraPosition,
                      onMapCreated: (GoogleMapController controller) {
                        googleMapController = controller;
                        context.read<MapBloc>().add(MapGetCurrentLocationEvent());
                        context.read<MapBloc>().add(MapGetDriversMarkerEvent());
                      },
                      onTap: (location) async {
                        print("location");
                        print(location);
                        // MurnyApi().signOut(context: context);
                      },
                    ),
                    panel: const FilterSheet(),
                    maxHeight: context.getHeight(factor: 0.45),
                  );
                },
                listener: (BuildContext context, MapState state) async {
                  //GO TO USER LOCATION
                  if (state is MapGetCurrentLocationState) {
                    googleMapController?.animateCamera(CameraUpdate.newLatLngZoom(
                        LatLng(state.userLocation.latitude, state.userLocation.longitude), 10));
                  }

                  //Add drivers markers to the map
                  if (state is MapGetDriversMarkerState) {
                    Navigator.pop(context);
                    for (var marker in state.driverModelList) {
                      driversMarker.add(Marker(
                          markerId: MarkerId((marker.userId.toString())),
                          position: LatLng(marker.lat!, marker.lng!),
                          icon: await BitmapDescriptor.fromAssetImage(
                              const ImageConfiguration(), "assets/images/markerX3.png"),
                          onTap: () {
                            print(marker.userId);

                            print(marker.lat!);
                            print(marker.lng!);
                            print("marker.lng!");

                            showOrderBottomSheet(context: context);
                          }));
                    }
                  }

                  //filter drivers markers on the map
                  if (state is MapFilterDriversMarkerState) {
                    context.mounted ? Navigator.pop(context) : const SizedBox();
                    if (state.driverModelList.isNotEmpty) {
                      for (var marker in state.driverModelList) {
                        driversMarker.clear();
                        driversMarker.add(Marker(
                            markerId: MarkerId((marker.userId.toString())),
                            position: LatLng(marker.lat!, marker.lng!),
                            icon: await BitmapDescriptor.fromAssetImage(
                                const ImageConfiguration(), "assets/images/markerX3.png"),
                            onTap: () {
                              showOrderBottomSheet(context: context);
                            }));
                      }
                    } else {
                      driversMarker.clear();
                    }
                  }

                  if (context.mounted) {
                    state is MapLoadingState
                        ? showLoadingDialog(context: context)
                        : const SizedBox();
                  }
                },
              ),
            ),
            //TODO: ADD WIDGETS HERE
          ],
        ),
      ),
    );
  }
}

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
            const BookLocation(
              locationFrom: "موقعك الحالي",
              locationTo: "الى أين تريد/ين الذهاب",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 42,
            ),
            const Text(
              "اختر نوع العربة المناسبة لك",
              style: TextStyle(fontSize: 18),
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
                            numberOfSeat: "${state.cartModel[index].seats} مقاعد",
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
