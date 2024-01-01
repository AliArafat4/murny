import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murny_final_project/bloc/image_bloc/image_bloc_bloc.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ImageBloc>();
    // bloc.state is! ImageSuccess ? bloc.add(GetImageEvent()) : SizedBox();
    if (bloc.state is ImageSuccess) {
      bloc.add(GetImageEvent());
    }
    return BlocConsumer<ImageBloc, ImageBlocState>(
      builder: (context, state) {
        return Center(
          child: Stack(
            children: [
              state is ImageSuccess
                  ? state.image == "Not Found"
                      ? const CircleAvatar(
                          radius: 55,
                          foregroundImage: AssetImage(
                              "assets/images/placeHolderAvatar-noback.png"),
                        )
                      : CircleAvatar(
                          radius: 55,
                          foregroundImage: NetworkImage(state.image!),
                        )
                  : const CircleAvatar(
                      radius: 55,
                      foregroundImage: AssetImage(
                          "assets/images/placeHolderAvatar-noback.png"),
                    ),
              Positioned(
                top: 70,
                left: 70,
                child: ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    color: const Color(0xff62c1c7),
                    child: IconButton(
                        onPressed: () {
                          context.read<ImageBloc>().add(AddImageEvent());
                        },
                        icon: const Icon(
                          Icons.upload,
                          color: Colors.white,
                          size: 22,
                        )),
                  ),
                ),
              )
            ],
          ),
        );
      },
      listener: (BuildContext context, ImageBlocState state) {
        state is ImageSuccess
            ? SizedBox()
            : context.read<ImageBloc>().add(GetImageEvent());
      },
    );
  }
}
