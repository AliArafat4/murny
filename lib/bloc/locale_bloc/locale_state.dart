import 'dart:ui';

abstract class LocaleState {}

class InitialState extends LocaleState {}

class LocaleUpdateState extends LocaleState {
  final Locale locale;

  LocaleUpdateState(this.locale);
}

class GetLocaleState extends LocaleState {
  final Locale locale;

  GetLocaleState(this.locale);
}
