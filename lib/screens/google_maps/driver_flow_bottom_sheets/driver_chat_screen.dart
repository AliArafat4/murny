import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:http/http.dart' as http;
import 'package:murny_final_project/api/end_points/enums.dart';
import 'package:murny_final_project/api/mury_api.dart';
import 'package:murny_final_project/models/auth_model.dart';
import 'package:murny_final_project/models/chat_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:murny_final_project/models/profile_model.dart';

class DriverChatScreen extends StatelessWidget {
  DriverChatScreen({Key? key, required this.chatWith, required this.user}) : super(key: key);

  final TextEditingController chatController = TextEditingController();
  final ProfileModel chatWith;
  final AuthModel user;
  @override
  Widget build(BuildContext context) {
    Stream<http.Response> getChat() async* {
      final uri = Uri.parse("https://murny-api.onrender.com/chat/get_message");

      yield* Stream.periodic(const Duration(seconds: 2), (_) async {
        final res = http.post(uri,
            body: jsonEncode({"chat_with": chatWith.userId}), headers: {"token": user.token ?? ""});

        return res;
      }).asyncMap((event) async => await event);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${AppLocalizations.of(context)!.chatWith} ${chatWith.name}"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: StreamBuilder(
                stream: getChat(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ChatModel> chatModelList = [];
                    for (var msg in jsonDecode(snapshot.data!.body)) {
                      chatModelList.add(ChatModel.fromJson(msg));
                    }
                    return ListView.builder(
                      shrinkWrap: false,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: chatModelList.length,
                      itemBuilder: (context, index) => SelectableRegion(
                        focusNode: FocusNode(),
                        selectionControls: materialTextSelectionControls,
                        child: BubbleSpecialThree(
                          text: chatModelList[index].message ?? "",
                          color: chatModelList[index].sentTo == chatWith.userId
                              ? const Color(0xFF1B97F3)
                              : const Color(0xFFE8E8EE),
                          tail: chatModelList[index].sentTo == chatWith.userId,
                          textStyle: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          const Spacer(),
          Directionality(
            textDirection: TextDirection.ltr,
            child: MessageBar(
              onSend: (p0) {
                MurnyApi().chat(
                  body: {"sent_to": chatWith.userId, "message": p0},
                  function: Chat.sendMessages,
                  token: user.token ?? "",
                );
              },
            ),
          ),
          // ChatTextField(content: "message", controller: chatController),
          // SizedBox(height: context.getHeight(factor: 0.015)),
        ],
      ),
    );
  }
}
