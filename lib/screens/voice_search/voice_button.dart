import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class VoiceSearchButton extends StatelessWidget {
  const VoiceSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {},
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          AvatarGlow(
            glowCount: 1,
            duration: const Duration(milliseconds: 1000),
            glowColor: const Color(0xff252C63),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff252C63),
                  width: 2,
                ),
              ),
            ),
          ),
          AvatarGlow(
            glowCount: 1,
            duration: const Duration(milliseconds: 1000),
            glowColor: const Color(0xff252C63),
            child: ClipOval(
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 4,
                color: const Color(0xff252C63).withOpacity(0.8),
              ),
            ),
          ),
          ClipOval(
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 6,
              color: const Color(0xff8E98A8).withOpacity(0.8),
            ),
          ),
          ClipOval(
            child: Container(
              width: MediaQuery.of(context).size.width / 6,
              height: MediaQuery.of(context).size.height / 12,
              color: const Color(0xff252C63).withOpacity(0.8),
              child: const Icon(
                Icons.mic_none_outlined,
                color: Colors.white,
                size: 42,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
