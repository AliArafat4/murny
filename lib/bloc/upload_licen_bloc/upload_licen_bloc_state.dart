part of 'upload_licen_bloc_bloc.dart';

@immutable
sealed class UploadLicenState {}

final class UploadLicenInitial extends UploadLicenState {}

final class UploadLicenSuccess extends UploadLicenState {}
