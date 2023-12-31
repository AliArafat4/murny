import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/check_box_bloc/cubit/checkbox_cubit.dart';
import 'package:murny_final_project/navigations/navigation_methods.dart';
import 'package:murny_final_project/screens/google_maps/google_maps_screen.dart';
import 'package:murny_final_project/screens/signIn_signUp/sign_in_screen.dart';
import 'package:murny_final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:murny_final_project/method/alert_snackbar.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/widgets/account_text.dart';
import 'package:murny_final_project/widgets/primary_button.dart';
import 'package:murny_final_project/widgets/text_field.dart';
import 'package:murny_final_project/widgets/up_side_signin_siginup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    String currentLanguage = myLocale.languageCode;

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: SingleChildScrollView(
            child: Column(children: [
              UpSideSigninSignup(
                visibleImage: true,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Align(
                  alignment: currentLanguage == 'ar' ? Alignment.topRight : Alignment.topLeft,
                  child: Text(AppLocalizations.of(context)!.signUp,
                      style: const TextStyle(
                        fontSize: 28,
                        //  color: Color(0xff252C63),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BlocBuilder<CheckboxCubit, CheckboxState>(
                    builder: (context, state) {
                      return Checkbox(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        value: state is CheckboxSignupSelectState ? state.selected : false,
                        onChanged: (value) {
                          context.read<CheckboxCubit>().checkboxSignUp(select: value!);
                        },
                      );
                    },
                  ),
                  Flexible(
                    child: Text(
                      AppLocalizations.of(context)!.subscribingAgree,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              BlocConsumer<AuthBloc, AuthState>(
                buildWhen: (previous, current) => current is AuthUserRegisterErrorState,
                builder: (context, state) {
                  return PrimaryButton(
                      isText: true,
                      isPadding: false,
                      title: AppLocalizations.of(context)!.subscribing,
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthRegisterUserEvent(
                            phone: conPhone.text,
                            email: conEmail.text,
                            password: conPass.text,
                            userName: conName.text));
                      });
                },
                listener: (BuildContext context, AuthState state) {
                  state is LoadingState ? showLoadingDialog(context: context) : const SizedBox();

                  if (state is AuthUserRegisterErrorState) {
                    Navigator.pop(context);
                    showErrorSnackBar(context, state.errorMsg);
                  }

                  state is AuthRegisterSuccessState
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const GoogleMapScreen()),
                        )
                      : const SizedBox();
                },
              ),
              SizedBox(
                height: 1.h,
              ),
              // const DividerSigninSignup(),
              // SizedBox(
              //   height: 1.h,
              // ),
              // PrimaryButton(
              //   buttonColor: Colors.transparent,
              //   onPressed: () {},
              //   text: AppLocalizations.of(context)!.signUpGmail,
              //   image: 'assets/images/gmail.svg',
              //   isText: false,
              //   isPadding: false,
              // ),
              // SizedBox(
              //   height: 1.h,
              // ),
              // PrimaryButton(
              //   buttonColor: Colors.transparent,
              //   onPressed: () {},
              //   text: AppLocalizations.of(context)!.signUpApple,
              //   image: 'assets/images/Apple.svg',
              //   isText: false,
              //   isPadding: true,
              // ),
              SizedBox(
                height: 2.h,
              ),
              AccountText(
                firstText: AppLocalizations.of(context)!.signIn,
                secondText: AppLocalizations.of(context)!.doHaveAccount,
                pushNavi: () {
                  navigation(
                    context: context,
                    type: 'push',
                    screen: SignInScreen(),
                  );
                },
              ),
            ]),
          ),
        )));
  }
}

TextEditingController conName = TextEditingController();
TextEditingController conPhone = TextEditingController();
TextEditingController conEmail = TextEditingController();
TextEditingController conPass = TextEditingController();
