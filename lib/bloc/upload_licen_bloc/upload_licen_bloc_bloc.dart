import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/models/auth_model.dart';
part 'upload_licen_bloc_event.dart';
part 'upload_licen_bloc_state.dart';

class UploadLicenBloc extends Bloc<UploadLicenEvent, UploadLicenState> {
  final AuthModel currentUser = AuthModel.fromJson(jsonDecode(pref.getUser()));
  UploadLicenBloc() : super(UploadLicenInitial()) {
    on<UploadLicenEvent>((event, emit) async {
      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      await MurnyApi().profile(
          body: {"image": await image.readAsBytes()},
          function: Profile.uploadDriverLicense,
          token: currentUser.token!);

      emit(UploadLicenSuccess());
    });
  }
}
