import 'package:flutter/material.dart';
import 'package:murny_final_project/screens/success/success.dart';
import 'package:murny_final_project/widgets/comment_text_filed.dart';
import 'package:murny_final_project/widgets/rating.dart';
import 'package:murny_final_project/widgets/second_button.dart';

showSurvyDiolg({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      scrollable: true,
      elevation: 0,
      backgroundColor: Colors.white,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 200),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close)),
            ),
            Image.asset("assets/images/success_blue.png"),
            SizedBox(height: MediaQuery.of(context).size.height / 62),
            const Text(
              "لقد وصلت الى وجهتك",
              style: TextStyle(fontSize: 22),
            ),
            const Divider(),
            const Text("كيف كانت تجربتك؟"),
            const Text("قيمها الان!"),
            Rating(),
            const Divider(),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 20),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text("اضف تعليقك"),
              ),
            ),
            CommentTextFiled(),
            const Text(
                "شكراً، سوف تساعدنا مشاركتك على تحسين تجربة القيادة للأفضل "),
            SizedBox(height: MediaQuery.of(context).size.height / 42),
            SecondButton(
                title: "ارسال",
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) =>
                            SuccessScreen(message: "تم ارسال تقييمك بنجاح"),
                      ),
                      (Route route) => false);
                },
                color: const Color(0xff252C63))
          ],
        ),
      ),
    ),
  );
}
