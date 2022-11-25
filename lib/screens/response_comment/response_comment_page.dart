import 'package:elokyetu/models/comment_model/comment_widget.dart';
import 'package:elokyetu/screens/comment/comment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponseCommentPage extends StatefulWidget {
  const ResponseCommentPage({Key? key}) : super(key: key);

  @override
  State<ResponseCommentPage> createState() => _ResponseCommentPageState();
}

class _ResponseCommentPageState extends State<ResponseCommentPage> {
  @override
  Widget build(BuildContext context) {
    final size = Get.size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: .0,
        title: const Text("Respostas"),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CommentWidget(
            commentModel: CommentModel(
                comment: "comment",
                name: "autor",
                createdAt: DateTime.now(),
                objectId: "objectId"),
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.2),
            child: Column(
              children: List.generate(
                12,
                (index) => CommentWidget(
                  commentModel: CommentModel(
                      comment: "comment",
                      name: "autor",
                      createdAt: DateTime.now(),
                      objectId: "objectId"),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
