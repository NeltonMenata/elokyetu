import 'package:flutter/material.dart';

class ResponseCommentPage extends StatefulWidget {
  const ResponseCommentPage({Key? key}) : super(key: key);

  @override
  State<ResponseCommentPage> createState() => _ResponseCommentPageState();
}

class _ResponseCommentPageState extends State<ResponseCommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: .0,
        title: const Text("Respostas"),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: Container(),
    );
  }
}
