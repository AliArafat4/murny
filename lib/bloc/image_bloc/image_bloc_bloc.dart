import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/main.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/models/profile_model.dart';
part 'image_bloc_event.dart';
part 'image_bloc_state.dart';

class ImageBloc extends Bloc<ImageBlocEvent, ImageBlocState> {
  ImageBloc() : super(ImageBlocInitial()) {
    final AuthModel currentUser =
        AuthModel.fromJson(jsonDecode(pref.getUser()));
    on<AddImageEvent>((event, emit) async {
      // TODO: implement event handler

      final ImagePicker picker = ImagePicker();

      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      //print("here is ${await image.readAsBytes()}");
      await MurnyApi().profile(
          body: {"image": await image.readAsBytes()},
          function: Profile.uploadAvatar,
          token: currentUser.token!);

      emit(SuccessUpladImage());
    });
    on<GetImageEvent>(
      (event, emit) async {
        // TODO: implement event handler

        final ProfileModel getImage = await MurnyApi().profile(
            body: {}, function: Profile.getProfile, token: currentUser.token!);
        //print("get my image ${getImage.image}");
        emit(ImageSuccess(image: getImage.image.toString()));
      },
    );
  }
}
