import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/models/profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    final AuthModel currentUser = AuthModel.fromJson(jsonDecode(pref.getUser()));

    on<ProfileGetCurrentUserEvent>((event, emit) async {
      final ProfileModel user = await MurnyApi()
          .profile(body: {}, token: currentUser.token ?? "", function: Profile.getProfile);
      emit(ProfileGetCurrentUserState(user: user));
    });

    on<UpdateUserProfileEvent>((event, emit) async {
      await MurnyApi().profile(
          body: {"name": event.fullName, "username": event.userName, "phone": event.phone},
          function: Profile.updateUserProfile,
          token: currentUser.token ?? "");

      emit(SuccessUpdateUserProfileState());
    });
////
    on<UpdateDriverProfileEvent>((event, emit) async {
      await MurnyApi().profile(body: {
        //TODO: GET BODY
      }, function: Profile.updateDriverProfile, token: currentUser.token ?? "");
    });

    on<UploadAvatarEvent>((event, emit) async {
      await MurnyApi().profile(body: {
        //TODO: GET BODY
      }, function: Profile.uploadAvatar, token: currentUser.token ?? "");
    });

    on<UploadDriverLicenseEvent>((event, emit) async {
      await MurnyApi().profile(body: {
        //TODO: GET BODY
      }, function: Profile.uploadDriverLicense, token: currentUser.token ?? "");
    });
  }
}
