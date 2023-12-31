import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class CommentTextFiled extends StatelessWidget {
  CommentTextFiled({super.key});
  TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width / 100),
      child: TextField(
        controller: commentController,
        maxLines: 4,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff252C63), width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xff252C63), width: 1),
          ),
          hintText: AppLocalizations.of(context)!.writeHere,
          hintStyle: const TextStyle(
            color: Color(0xffB8B8B8),
          ),
        ),
      ),
    );
  }
}
