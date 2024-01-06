import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:murny_final_project/bloc/radiobutton_bloc/cubit/radiobutton_cubit.dart';
import 'package:murny_final_project/bloc/upload_licen_bloc/upload_licen_bloc_bloc.dart';
import 'package:murny_final_project/method/alert_snackbar.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/screens/google_maps/google_maps_screen.dart';
import 'package:murny_final_project/screens/splash_screen/splash_signIn_signUp_screen.dart';
import 'package:murny_final_project/widgets/city_dropdown_menu.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/second_button.dart';
import 'package:murny_final_project/widgets/text_field.dart';
import 'package:murny_final_project/widgets/up_side_signin_siginup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateDriverAccountScreen extends StatelessWidget {
  CreateDriverAccountScreen({super.key});

  String? selectedOption = "";

  final TextEditingController conName = TextEditingController();

  final TextEditingController conPhone = TextEditingController();

  final TextEditingController conEmail = TextEditingController();

  final TextEditingController conPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UpSideSigninSignup(
                visibleImage: true,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const SplashSignInSignUpScreen()),
                      (Route route) => false);
                },
              ),
              Align(
                  alignment: currentLanguage == "ar" ? Alignment.topRight : Alignment.topLeft,
                  child: Text(AppLocalizations.of(context)!.createDriverAccount,
                      style: const TextStyle(
                        fontSize: 24,
                      ))),
              SizedBox(
                height: 3.h,
              ),
              TextFieldWidget(
                text: AppLocalizations.of(context)!.fullName,
                typeKeyboard: TextInputType.name,
                scure: false,
                visiblePhone: false,
                controller: conName,
                isEditAccount: false,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFieldWidget(
                text: AppLocalizations.of(context)!.mobilNumber,
                typeKeyboard: TextInputType.phone,
                scure: false,
                visiblePhone: true,
                controller: conPhone,
                isEditAccount: false,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFieldWidget(
                text: AppLocalizations.of(context)!.email,
                typeKeyboard: TextInputType.emailAddress,
                scure: false,
                visiblePhone: false,
                controller: conEmail,
                isEditAccount: false,
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFieldWidget(
                text: AppLocalizations.of(context)!.password,
                typeKeyboard: TextInputType.visiblePassword,
                scure: true,
                visiblePhone: false,
                controller: conPass,
                isEditAccount: false,
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: currentLanguage == "ar" ? Alignment.topRight : Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context)!.gender,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              BlocBuilder<RadiobuttonCubit, RadiobuttonState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Radio(
                        value: "male",
                        groupValue:
                            state is RadioButtonGenderSelectState ? state.selected : selectedOption,
                        onChanged: (value) {
                          context.read<RadiobuttonCubit>().radiobuttonGender(selectedType: value!);
                        },
                      ),
                      const Icon(
                        Icons.boy,
                        size: 32,
                      ),
                      Radio(
                        value: "female",
                        groupValue:
                            state is RadioButtonGenderSelectState ? state.selected : selectedOption,
                        onChanged: (value) {
                          context.read<RadiobuttonCubit>().radiobuttonGender(selectedType: value!);
                        },
                      ),
                      const Icon(
                        Icons.girl,
                        size: 32,
                      ),
                      const Spacer(),
                      const CityDropDownMenu(),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: currentLanguage == "ar" ? Alignment.topRight : Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context)!.uploadDriverLicense,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 52,
              ),
              BlocListener<UploadLicenBloc, UploadLicenState>(
                listener: (context, state) {
                  // TODO: implement listener

                  if (state is UploadLicenSuccess) {
                    showSuccessSnackBar(context, "Driver license has been added successfully");
                  }
                },
                child: Center(
                  child: SecondButton(
                    title: AppLocalizations.of(context)!.driverLicense,
                    onPressed: () {
                      context.read<UploadLicenBloc>().add(UploadLicen());
                    },
                    color: Colors.white,
                    isFill: false,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 82,
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.allowedFiles,
                  style: const TextStyle(color: Color(0xff8E98A8)),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              BlocConsumer<AuthBloc, AuthState>(
                buildWhen: (previous, current) => current is AuthDriverRegisterErrorState,
                builder: (context, state) {
                  return PrimaryButton(
                    isText: true,
                    isPadding: false,
                    title: AppLocalizations.of(context)!.subscribing,
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthRegisterDriverEvent(
                                phone: conPhone.text,
                                email: conEmail.text,
                                password: conPass.text,
                                userName: conName.text,
                                gender: selectedOption!,
                                //TODO: GET LICENSE
                                license: '',
                                city: selectedOption ?? ""),
                          );
                    },
                  );
                },
                listener: (BuildContext context, AuthState state) {
                  state is LoadingState ? showLoadingDialog(context: context) : const SizedBox();

                  if (state is AuthDriverRegisterErrorState) {
                    Navigator.pop(context);
                    showErrorSnackBar(context, state.errorMsg);
                  }

                  state is AuthRegisterDriverEvent
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GoogleMapScreen(),
                          ),
                        )
                      : const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
