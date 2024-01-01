abstract class LocaleEvent {}

class ChangeLocaleEvent extends LocaleEvent {
  final String languageCode;

  ChangeLocaleEvent(this.languageCode);
}

class GetLocaleEvent extends LocaleEvent {
  final String languageCode;

  GetLocaleEvent(this.languageCode);
}
