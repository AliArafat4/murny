import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/radiobutton_bloc/cubit/radiobutton_cubit.dart';
import 'package:murny_final_project/bloc/user_bloc/user_cubit.dart';
import 'package:murny_final_project/method/alert_snackbar.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/screens/balance/payment_radio_button.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Payment { visa, wallet, applePay, cash }

class PaymentTypeScreen extends StatelessWidget {
  const PaymentTypeScreen(
      {super.key,
      required this.driverID,
      required this.currentLocation,
      required this.destination,
      required this.cartID});

  final String driverID, currentLocation, destination;
  final int cartID;

  final Payment selectedValue = Payment.cash;

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
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
              Align(
                alignment: currentLanguage == "ar" ? Alignment.topRight : Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context)!.payment,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
              Align(
                alignment: currentLanguage == "ar" ? Alignment.topRight : Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context)!.selectPaymentMethod,
                  style: const TextStyle(fontSize: 14),
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
                        selectedValue:
                            state is RadioButtonPaymentSelectState ? state.selected : selectedValue,
                        onChange: (value) {
                          context.read<RadiobuttonCubit>().radiobuttonPayment(selectedType: value!);
                        },
                        paymentMethod: AppLocalizations.of(context)!.creditCard,
                        imagePath: "assets/images/visa_icon.png",
                      ),
                      PaymentRadioButton(
                        value: Payment.wallet,
                        selectedValue:
                            state is RadioButtonPaymentSelectState ? state.selected : selectedValue,
                        onChange: (value) {
                          context.read<RadiobuttonCubit>().radiobuttonPayment(selectedType: value!);
                        },
                        paymentMethod: AppLocalizations.of(context)!.wallet,
                        imagePath: "assets/images/wallet_icon.png",
                      ),
                      PaymentRadioButton(
                        value: Payment.cash,
                        selectedValue:
                            state is RadioButtonPaymentSelectState ? state.selected : selectedValue,
                        onChange: (value) {
                          context.read<RadiobuttonCubit>().radiobuttonPayment(selectedType: value!);
                        },
                        paymentMethod: AppLocalizations.of(context)!.cash,
                        imagePath: "assets/images/cash_icon.png",
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is UserLoadingOrderState) {
                    showLoadingDialog(context: context);
                  }
                  if (state is UserSuccessOrderState) {
                    Navigator.pop(context);
                    showSuccessSnackBar(context, "Order has been places successfully");
                    Navigator.pop(context);
                  }
                  if (state is UserErrorOrderState) {
                    showLoadingDialog(context: context);
                    showErrorSnackBar(context, state.errMsg);
                  }
                },
                builder: (context, state) {
                  return PrimaryButton(
                    title: AppLocalizations.of(context)!.confirmation,
                    onPressed: () {
                      context.read<UserCubit>().userPostOrder(
                          driverId: driverID,
                          locationFrom: currentLocation,
                          locationTo: destination,
                          cartId: cartID,
                          paymentMethod: selectedValue.name);
                    },
                    isText: true,
                    isPadding: false,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
