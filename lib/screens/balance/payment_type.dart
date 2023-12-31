import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/radiobutton_bloc/cubit/radiobutton_cubit.dart';
import 'package:murny_final_project/screens/balance/payment_radio_button.dart';
import 'package:murny_final_project/widgets/primary_button.dart';

class PaymentTypeScreen extends StatelessWidget {
  PaymentTypeScreen({super.key});

  Payment selectedValue = Payment.cash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.width / 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "الدفع",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              const Align(
                alignment: Alignment.topRight,
                child: Text(
                  "اختر طريقة الدفع المناسبة لك",
                  style: TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 42,
              ),
              BlocBuilder<RadiobuttonCubit, RadiobuttonState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      PaymentRadioButton(
                        value: Payment.visa,
                        selectedValue: state is RadioButtonPaymentSelectState
                            ? state.selected
                            : selectedValue,
                        onChange: (value) {
                          context
                              .read<RadiobuttonCubit>()
                              .radiobuttonPayment(selectedType: value!);
                        },
                        paymentMethod: "البطاقة الإئتمانية",
                        imagePath: "assets/images/visa_icon.png",
                      ),
                      PaymentRadioButton(
                        value: Payment.wallet,
                        selectedValue: state is RadioButtonPaymentSelectState
                            ? state.selected
                            : selectedValue,
                        onChange: (value) {
                          context
                              .read<RadiobuttonCubit>()
                              .radiobuttonPayment(selectedType: value!);
                        },
                        paymentMethod: "المحفظة",
                        imagePath: "assets/images/wallet_icon.png",
                      ),
                      PaymentRadioButton(
                        value: Payment.cash,
                        selectedValue: state is RadioButtonPaymentSelectState
                            ? state.selected
                            : selectedValue,
                        onChange: (value) {
                          context
                              .read<RadiobuttonCubit>()
                              .radiobuttonPayment(selectedType: value!);
                        },
                        paymentMethod: "نقداً",
                        imagePath: "assets/images/cash_icon.png",
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              PrimaryButton(
                title: "تأكيد الطلب",
                onPressed: () {},
                isText: true,
                isPadding: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum Payment { visa, wallet, applePay, cash }
