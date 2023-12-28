import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:murny_final_project/bloc/radiobutton_bloc/cubit/radiobutton_cubit.dart';

import 'package:murny_final_project/bloc/auth_bloc/auth_bloc.dart';
import 'package:murny_final_project/method/alert_snackbar.dart';
import 'package:murny_final_project/method/show_loading.dart';
import 'package:murny_final_project/screens/google_maps_screen.dart';

import 'package:murny_final_project/widgets/account_text.dart';
import 'package:murny_final_project/widgets/up_side_signin_siginup.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//-----------------CONVERT To Bloc----------------------
class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.email});

  final String email;
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController conOtp = TextEditingController();

  bool isVisible = false;

  updateButtonVisibility() {
    bool isFilled = conOtp.text.length == 6;

    setState(() {
      isVisible = isFilled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Padding(
          padding: EdgeInsets.only(
            top: 20.sp,
          ),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(right: 20.sp),
              child: UpSideSigninSignup(
                onTap: () {
                  Navigator.pop(context);
                },
                visibleImage: false,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Column(
              children: [
                Visibility(
                  child: isVisible
                      ? Text(
                          AppLocalizations.of(context)!.otpSuccessSend,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        )
                      : Text(
                          AppLocalizations.of(context)!.otpSuccessSend,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w400),
                        ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(AppLocalizations.of(context)!.enterOTP,
                    style: TextStyle(color: Color(0xff8E98A8), fontSize: 16),
                    textDirection: TextDirection.rtl),
              ],
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 77.w,
              height: 5.5.h,
              child: PinFieldAutoFill(
                currentCode: conOtp.text,
                decoration: BoxLooseDecoration(
                    strokeWidth: 0.71,
                    radius: const Radius.circular(7.08),
                    strokeColorBuilder:
                        const FixedColorBuilder(Color(0xffD0D0D0))),
                codeLength: 6,
                onCodeChanged: (value) {
                  print(value);
                  setState(() {
                    conOtp.text = value!;
                    updateButtonVisibility();
                  });
                },
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Visibility(
                child: isVisible
                    ? Container()
                    : AccountText(
                        firstText: AppLocalizations.of(context)!.reSendOtp,
                        secondText: AppLocalizations.of(context)!.notReceiveOtp,
                        pushNavi: () {},
                      )),
            const SizedBox(
              height: 100,
            ),
            Visibility(
              visible: isVisible,
              child: SizedBox(
                height: 54,
                width: 340,
                child: BlocConsumer<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff252C63))),
                        onPressed: () {
                          context.read<AuthBloc>().add(AuthOTPEvent(
                              email: widget.email, otp: conOtp.text));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.verify,
                          style:
                              TextStyle(color: Color(0xffFFFFFF), fontSize: 16),
                        ));
                  },
                  listener: (context, state) {
                    state is LoadingState
                        ? showLoadingDialog(context: context)
                        : const SizedBox();

                    if (state is AuthOTPErrorState) {
                      Navigator.pop(context);
                      showErrorSnackBar(context, state.errorMsg);
                    }

                    state is AuthOTPSuccessState
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GoogleMapScreen()),
                          )
                        : const SizedBox();
                  },
                ),
              ),
            )
          ]),
        ));
  }
}
