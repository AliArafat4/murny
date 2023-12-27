part of 'profile_bloc.dart';

abstract class ProfileEvent {}

abstract class ProfileGetCurrentUserEvent extends ProfileEvent {}

//TODO: IMPLEMENT
abstract class UpdateUserProfileEvent extends ProfileEvent {}

//TODO: IMPLEMENT
abstract class UpdateDriverProfileEvent extends ProfileEvent {}

abstract class UploadAvatarEvent extends ProfileEvent {
  final Uint8List avatar;

  UploadAvatarEvent({required this.avatar});
}

abstract class UploadDriverLicenseEvent extends ProfileEvent {
  final Uint8List license;

  UploadDriverLicenseEvent({required this.license});
}
