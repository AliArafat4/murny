import 'package:flutter/material.dart';
import 'package:murny_final_project/widgets/book_location.dart';
import 'package:murny_final_project/widgets/cart_detil.dart';
import 'package:murny_final_project/widgets/driver_rate.dart';
import 'package:murny_final_project/widgets/payment_method.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:murny_final_project/widgets/trip_detil.dart';

class AcceptOrderBottomSheet extends StatelessWidget {
  const AcceptOrderBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              const Text(
                "عربتك في الطريق إليك",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              const TripDetil(
                tripStartTime: "9:42AM",
                destinationArrivalTime: "10:30AM",
              ),
              Row(
                children: [
                  Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: const Color(0xff252C63), width: 2)),
                      child: Image.asset(
                        "assets/images/driver_profile.png",
                        width: MediaQuery.of(context).size.width / 6,
                      ),
                    ),
                    Container(
                      child: const DriverRate(rate: "5.0"),
                    )
                  ]),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 32,
                  ),
                  const Text("عبدالرحمن حاتم"),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              const Divider(
                thickness: 8,
                color: Color(0xffF4F4F4),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              const BookLocation(
                locationFrom: "كلية الصيدلة A2",
                locationTo: "كلية علوم الحاسب والمعلومات A3",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              const Divider(
                thickness: 8,
                color: Color(0xffF4F4F4),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 120,
              ),
              const CartDetil(
                numberOfCartSeat: "عربة جولف 4 مقاعد",
              ),
              const Divider(
                color: Color(0xffF4F4F4),
              ),
              const PaymentMethod(
                paymentMethod: "ابل باي",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 120,
              ),
              const Divider(
                thickness: 8,
                color: Color(0xffF4F4F4),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 82,
              ),
              Center(
                child: SecondButton(
                  title: "إلغاء الطلب",
                  onPressed: () {},
                  color: const Color(0xffF21D53),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
