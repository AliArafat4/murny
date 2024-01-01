part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class ProfileGetCurrentUserEvent extends ProfileEvent {}

//TODO: IMPLEMENT
class UpdateUserProfileEvent extends ProfileEvent {
  final String fullName;
  final String userName;
  final String phone;
  UpdateUserProfileEvent(
      {required this.fullName, required this.userName, required this.phone});
}

//TODO: IMPLEMENT
class UpdateDriverProfileEvent extends ProfileEvent {}

class UploadAvatarEvent extends ProfileEvent {
  final Uint8List avatar;

  UploadAvatarEvent({required this.avatar});
}

class UploadDriverLicenseEvent extends ProfileEvent {
  final Uint8List license;

  UploadDriverLicenseEvent({required this.license});
}
