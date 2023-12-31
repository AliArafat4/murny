part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileGetCurrentUserState extends ProfileState {
  final dynamic user;

  ProfileGetCurrentUserState({required this.user});
}

class UpdateUserProfileState extends ProfileState {}

class SuccessUpdateUserProfileState extends ProfileState {}

class UpdateDriverProfileState extends ProfileState {}

class UploadAvatarState extends ProfileState {}

class UploadDriverLicenseState extends ProfileState {}
