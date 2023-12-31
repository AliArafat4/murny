part of 'checkfill_otp_cubit.dart';

@immutable
sealed class CheckfillOtpState {}

final class CheckfillOtpInitialState extends CheckfillOtpState {}

final class FillOTPState extends CheckfillOtpState {}
