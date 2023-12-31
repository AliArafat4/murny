import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'checkfill_otp_state.dart';

class CheckfillOtpCubit extends Cubit<CheckfillOtpState> {
  CheckfillOtpCubit() : super(CheckfillOtpInitialState());
  checkFillOTP() {}
}
