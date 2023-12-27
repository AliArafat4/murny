part of 'check_token_cubit.dart';

abstract class CheckTokenState {}

class CheckTokenInitial extends CheckTokenState {}

class ValidTokenState extends CheckTokenState {}

class InvalidTokenState extends CheckTokenState {}
